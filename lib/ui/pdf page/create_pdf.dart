
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:untitled1/resouces/colors.dart';

class CreatePdfPage extends StatefulWidget {
  var data;
  CreatePdfPage({Key? key,this.data}) : super(key: key);

  @override
  _CreatePdfPageState createState() => _CreatePdfPageState();
}

class _CreatePdfPageState extends State<CreatePdfPage> {
  final pdf = pw.Document();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:  PdfPreview(
        build: (format) => generateCenteredTextWithOriginal(widget.data),
      )
    );
  }
}

pw.TextStyle boldText = pw.TextStyle(
  color: PdfColors.black,
  fontWeight: pw.FontWeight.bold,
  fontSize: 14,
);
pw.TextStyle boldTextTitle = pw.TextStyle(
  color: PdfColors.white,
  fontWeight: pw.FontWeight.bold,
  fontSize: 14,
);

pw.TextStyle simpleText = const pw.TextStyle(
  color: PdfColors.black,
  fontSize: 14,
);

pw.Widget buildTitles(var data){
  return pw.Padding(
    padding: const pw.EdgeInsets.symmetric(horizontal: 7,vertical: 3),
    child: pw.Text(data, style: boldTextTitle),
  );
}

pw.Widget buildItems(var data,int value){
  return pw.Padding(
    padding: const pw.EdgeInsets.symmetric(horizontal: 7,vertical: 2),
    child: pw.Text(data, style: simpleText),
  );
}

Future<Uint8List> generateCenteredText(var data) async {
  final pdf = pw.Document();
  final image = pw.MemoryImage
    ((await rootBundle.load('assets/images/srdj.png')).buffer.asUint8List());
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          children: [
            pw.Spacer(),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('From :', style: boldText),
                    pw.SizedBox(height: 10),
                    pw.Text('sr dj souds', style: simpleText),
                    pw.Container(
                      width: 200,
                      child: pw.Text('surat', style: simpleText),
                    ),
                    pw.Text('india,', style: simpleText),
                    pw.Text('srdj@gmail.com,', style: simpleText),
                  ],
                ),
                pw.Row(
                  children: [
                    pw.Container(
                      height: 60,
                      width: 60,
                      color: PdfColors.black,
                      child: pw.Image(image, fit: pw.BoxFit.cover),
                    ),
                    pw.SizedBox(width: 10),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'srdj',
                          style: pw.TextStyle(
                            color: PdfColors.black,
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        pw.Text(
                          'srdj',
                          style: const pw.TextStyle(
                            color: PdfColors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 25),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('To :', style: boldText),
                    pw.SizedBox(height: 10),
                    pw.Text('dhruv', style: simpleText),
                    pw.Container(
                      width: 200,
                      child: pw.Text('suarta', style: simpleText),
                    ),
                    pw.Text('india', style: simpleText),
                    pw.Text('srdj@', style: simpleText),
                  ],
                ),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Invoice # :', style: boldText),
                        pw.Text('Date of Issue :', style: boldText),
                        pw.Text('Due Date :', style: boldText),
                        pw.Text('Balance :', style: boldText),
                        pw.Text('Currency :', style: boldText),
                      ],
                    ),
                    pw.SizedBox(width: 20),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('hello', style: simpleText),
                        pw.Text('hello', style: simpleText),
                        pw.Text('hello', style: simpleText),
                        pw.Text('hello', style: simpleText),
                        pw.Text('hello', style: simpleText),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 50),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Container(
                  width: 110,
                  child: pw.Text('Product/Service', style: boldText),
                ),
                pw.Container(
                  width: 100,
                  child: pw.Text('Description', style: boldText),
                ),
                pw.Container(
                  width: 50,
                  child: pw.Text('Price', style: boldText),
                ),
                pw.Container(
                  width: 50,
                  child: pw.Text('QTY', style: boldText),
                ),
                pw.Container(
                  width: 70,
                  child: pw.Text('Discount', style: boldText),
                ),
                pw.Container(
                  width: 70,
                  child: pw.Text('Total', style: boldText),
                ),
              ],
            ),
            pw.SizedBox(height: 10),
            pw.Divider(
              thickness: 2,
              color: PdfColors.black,
            ),
            pw.SizedBox(height: 20),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Container(
                  width: 110,
                  child: pw.Text('djs',
                      style: simpleText),
                ),
                pw.Container(
                  width: 100,
                  child: pw.Text('lights', style: simpleText),
                ),
                pw.Container(
                  width: 50,
                  child: pw.Text('20000', style: simpleText),
                ),
                pw.Container(
                  width: 50,
                  child: pw.Text('3', style: simpleText),
                ),
                pw.Container(
                  width: 70,
                  child: pw.Text('10', style: simpleText),
                ),
                pw.Container(
                  width: 70,
                  child: pw.Text('30000', style: simpleText),
                ),
              ],
            ),
            pw.SizedBox(height: 10),
            pw.Divider(
              thickness: 1,
              color: PdfColors.grey,
            ),
            pw.SizedBox(height: 30),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Container(),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Subtotal :', style: boldText),
                        pw.Text('Discount :', style: boldText),
                        pw.Text('Tax :', style: boldText),
                        pw.Text('Additional tax :', style: boldText),
                      ],
                    ),
                    pw.SizedBox(width: 20),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('20000', style: simpleText),
                        pw.Text('1000', style: simpleText),
                        pw.Text('500', style: simpleText),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 10),
            pw.Divider(
              thickness: 1,
              color: PdfColors.black,
              indent: 300,
            ),
            pw.SizedBox(height: 10),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(width: 310),
                    pw.Text('Balance :', style: boldText),
                    pw.SizedBox(width: 58),
                    pw.Text('30000', style: simpleText),
                  ],
                ),
              ],
            ),
            pw.Spacer(),
            pw.Divider(
              thickness: 1,
              color: PdfColors.black,
            ),
            pw.SizedBox(height: 30),
            pw.Align(
              alignment: pw.Alignment.bottomCenter,
              child: pw.Text(
                'Thanks harshil for you order!',
                style: const pw.TextStyle(
                  fontSize: 19,
                  color: PdfColors.black,
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
  return pdf.save();
}

Future<Uint8List> generateCenteredTextWithOriginal(var data) async {
  final pdf = pw.Document();
  final totalAmount = int.parse(data['totalRent'])-int.parse(data['advanced']);
  DateTime currentDate = DateTime.now();
  final image = pw.MemoryImage
    ((await rootBundle.load('assets/images/srdj.png')).buffer.asUint8List());
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          children: [
            pw.Text(
              "Tax Invoice",style: pw.TextStyle(
              color: PdfColors.black,
              fontSize: 28,
              fontWeight: pw.FontWeight.bold
            )
            ),
            pw.SizedBox(height: 50),
            pw.Divider(
              thickness: 1,
              color: PdfColors.black,
            ),
            pw.SizedBox(height: 65),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('From :', style: boldText),
                    pw.SizedBox(height: 10),
                    pw.Text('SR sound', style: simpleText),
                    pw.Container(
                      width: 200,
                      child: pw.Text('surat', style: simpleText),
                    ),
                    pw.Text('+919328088008', style: simpleText),
                    pw.Text('srsounds@gmail.com', style: simpleText),
                  ],
                ),
                pw.Row(
                  children: [
                    pw.Container(
                      height: 60,
                      width: 60,
                      color: PdfColors.black,
                      child: pw.Image(image, fit: pw.BoxFit.cover),
                    ),
                    pw.SizedBox(width: 10),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'SR sound',
                          style: pw.TextStyle(
                            color: PdfColors.black,
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                        pw.Text(
                          'surat',
                          style: const pw.TextStyle(
                            color: PdfColors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 25),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('To :', style: boldText),
                    pw.SizedBox(height: 10),
                    pw.Text(data['name'], style: simpleText),
                    pw.Text('india', style: simpleText),
                  ],
                ),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Invoice :', style: boldText),
                        pw.Text('Date of Issue :', style: boldText),
                        pw.Text('Order Date :', style: boldText),
                      ],
                    ),
                    pw.SizedBox(width: 20),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('01', style: simpleText),
                        pw.Text('${currentDate.day}-${currentDate.month}-${currentDate.year}', style: simpleText),
                        pw.Text(data['date'], style: simpleText),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 50),
            pw.Table(
              columnWidths: {
                0:const pw.FixedColumnWidth(80),
                1:const pw.FixedColumnWidth(120),
                2:const pw.FixedColumnWidth(120),
                5:const pw.FixedColumnWidth(40),
              },
                border: pw.TableBorder.all(color: PdfColor.fromHex("#043C7A")),
                tableWidth: pw.TableWidth.max,
              children:<pw.TableRow> [
                pw.TableRow(
                  decoration: pw.BoxDecoration(
                    color: PdfColor.fromHex("#043C7A")
                  ),
                  children: [
                    buildTitles('Date'),
                    buildTitles('Items'),
                    buildTitles('Address'),
                    buildTitles('Amount'),
                  ]
                ),
                pw.TableRow(
                 verticalAlignment: pw.TableCellVerticalAlignment.full,
                  children: [
                    buildItems(data['date'],0),
                    buildItems(data['items'],0),
                    buildItems(data['address'],0),
                    buildItems(data['totalRent'],1),
                  ]
                )
              ]
            ),
            pw.SizedBox(height: 30),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Container(),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text('Sub total:', style: boldText),
                        pw.Text('Received :', style: boldText),
                      ],
                    ),
                    pw.SizedBox(width: 40),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(data['totalRent'].toString(), style: simpleText),
                        pw.Text(data['advanced'].toString(), style: simpleText),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 5),
            pw.Divider(
              thickness: 1,
              color: PdfColors.black,
              indent: 330,
            ),
            pw.SizedBox(height: 5),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.end,
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Row(
                  // crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    // pw.SizedBox(width: 310),
                    pw.Text('Balance :', style: boldText),
                    pw.SizedBox(width: 40),
                    pw.Text(totalAmount.toString(), style: simpleText),
                  ],
                ),
              ],
            ),
            pw.Spacer(),
            pw.Divider(
              thickness: 1,
              color: PdfColors.black,
            ),
            pw.SizedBox(height: 30),
            pw.Align(
              alignment: pw.Alignment.bottomCenter,
              child: pw.Text(
                'Thanks ${data['name'].split(' ')[0]} for you order!',
                style: const pw.TextStyle(
                  fontSize: 19,
                  color: PdfColors.black,
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
  return pdf.save();
}