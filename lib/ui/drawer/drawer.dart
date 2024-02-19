import 'package:flutter/material.dart';
import 'package:untitled1/resouces/colors.dart';
import 'package:untitled1/resouces/text.dart';

class DrawerCustom extends StatefulWidget {
  const DrawerCustom({super.key});

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20)),
      ),
      // backgroundColor: AppColor.primary,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                    decoration:  BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(90)
                              )
                              ,child: Image.asset('assets/images/srdj.png',height: 90,)),
                          const SizedBox(height: 11,),
                          const Text("SR Sound",style: TextStyle(
                              fontSize: 22,color: AppColor.white,
                              fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    )),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child:Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: Column(
                children: [
                  CommonText.semiBold("developed by",color: AppColor.greyLight,),
                  CommonText.semiBold("Ekcero Infotech",color: AppColor.primary),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
