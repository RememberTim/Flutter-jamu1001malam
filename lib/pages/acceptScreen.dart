import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jamu1001malam/widgets/themes.dart';

class AcceptScreen extends StatelessWidget {
  const AcceptScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 33.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 18.w),
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
                        'Pembayaran',
                        style: title,
                      ),
                      Text(
                        'Dapatkan jamu herbal terbaik',
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
            SizedBox(height: 19.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pesanan',
                    style: pesanan,
                  ),
                  SizedBox(height: 18.h,), 
                  Row(
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/image_jamu.png',
                          width: 71,
                          height: 67,
                          fit: BoxFit.cover,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                      SizedBox(width: 12.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Avosalado',
                            style: sb14,
                          ),
                          Text(
                            '3 items IDR 18.000',
                            style: detail,
                          )
                        ],
                      ),
                      SizedBox(width: 60.w,),
                      Text(
                        '14 Items',
                        style: detail,
                      )
                    ],
                  ),
                  SizedBox(height: 14.h,),
                  Text(
                    'Rincian Transaksi',
                    style: pesanan, 
                  ),
                  SizedBox(height: 12.h,),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Avosalado',
                              style: subTitle,
                            ),
                            SizedBox(height: 6.h,),
                            Text(
                              'Ongkir',
                              style: subTitle,
                            ),
                            SizedBox(height: 6.h,),
                            Text(
                              'Total Harga',
                              style: subTitle,
                            )
                          ],
                        ),
                        Expanded(
                          key: Key("Expanded Row Root Kanan"),
                          child: Column(
                            key: Key("Text Center Right"),
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'IDR 18.000',
                                style: pesanan,
                              ),
                              SizedBox(height: 8.h,),
                              Text(
                                'IDR 10.000',
                                style: pesanan,
                              ),
                              SizedBox(height: 8.h,),
                              Text(
                                'IDR 28.000',
                                style: GoogleFonts.inter(
                                  color: Color(0xff43BD8A),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Container(
              width: 375.w,
              height: 17.h,
              decoration: BoxDecoration(
                color: Color(0xffF5F5F5)
              ),
            ),
            SizedBox(height: 14.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dikirim ke :',
                    style: pesanan,
                  ),
                  SizedBox(height: 16.h,),
                  Padding(
                    padding:  EdgeInsets.only(left: 10.w),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama',
                              style: subTitle,
                            ),
                            SizedBox(height: 8.h,),
                            Text(
                              'No. Telp',
                              style: subTitle,
                            ),
                            SizedBox(height: 8.h,),
                            Text(
                              'Alamat',
                              style: subTitle,
                            ),
                          ],
                        ),
                        Expanded(
                          key: Key("Expanded Row Root Kanan"),
                          child: Column(
                            key: Key("Text Center Right"),
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Zainur Roziqin',
                                style: pesanan,
                              ),
                              SizedBox(height: 8.h,),
                              Text(
                                '083891667303',
                                style: pesanan,
                              ),
                              SizedBox(height: 8.h,),
                              Text(
                                'Jalan Merak',
                                style: pesanan,
                              ),
                            ],
                          ),
                        )
                      ]
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h,),
            Container(
              width: 375.w,
              height: 17.h,
              decoration: BoxDecoration(
                color: Color(0xffF5F5F5)
              ),
            ),
            SizedBox(height: 10.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status Pemesanan',
                    style: pesanan,
                  ),
                  Text(
                    '#Dikirim',
                    style: subTitle,
                  ),
                  SizedBox(height: 16.h,),
                  Container(
                    width: 334.w,
                    height: 42.h,
                    decoration: BoxDecoration(
                      color: Color(0xff108B1C),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: TextButton(
                      onPressed: (){}, 
                      child: Text(
                        "Terima Pesanan",
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