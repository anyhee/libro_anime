import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'report_page.dart';
import 'report.dart';

class editnote extends StatefulWidget {
  DocumentSnapshot docid;
  editnote({required this.docid});

  @override
  _editnoteState createState() => _editnoteState(docid: docid);
}

class _editnoteState extends State<editnote> {
  DocumentSnapshot docid;
  _editnoteState({required this.docid});
  TextEditingController name = TextEditingController();
  TextEditingController subject1 = TextEditingController();
  TextEditingController subject2 = TextEditingController();
  TextEditingController subject3 = TextEditingController();

  @override
  void initState() {
    name = TextEditingController(text: widget.docid.get('name'));
    subject1 = TextEditingController(text: widget.docid.get('Maths'));
    subject2 = TextEditingController(text: widget.docid.get('Science'));
    subject3 = TextEditingController(text: widget.docid.get('History'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          MaterialButton(
              
              onPressed: () {
               
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => ReportPage()));
                },
              child: Icon(Icons.arrow_back,size: 20,)
            ),
          Container(
            margin: EdgeInsets.all(10),
            child: MaterialButton(
              color: Colors.pink,
              onPressed: () {
                widget.docid.reference.update({
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
                "guardar",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: MaterialButton(
              color: Colors.pink,
              onPressed: () {
                widget.docid.reference.delete().whenComplete(() {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => ReportPage()));
                });
              },
              child: Text(
                "Borrar",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                  hintText: 'name',
                  fillColor: Colors.black12,
                  filled: true,
                  enabled: true,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Color.fromARGB(255, 252, 252, 252)),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
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
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Maths',
                  fillColor: Colors.black12,
                  enabled: true,
                  filled: true,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: subject2,
                maxLines: 5,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Science',
                  fillColor: Colors.black12,
                  enabled: true,
                  filled: true,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
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
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'History',
                  fillColor: Colors.black12,
                  enabled: true,
                  filled: true,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                color: Colors.pink,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => reportt(
                        docid: docid,
                      ),
                    ),
                  );
                },
                child: Text(
                  "Generar pdf",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 251, 251, 251),
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
