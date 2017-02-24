const MongoClient = require('mongodb').MongoClient;

MongoClient.connect('mongodb://localhost:27017/TodoApp', (err, db) => {
  if (err) {
    return console.log('unable to connect to db server');
  }
  console.log('connected to mongodb server');

  // db.collection('Todos').insertOne({
  //   text: 'first todo',
  //   completed: false
  // }, (err, result) => {
  //   if (err) {
  //     return console.log('unable to insert to-do', err);
  //   }
  //   console.log(JSON.stringify(result.ops, undefined, 2));
  //
  // })

  db.collection('Users').insertOne({
    name: 'Andrew',
    age: 25,
    location: 'SF'
  }, (err, result) => {
    if (err) {
      return console.log('unable to insert user', err);
    }
    console.log(result.ops[0]._id);
  })

  db.close();
});
