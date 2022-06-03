import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jamu1001malam/pages/registerScreen2.dart';
import 'package:jamu1001malam/widgets/themes.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

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
              SizedBox(height: 38.h,),
              Center(
                child: Image.asset(
                  'assets/image_empty.png',
                  width: 81.w,
                ),
              ),
              SizedBox(height: 21.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama',
                      style: label,
                    ),
                    SizedBox(height: 12.h,),
                    SizedBox(
                      width: 334.w,
                      height: 42.h,
                      child: TextFormField(
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
                    SizedBox(height: 12.h,),
                    Text(
                      'Email',
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
                          hintText: "Masukkan email anda",
                          hintStyle: hintText
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h,),
                    Text(
                      'Password',
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
                          hintText: "Masukkan Password anda",
                          hintStyle: hintText
                        ),
                      ),
                    ),
                    SizedBox(height: 17.h,),
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
                              MaterialPageRoute(builder: (context) => RegisterScreen2(),)
                            );
                          }, 
                          child: Text(
                            "Lanjutkan",
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
}