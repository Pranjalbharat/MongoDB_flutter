import 'dart:async';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:mongodb_flutter/Pages/user.dart';
import 'package:mongodb_flutter/Database/constant.dart';
class MongoDatabase{
static var db,userCollection;

//for establishing connection
  static connect() async{
  db=await Db.create(MONGO_CONN_URL);
  await db.open();
  userCollection=db.collection(USER_COLLECTIONS);
  }

//insert for creating a new document
  static insert(User user) async{
    await userCollection.insertAll([user.toMap]);
  }


// to read the data from mongodb
  static Future<List<Map<String,dynamic>>> getDocuments() async{
    try{
      final users=await userCollection.find().toList();
      return users;
    }
    catch(e){
      print(e);
      return Future.value(e as FutureOr<List<Map<String, dynamic>>>?);
    }
  }

static Update(User user) async{
  var u=await userCollection.findOne({"_id":user.id});
  u["name"]=user.name;
  u["age"]=user.age;
  u["phone"]=user.phone;
  await userCollection.save(u);
}

static delete(User user) async{
  await userCollection.remove(where.id(user.id));
}



}