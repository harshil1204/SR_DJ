import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/resouces/colors.dart';
import 'package:untitled1/resouces/text.dart';

import 'add bill/add_bill.dart';
import 'pdf page/pdf_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const CommonText.extraBold("Homepage",size: 18,),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Bill').orderBy("time ",descending: true).snapshots(),
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
                        elevation: 6,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          decoration: const BoxDecoration(
                          color: AppColor.white,
                          ),
                          child: Column(
                            children: [
                              customRow(data,"Address : "),
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
                  child: CommonText.semiBold("No data found",size: 18,));
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
  return Row(
    children: [
      Expanded(child: CommonText.semiBold(name.toString(),color: AppColor.primary,size: 18,)),
      Expanded(child: CommonText.semiBold(data['address'].toString(),color: AppColor.primary,size: 18,)),
    ],
  );
}