import 'package:flutter/material.dart';
import 'package:jamu1001malam/pages/homeScreen.dart';
import 'package:jamu1001malam/pages/registerScreen.dart';
import 'package:jamu1001malam/widgets/themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {
  const Login({ Key? key }) : super(key: key);

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
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => HomeScreen(),)
                          );
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
}

