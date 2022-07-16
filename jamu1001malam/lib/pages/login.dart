import 'package:flutter/material.dart';
import 'package:jamu1001malam/model/home/user.dart';
import 'package:jamu1001malam/pages/homeScreen.dart';
import 'package:jamu1001malam/pages/registerScreen.dart';
import 'package:jamu1001malam/widgets/themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jamu1001malam/networks/api.dart';
import 'dart:convert';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _isLoading = false;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  String? email, password;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> Checklogin() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var _login = localStorage.getBool('isLogin');

    if(_login == true){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    }
  }

  void initState(){
    super.initState();
    Checklogin();
  }
  
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
                          // errorText: _errorEmail,
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
                        //     email = emailValue;
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
                          // errorText: _errorPass,
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
                          // if(_formKey1.currentState!.validate()){
                            // if(_formKey2.currentState!.validate()){
                          _login();
                            // } 
                          // }
                          
                          
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

  String? get _errorEmail{
    final text = _email.value.text;

    if(text.isEmpty){
      return "Email tidak boleh kosong";
    }

    return null;
  }

  String? get _errorPass{
    final text = _password.value.text;

    if(text.isEmpty){
      return "Password tidak boleh kosong";
    }
    if(text.length<8){
      return "password harus lebih dari 8";
    }
    return null;
  }

  void _login() async{
    setState(() {
      _isLoading = true;
    });

    email = _email.text.toString();
    password = _password.text.toString();

    if(email!.isNotEmpty && password!.isNotEmpty){
        var data = {
      'email' : email,
      'password' : password
      };

      var res = await Network().auth(data, '/login');
      var body = json.decode(res.body);
      if(body['meta']['code'] == 200){
          User.fromJson(body['data']['user']);
          SharedPreferences localStorage = await SharedPreferences.getInstance();
          await localStorage.setString('token', jsonEncode(body['data']['access_token']));
          print(json.encode(body['data']['access_token']));
          localStorage.setBool('isLogin', true);
          // showSnackBar('Login Berhasil');
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
      }else{
       showSnackBar('Login Gagal');
      }
    }else{
      showSnackBar('Email & Password tidak boleh kosong');
    }

    

    setState(() {
      _isLoading = false;
    });

  }

  void showSnackBar(String text){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(text),
          backgroundColor: primaryColor,
          behavior: SnackBarBehavior.floating,
        )
      );
  }
}

