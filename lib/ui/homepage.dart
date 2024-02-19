import 'package:flutter/material.dart';
import 'package:untitled1/resouces/colors.dart';
import 'package:untitled1/resouces/text.dart';
import 'package:untitled1/ui/add%20bill/bill_list.dart';
import 'package:untitled1/ui/drawer/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> month=["01-01","01-02","01-03","01-04","01-05","01-06","01-07","01-08","01-09","01-10","01-11","01-12"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const CommonText.extraBold("Homepage",size: 18,),
        // actions: [
        //   IconButton(
        //       onPressed: (){},
        //       icon: const Icon(Icons.date_range)
        //   ),
        // ],
      ),
      drawer: const DrawerCustom(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 12, 8, 2),
        child: GridView.builder(
          itemCount: 12,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => BillList(name:month[index].toString(),month:index+1)));
              },
              child: Card(
                color: AppColor.white,
                elevation: 10,
                shape:OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColor.white
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: CommonText.semiBold(month[index].toString(),color: AppColor.primary,size: 18,),
                ),
              ),
            );
          },
        )
      ),
    );
  }
}

