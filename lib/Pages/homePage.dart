// ignore: file_names
import 'package:flutter/material.dart';
import 'package:mongodb_flutter/Database/database.dart';
import 'package:mongodb_flutter/Pages/add_user.dart';
import 'package:mongodb_flutter/Pages/user.dart';
import 'package:mongodb_flutter/components/user_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initstate(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder( 
      future: MongoDatabase.getDocuments(),
      builder:(context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return Container(
            color: Colors.white,
            child: const LinearProgressIndicator(backgroundColor: Colors.black,),
          );
        }else{
          if(snapshot.hasError){
            return Container(
              color: Colors.white,
              child: Center(child: Text('Something went wrong, try again.',
              style: Theme.of(context).textTheme.headlineMedium,),),
            );
          }else{
            return Scaffold(
              appBar: AppBar(title: const Text('Flutter_MongoDB'),),
              body: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(padding: const EdgeInsets.all(8.0),
                  child: UserCard(
                    user: User.fromMap(snapshot.data![index]),
                    onTapDelete: () async{
                      _deleteUser(User.fromMap(snapshot.data![index]));
                    },
                    onTapEdit: () async{
                      Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){return const AddUserPage();},),);
                    },

                  ),);
                },
              ),
            );
          }
        }
      });
  }

  _deleteUser(User user) async {
    await MongoDatabase.delete(user);
    setState(() {});
  }
}