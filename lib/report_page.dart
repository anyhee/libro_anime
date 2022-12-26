import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'addnote.dart';
import 'editnote.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Student report",
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Color.fromARGB(255, 0, 11, 133),
//       ),
//       home: ReportPage(),
//     );
//   }
// }

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('report').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Students',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            child: MaterialButton(
              color: Colors.pinkAccent,
              child: Text('Agregar'),
              onPressed:(){
                 Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => addnote()));
              } ),
          )
        ],
      ),
      body: StreamBuilder(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          editnote(docid: snapshot.data!.docs[index]),
                    ),
                  );
                },
                child: Column(
                  children: [
                    SizedBox(height:10),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 81, 196, 186).withOpacity(.2),
                      ),
                      
                      child: ListTile(
                        title: Text(
                          'Anime: ${snapshot.data!.docChanges[index].doc['name']}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        // 
                        subtitle: Text(
                          'Autor: ${snapshot.data!.docChanges[index].doc['Maths']}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        trailing: Column(
                          children: [
                            Text(
                              '${DateTime.now().day}/ ${DateTime.now().month}/${DateTime.now().year}',
                              style: TextStyle(fontSize: 10),
                              ),
                            Text(
                              '${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}',
                              style: TextStyle(fontSize: 11),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}