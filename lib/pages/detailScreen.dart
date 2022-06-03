import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jamu1001malam/widgets/themes.dart';
import '../model/jamu.dart';

class DetailScreen extends StatelessWidget {
  
  final Jamu jamu;
  DetailScreen({required this.jamu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset(
            jamu.imageAssets!,
            width: 374.w,
            height: 290.h,
            fit: BoxFit.cover,
          ),
          Container(
            width: 375.w,
            height: 300.h,
            transform: Matrix4.translationValues(0.0.w,-19.0.h,0.0.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          jamu.nama!,
                          style: labelDetail,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Image.asset(
                                'assets/image_keranjang.png'
                            ),
                            SizedBox(width: 3.w,),
                            GestureDetector(
                              onTap: (){},
                              child: Image.asset(
                                'assets/image_minus.png'
                              ),
                            ),
                            SizedBox(width: 3.w,),
                            Text(
                              '14',
                              style: angka,
                            ),
                            SizedBox(width: 3.w,),
                            GestureDetector(
                              onTap: (){},
                              child: Image.asset(
                                'assets/image_plus.png'
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Text(
                    jamu.deskripsi!,
                    style: subTitle,
                  ), 
                  SizedBox(height: 14.h,), 
                  Text(
                    'Bahan',
                    style: bahanStyle,
                  ),
                  SizedBox(height: 5.h,),
                  Text(
                    jamu.bahan!,
                    style: subTitle,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 17.h,),
          Container(
            width: 375.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Harga',
                              style: subTitle,
                            ),
                            Text(
                              jamu.harga!,
                              style: price,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 130.w,
                              height: 36.h,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: TextButton(
                                onPressed: (){}, 
                                child: Text(
                                  "Pesan ",
                                  style: buttonPrimaryText,
                                )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}