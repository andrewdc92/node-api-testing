const mongoose = require('mongoose');
const validator = require('validator');
const jwt = require('jsonwebtoken');
const _ = require('lodash');
const bcrpyt = require('bcryptjs');

//'new' denotes constuctor fn :)
var UserSchema = new mongoose.Schema({
  email: {
    type: String,
    required: true,
    trim: true,
    minlength: 1,
    unique: true,
    validate: {
      validator: validator.isEmail,
      message: '{VALUE} is not a valid email address'
    }
  },
    password: {
      type: String,
      require: true,
      minlength: 6
    },
    tokens: [{
      access: {
        type: String,
        require: true
      },
      token: {
        type: String,
        required: true
      }
    }]
});

UserSchema.methods.toJSON = function () {
  var user = this;
  var userObject = user.toObject();

  return _.pick(userObject, ['_id', 'email']);
};

UserSchema.methods.generateAuthToken = function () {
  var user = this;
  var access = 'auth';
  var token = jwt.sign({_id: user._id.toHexString(), access}, 'abc123').toString();

  user.tokens.push({access, token})

  return user.save().then(() => {
      return token;
  });
};

UserSchema.statics.findByToken = function (token) {
  var User = this;
  var decoded;

  try {
    decoded = jwt.verify(token, 'abc123')
  } catch (e) {
    return Promise.reject();
  }

  return User.findOne({
    '_id': decoded._id,
    'tokens.token': token,
    'tokens.access': 'auth'
  });
};

UserSchema.pre('save', function (next) {
  var user = this;

  //isModified returns a boolean if obj was modified
   if (user.isModified('password')) {
     bcrpyt.genSalt(10, (err, salt) => {
       bcrpyt.hash(user.password, salt, (err, hash) => {
         user.password = hash;
         next();
       });
     });
   } else {
     next();
   }
});

var User = mongoose.model('User', UserSchema );

module.exports = {User};
