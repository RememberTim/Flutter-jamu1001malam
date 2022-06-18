import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jamu1001malam/pages/Splashscreen.dart';
import 'package:jamu1001malam/pages/acceptScreen.dart';
import 'package:jamu1001malam/pages/cancelScreen.dart';
import 'package:jamu1001malam/pages/cartScreen.dart';
import 'package:jamu1001malam/pages/detailScreen.dart';
import 'package:jamu1001malam/pages/homeScreen.dart';
import 'package:jamu1001malam/pages/login.dart';
import 'package:jamu1001malam/pages/loginScreen.dart';
import 'package:jamu1001malam/pages/payScreen.dart';
import 'package:jamu1001malam/pages/registerScreen.dart';
import 'package:jamu1001malam/pages/registerScreen2.dart';
import 'package:jamu1001malam/widgets/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  var home;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: Splashscreen(),
    );
  }
}