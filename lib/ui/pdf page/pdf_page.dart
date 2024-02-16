import 'package:flutter/material.dart';
import 'package:untitled1/resouces/colors.dart';
import 'package:untitled1/resouces/text.dart';
import 'package:untitled1/ui/add%20bill/update_bill.dart';

class PdfPage extends StatefulWidget {
  var data;
   PdfPage({super.key,this.data});

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const CommonText.semiBold("details page",size: 18,),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateDetails(data: widget.data),));
              },
              icon: const Icon(Icons.edit,)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColor.primary,
                          width: 1
                      ),
                    color: AppColor.primary
                  ),
                  child: const CommonText.extraBold("Invoice Details",size: 24,color: AppColor.white,),
                ),
                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.primary,
                      width: 1
                    )
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(child: CommonText.extraBold("Date :",size: 18,color: AppColor.black,)),
                          Expanded(child: CommonText.extraBold(widget.data['date'].toString(),size: 18,color: AppColor.black,)),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Divider(color: AppColor.primary),
                      ),
                      Row(
                        children: [
                          const Expanded(child: CommonText.extraBold("Name :",size: 18,color: AppColor.black,)),
                          Expanded(child: CommonText.extraBold(widget.data['name'].toString(),size: 18,color: AppColor.black,)),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Divider(color: AppColor.primary),
                      ),
                      Row(
                        children: [
                          const Expanded(child: CommonText.extraBold("Address :",size: 18,color: AppColor.black,)),
                          Expanded(child: CommonText.extraBold(widget.data['address'].toString(),size: 18,color: AppColor.black,)),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Divider(color: AppColor.primary),
                      ),
                      Row(
                        children: [
                          const Expanded(child: CommonText.extraBold("Items :",size: 18,color: AppColor.black,)),
                          Expanded(child: CommonText.extraBold(widget.data['items'].toString(),size: 18,color: AppColor.black,)),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Divider(color: AppColor.primary),
                      ),
                      Row(
                        children: [
                          const Expanded(child: CommonText.extraBold("Total :",size: 18,color: AppColor.black,)),
                          Expanded(child: CommonText.extraBold("₹ ${widget.data['totalRent'].toString()}",size: 18,color: AppColor.black,)),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Divider(color: AppColor.primary),
                      ),
                      Row(
                        children: [
                          const Expanded(child: CommonText.extraBold("Advanced :",size: 18,color: AppColor.black,)),
                          Expanded(child: CommonText.extraBold("₹ ${widget.data['advanced'].toString()}",size: 18,color: AppColor.black,)),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Divider(color: AppColor.primary),
                      ),
                      Row(
                        children: [
                          const Expanded(child: CommonText.extraBold("Pending :",size: 18,color: AppColor.black,)),
                          Expanded(child: CommonText.extraBold("₹ ${widget.data['pendingRent'].toString()}",size: 18,color: AppColor.black,)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
               /* SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      child:Table(
                        columnWidths: const {
                          0:FixedColumnWidth(50),
                          1:FixedColumnWidth(100),
                          2:FixedColumnWidth(100),
                          3:FixedColumnWidth(100),
                          4:FixedColumnWidth(100),
                        },
                        border: TableBorder.all(width:1, color:Colors.black45), //table border
                        children: const [
                          TableRow(
                              children: [
                                TableCell(child: CommonText.semiBold("S/N",size: 18,color: AppColor.black,)),
                                TableCell(child: CommonText.semiBold("Name",size: 18,color: AppColor.black)),
                                TableCell(child: CommonText.semiBold("Address",size: 18,color: AppColor.black)),
                                TableCell(child: CommonText.semiBold("Nation",size: 18,color: AppColor.black)),
                                TableCell(child: CommonText.semiBold("Nation",size: 18,color: AppColor.black)),
                              ]
                          ),

                          TableRow(
                              children: [
                                TableCell(child: Text("1.")),
                                TableCell(child: Text("Krishna Karki")),
                                TableCell(child: Text("Nepal, Kathmandu")),
                                TableCell(child: Text("Nepal")),
                                TableCell(child: Text("Nepal")),
                              ]
                          ),

                          TableRow(
                              children: [
                                TableCell(child: Text("2.")),
                                TableCell(child: Text("John Wick")),
                                TableCell(child: Text("New York, USA")),
                                TableCell(child: Text("USA")),
                                TableCell(child: Text("USA")),
                              ]
                          ),

                          TableRow(
                              children: [
                                TableCell(child: Text("3.")),
                                TableCell(child: Text("Fedrick May")),
                                TableCell(child: Text("Berlin, Germany")),
                                TableCell(child: Text("Germany")),
                                TableCell(child: Text("Germany")),
                              ]
                          ),

                        ],)
                  ),
                )*/
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        elevation: 10,
        tooltip: "pdf",
        child: const Icon(Icons.picture_as_pdf_outlined,),
      ),
    );
  }
}
