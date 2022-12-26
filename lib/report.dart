import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class reportt extends StatefulWidget {
  DocumentSnapshot docid;
  reportt({required this.docid});
  @override
  State<reportt> createState() => _reporttState(docid: docid);
}

class _reporttState extends State<reportt> {
  DocumentSnapshot docid;
  _reporttState({required this.docid});
  final pdf = pw.Document();
  var name;
  var subject1;
  var subject2;
  var subject3;

  // var marks;
  void initState() {
    setState(() {
      name = widget.docid.get('name');
      subject1 = widget.docid.get('Maths');
      subject2 = widget.docid.get('Science');
      subject3 = widget.docid.get('History');

      // marks = int.parse(subject1) + int.parse(subject2) + int.parse(subject3);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PdfPreview(
       maxPageWidth: 1000,
      //useActions: false,
      // canChangePageFormat: true,
      canChangeOrientation: false,
      // pageFormats:pageformat,
      canDebug: false,

      build: (format) => generateDocument(
        format,
      ),
    );
  }

  Future<Uint8List> generateDocument(PdfPageFormat format) async {
    final doc = pw.Document(pageMode: PdfPageMode.fullscreen);

    final font1 = await PdfGoogleFonts.openSansRegular();
    final font2 = await PdfGoogleFonts.openSansBold();
    // final image = await imageFromAssetBundle('assets/r2.svg');

    //String? _logo = await rootBundle.loadString('assets/r2.svg');

    doc.addPage(
      pw.Page(
        pageTheme: pw.PageTheme(
          pageFormat: format.copyWith(
            marginBottom: 0,
            marginLeft: 10,
            marginRight: 10,
            marginTop: 10,
          ),
          orientation: pw.PageOrientation.portrait,
          theme: pw.ThemeData.withFont(
            base: font1,
            bold: font2,
          ),
        ),
        build: (context) {
          return  pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Center(
                child: pw.Text(
                  'Mi Blog de animes',
                  style: pw.TextStyle(
                    fontSize: 19,
                    fontWeight: pw.FontWeight.bold
                  ),
                ),
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    'Nombre anime : ',
                    style: pw.TextStyle(
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold
                    ),
                  ),
                  pw.Text(
                    name,
                    style: pw.TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    'Autor: ',
                    style: pw.TextStyle(
                      fontSize: 18,
                      fontWeight: pw.FontWeight.bold
                    ),
                  ),
                  pw.Text(
                    subject1,
                    style: pw.TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    'Descripcion : ',
                    style: pw.TextStyle(
                     fontSize: 18,
                      fontWeight: pw.FontWeight.bold
                    ),
                  ),
                  pw.Text(
                    subject2,
                    style: pw.TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Text(
                    'Opinion : ',
                    style: pw.TextStyle(
                    fontSize: 18,
                      fontWeight: pw.FontWeight.bold
                    ),
                  ),
                  pw.Text(
                    subject3,
                    style: pw.TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),

            ],
          );
        },
      ),
    );

    return doc.save();
  }
}