import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'report_page.dart';

class addnote extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController subject1 = TextEditingController();
  TextEditingController subject2 = TextEditingController();
  TextEditingController subject3 = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('report');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            child: MaterialButton(
              color: Colors.pink,
              onPressed: () {
                ref.add({
                  'name': name.text,
                  'Maths': subject1.text,
                  'Science': subject2.text,
                  'History': subject3.text
                }).whenComplete(() {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => ReportPage()));
                });
              },
              child: Text(
                "Guardar",
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 251, 251, 251),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: MaterialButton(
              color: Colors.pink,
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => ReportPage()));
              },
              child: Text(
                "atras",
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 251, 251, 251),
                ),
              ),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                  hintText: 'nombre anime',
                  filled: true,
                  fillColor: Colors.black12,
                  enabled: true,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: subject1,
                maxLines: null,
                keyboardType: TextInputType.text,//TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Autor',
                  filled: true,
                  fillColor: Colors.black12,
                  enabled: true,
                  contentPadding: const EdgeInsets.only(
                      left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: subject2,
                maxLines: 6,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Descripcion',
                  filled: true,
                   fillColor: Colors.black12,
                  enabled: true,
                  contentPadding: const EdgeInsets.only(
                      left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: subject3,
                maxLines: 5,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'opinion',
                  filled: true,
                   fillColor: Colors.black12,
                  enabled: true,
                  contentPadding: const EdgeInsets.only(
                      left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
