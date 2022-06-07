import 'package:flutter/material.dart';
import 'package:jamu1001malam/widgets/themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({ Key? key }) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                        'Keranjang Belanja',
                        style: title,
                      ),
                      Text(
                        'Dapatkan jamu pilihanmu',
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
            SizedBox(height: 18.h,),
            Container(
              width: 375.w,
              height: 35.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 32.w),
                    child: Text(
                      'Semua'
                    ),
                  ),
                  Divider(
                    thickness: 0.8,
                    color: textGrey,
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 13.w),
              child: Row(
                children: [
                  Container(
                    width: 13.w,
                    height: 13.h,
                    color: Color(0xffC4C4C4),
                  ),
                  SizedBox(width: 9.w,),
                  Container(
                    width: 71.w,
                    height: 67.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.w),
                      image: DecorationImage(
                        image: AssetImage('assets/image_sinom.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Avosalado',
                        style: sb14,
                      ),
                      Text(
                        '3 items.IDR 18.000.000',
                        style: hintText,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 20.w,
                            height: 17.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: textGrey
                              )
                            ),
                            child: Center(
                              child: Text(
                                '-',
                                style: subTitle,
                              ),
                            ),
                          ),
                          Container(
                            width: 31.w,
                            height: 17.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: textGrey
                              )
                            ),
                            child: Center(
                              child: Text(
                                '3',
                                style: subTitle,
                              ),
                            ),
                          ),
                          Container(
                            width: 20.w,
                            height: 17.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: textGrey
                              )
                            ),
                            child: Center(
                              child: Text(
                                '+',
                                style: subTitle,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}