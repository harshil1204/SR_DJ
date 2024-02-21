import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled1/resouces/colors.dart';
import 'package:untitled1/ui/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage(),)));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
        color: AppColor.white,
          shape: BoxShape.circle
        ),
        child: Center(
          child: Image.asset("assets/images/srdj.png",height: 70,width: 70,fit: BoxFit.fill),
        ),
      ),
    );
  }
}
