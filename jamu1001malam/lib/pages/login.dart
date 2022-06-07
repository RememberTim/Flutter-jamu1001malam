import 'package:flutter/material.dart';
import 'package:jamu1001malam/pages/homeScreen.dart';
import 'package:jamu1001malam/pages/registerScreen.dart';
import 'package:jamu1001malam/widgets/themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jamu1001malam/networks/api.dart';
import 'dart:convert';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email, password;
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  // _showMsg(msg) {
  //   final snackBar = SnackBar(
  //     content: Text(msg),
  //   );
  //   _scaffoldKey.currentState!.showSnackBar(snackBar);
  // }

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 32.h,),
                    Text(
                      'Masuk',
                      style: title,
                    ),
                    Text(
                      'Temukan jamu herbal terbaikmu',
                      style: subTitle,
                    ),
                    SizedBox(height: 33.h,),
                  ],
                ),
              ),
              Container(
                height: 17.h,
                width: 375.w,
                decoration: BoxDecoration(
                  color: Color(0xffF5F5F5)
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 39.h,),
                    Text(
                      "Email",
                      style: label,
                    ),
                    SizedBox(height: 12.h,),
                    SizedBox(
                      width: 334.w,
                      height: 42.h,
                      child: TextFormField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        style: label,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 8.w,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.0
                            )
                          ),
                          hintText: "Masukkan Email Anda",
                          hintStyle: hintText
                        ),
                        // validator: (emailValue){
                        //     if(emailValue!.isEmpty){
                        //       return 'Please enter your email';
                        //     }
                        //     password = emailValue;
                        //     return null;
                        //   }
                      ),
                    ),
                    SizedBox(height: 9.h,),
                    Text(
                      "Password",
                      style: label,
                    ),
                    SizedBox(height: 12.h,),
                    SizedBox(
                      width: 334.w,
                      height: 42.h,
                      child: TextFormField(
                        controller: _password,
                        obscureText: true,
                        style: label,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 8.w,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.0
                            )
                          ),
                          hintText: "Masukkan Password Anda",
                          hintStyle: hintText
                        ),
                        // validator: (passwordValue){
                        //     if(passwordValue!.isEmpty){
                        //       return 'Please enter your password';
                        //     }
                        //     password = passwordValue;
                        //     return null;
                        //   }
                      ),
                    ),
                    SizedBox(height: 11.h,),
                    Container(
                      width: 334.w,
                      height: 42.h,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: TextButton(
                        onPressed: (){
                          // Navigator.push(
                          //   context, 
                          //   MaterialPageRoute(builder: (context) => HomeScreen(),)
                          // );

                          _login();
                          
                          
                        }, 
                        child: Text(
                          "Masuk",
                          style: buttonPrimaryText,
                        )
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Container(
                      width: 334.w,
                      height: 42.h,
                      decoration: BoxDecoration(
                        color: secondColor,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => RegisterScreen(),)
                          );
                        }, 
                        child: Text(
                          "Buat Akun Baru",
                          style: buttonPrimaryText,
                        )
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }

  void _login() async{
    setState(() {
      _isLoading = true;
    });

    email = _email.text.toString();
    password = _password.text.toString();

    var data = {
      'email' : email,
      'password' : password
    };

    var res = await Network().auth(data, '/login');
    var body = json.decode(res.body);
    if(body['meta']['code'] == 200){
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', json.encode(body['data']['access_token']));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    }else{
      print(body['meta']['code']);
      print("$email $password");
    }

    setState(() {
      _isLoading = false;
    });
  }
}

