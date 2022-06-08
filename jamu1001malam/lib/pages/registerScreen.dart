import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jamu1001malam/pages/registerScreen2.dart';
import 'package:jamu1001malam/widgets/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jamu1001malam/networks/api.dart';
import 'dart:convert';

import 'homeScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  String? nama,email,password,alamat,telp;
  
  TextEditingController _nama = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _alamat = TextEditingController();
  TextEditingController _telp = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 33.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                    ),
                    SizedBox(width: 18.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Daftar',
                          style: title,
                        ),
                        Text(
                          'Daftar dan Pesan sekarang',
                          style: subTitle,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 31.h,),
              Container(
                width: 375.w,
                height: 17.h,
                decoration: BoxDecoration(
                  color: Color(0xffF5F5F5)
                ),
              ),
              SizedBox(height: 10.h,),
              Center(
                child: Stack(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 80.0,
                      backgroundImage: AssetImage('assets/image_empty.png'),
                    )
                  ],
                )
              ),
              SizedBox(height: 3.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama',
                      style: label,
                    ),
                    SizedBox(height: 7.h,),
                    SizedBox(
                      width: 334.w,
                      height: 42.h,
                      child: TextFormField(
                        controller: _nama,
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
                          hintText: "Masukkan nama lengkap anda",
                          hintStyle: hintText
                        ),
                      ),
                    ),
                    SizedBox(height: 7.h,),
                    Text(
                      'Email',
                      style: label,
                    ),
                    SizedBox(height: 7.h,),
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
                          hintText: "Masukkan email anda",
                          hintStyle: hintText
                        ),
                      ),
                    ),
                    SizedBox(height: 7.h,),
                    Text(
                      'Password',
                      style: label,
                    ),
                    SizedBox(height: 7.h,),
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
                          hintText: "Masukkan Password anda",
                          hintStyle: hintText
                        ),
                      ),
                    ),
                    SizedBox(height: 7.h,),
                    Text(
                      'Alamat',
                      style: label,
                    ),
                    SizedBox(height: 7.h,),
                    SizedBox(
                      width: 334.w,
                      height: 42.h,
                      child: TextFormField(
                        controller: _alamat,
                        // obscureText: true,
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
                          hintText: "Masukkan Alamat Anda",
                          hintStyle: hintText
                        ),
                      ),
                    ),
                    SizedBox(height: 7.h,),
                    Text(
                      'No. Telepon',
                      style: label,
                    ),
                    SizedBox(height: 7.h,),
                    SizedBox(
                      width: 334.w,
                      height: 42.h,
                      child: TextFormField(
                        controller: _telp,
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
                          hintText: "Masukkan No. Telepon Anda",
                          hintStyle: hintText
                        ),
                      ),
                    ),
                    SizedBox(height: 18.h,),
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
                            //   MaterialPageRoute(builder: (context) => RegisterScreen2(),)
                            // );

                            _register();
                          }, 
                          child: Text(
                            "Masuk",
                            style: buttonPrimaryText,
                          )
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _register() async{
    nama = _nama.text.toString();
    email = _email.text.toString();
    password = _password.text.toString();
    alamat = _alamat.text.toString();
    telp = _telp.text.toString();

    var data = {
      'name' : nama,
      'email' : email,
      'password' : password,
      'password_confirmation' : password,
      'alamat' : alamat,
      'telepon' : telp

    };

    var res = await Network().auth(data, '/register');
    var body = json.decode(res.body);
    if(body['meta']['code'] == 200){
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', json.encode(body['data']['access_token']));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    }else{
      print(body['meta']['code']);
      print("$nama + $email + $password + $alamat + $telp");
    }     
  }
}