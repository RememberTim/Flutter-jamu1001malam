import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jamu1001malam/widgets/themes.dart';

class RegisterScreen2 extends StatelessWidget {
  const RegisterScreen2({ Key? key }) : super(key: key);

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
                          'Alamat',
                          style: title,
                        ),
                        Text(
                          'Pastikan alamat benar',
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 19.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'No. Telp',
                      style: label,
                    ),
                    SizedBox(height: 12.h,),
                    SizedBox(
                      width: 334.w,
                      height: 42.h,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
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
                          hintText: "Masukkan No. Telepon anda",
                          hintStyle: hintText
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h,),
                    Text(
                      'Alamat',
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
                          hintText: "Masukkan alamat anda",
                          hintStyle: hintText
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h,),
                    Text(
                      'Provinsi',
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
                          hintText: "Masukkan provinsi anda",
                          hintStyle: hintText
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h,),
                    Text(
                      'Kota',
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
                          hintText: "Masukkan kota anda",
                          hintStyle: hintText
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h,),
                    Text(
                      'Kode Pos',
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
                          hintText: "Masukkan kode pos",
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
                          onPressed: (){}, 
                          child: Text(
                            "Masuk Sekarang",
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