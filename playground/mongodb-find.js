const {MongoClient, ObjectID} = require('mongodb');

MongoClient.connect('mongodb://localhost:27017/TodoApp', (err, db) => {
  if (err) {
    return console.log('unable to connect to db server');
  }
  console.log('connected to mongodb server');

//find without passing parameters returns all
db.collection('Todos').find().toArray().then((docs) => {
  console.log('Todos');
  console.log(JSON.stringify(docs, undefined, 2));
}, (err) => {
  console.log('unable to fetch to-dos', err);
});

  // db.close();
});
