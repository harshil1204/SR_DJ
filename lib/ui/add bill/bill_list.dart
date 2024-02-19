import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled1/resouces/colors.dart';
import 'package:untitled1/resouces/text.dart';
import 'package:untitled1/ui/pdf%20page/detail_page.dart';

import 'add_bill.dart';

class BillList extends StatefulWidget {
  String? name;
  int? month;
   BillList({super.key,this.name,this.month});

  @override
  State<BillList> createState() => _BillListState();
}

class _BillListState extends State<BillList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: CommonText.extraBold(widget.name.toString(),size: 18,),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Bill')
            .where('month',isEqualTo: widget.month)
            .where('year',isEqualTo: 2024)
            .orderBy('time',descending: true).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var data=snapshot.data!.docs[index];
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PdfPage(data:data),));
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 7,vertical: 5),
                    elevation: 14,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      decoration: const BoxDecoration(
                        color: AppColor.white,
                      ),
                      child: Column(
                        children: [
                          customRow(data['date'],"date : "),
                          const Divider(),
                          customRow(data['address'],"Address : "),
                          const Divider(),
                          customRow(data['items'],"Items : "),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          else{
            return const Center(
                child: CommonText.semiBold("No data found",size: 18,color: AppColor.primary,));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddBill(),));
        },
        tooltip: "Add bill",
        elevation: 0.5,
        child: const Icon(Icons.add),
      ),
    );
  }
}
Widget customRow(var data,String name){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Expanded(child: CommonText.semiBold(name.toString(),color: AppColor.primary,size: 18,)),
        Expanded(child: CommonText.semiBold(data.toString(),color: AppColor.primary,size: 18,)),
      ],
    ),
  );
}