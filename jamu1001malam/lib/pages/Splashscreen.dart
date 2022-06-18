import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jamu1001malam/pages/login.dart';
import 'package:jamu1001malam/widgets/themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({ Key? key }) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(child: Image.asset('assets/ss.png' , width: 121.w,height: 104.h,)),
    );
  }
}