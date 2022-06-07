import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jamu1001malam/networks/api.dart';
import 'package:jamu1001malam/pages/homeScreen.dart';
import 'package:jamu1001malam/widgets/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email, password;
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    _scaffoldKey.currentState!.showSnackBar(snackBar);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 30
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Masuk",
                      style: title,
                    ),
                    Text(
                      "Temukan jamu herbal terbaikmu",
                      style: subTitle,
                    )
                  ]
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 670,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 23
                        ),
                      child: Text(
                        "Email",
                        style: label,
                      ),
                    ),
                    SizedBox(height: 12,),
                    Center(
                      child: SizedBox(
                        width: 320,
                        height: 45,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: label,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: 20,
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
                          validator: (emailValue){
                            if(emailValue!.isEmpty){
                              return 'Please enter your email';
                            }
                            password = emailValue;
                            return null;
                          }
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Password",
                        style: label,
                      ),
                    ),
                    SizedBox(height: 12,),
                    Center(
                      child: SizedBox(
                        width: 320,
                        height: 45,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: label,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: 20,
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
                          validator: (passwordValue){
                            if(passwordValue!.isEmpty){
                              return 'Please enter your password';
                            }
                            password = passwordValue;
                            return null;
                          }
                        ),
                      ),
                    ),
                    SizedBox(height: 350,),
                    Center(
                      child: Container(
                        width: 320,
                        height: 45,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: TextButton(
                          onPressed: (){}, 
                          child: Text(
                            "Masuk",
                            style: buttonPrimaryText,
                          )
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Center(
                      child: Container(
                        width: 320,
                        height: 45,
                        decoration: BoxDecoration(
                          color: secondColor,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: TextButton(
                          onPressed: (){}, 
                          child: Text(
                            "Buat Akun Baru",
                            style: buttonPrimaryText,
                          )
                        ),
                      ),
                    )
                  ],
                ),
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

    var data = {
      'email' : email,
      'password' : password
    };

    var res = await Network().auth(data, '/login');
    var body = json.decode(res.body);
    if(body['meta'][200]){
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', json.encode(body['data']['access_token']));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    }else{
      _showMsg(body['meta']['message']);
    }

    setState(() {
      _isLoading = false;
    });
  }
}

