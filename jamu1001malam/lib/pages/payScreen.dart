import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jamu1001malam/model/home/product.dart';
import 'package:jamu1001malam/networks/api.dart';
import 'package:jamu1001malam/widgets/themes.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/home/user.dart';

class PayScreen extends StatefulWidget {
  final Products products;

  int quantity;
  PayScreen({
    required this.products,
    required this.quantity
  });

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  late Future<User> futureUser;
  int userid = 0;

  @override
  initState(){

    futureUser = Network().getDataUser();
    super.initState();
  }

  int harga(){
    int harga = int.parse(widget.products.harga)  * widget.quantity;
    return harga;
  }

  int totalHarga(){
    var ongkir = 10000;
    var total = harga() + ongkir;

    return total;
  }


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
                        child: Image.network(
                          widget.products.picturePath,
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
                            widget.products.nama,
                            style: sb14,
                          ),
                          Text(
                            '${widget.products.harga}',
                            style: detail,
                          )
                        ],
                      ),
                      SizedBox(width: 60.w,),
                      Text(
                        '${widget.quantity} Items',
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
                              widget.products.nama,
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
                                '${harga()}',
                                style: pesanan,
                              ),
                              SizedBox(height: 8.h,),
                              Text(
                                '10000',
                                style: pesanan,
                              ),
                              SizedBox(height: 8.h,),
                              Text(
                                '${totalHarga()}',
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
                          child: FutureBuilder<User>(
                            future: futureUser,
                            builder: (context, snapshot) {
                              if(snapshot.hasData){
                                userid = snapshot.data!.id;
                                return Column(
                                key: Key("Text Center Right"),
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    snapshot.data!.name,
                                    style: pesanan,
                                  ),
                                  SizedBox(height: 8.h,),
                                  Text(
                                    snapshot.data!.telepon,
                                    style: pesanan,
                                  ),
                                  SizedBox(height: 8.h,),
                                  Text(
                                    snapshot.data!.alamat,
                                    style: pesanan,
                                  ),
                                ],
                              );
                              }else{
                                return Text('gagal');
                              }
                              
                            }
                          )
                        )
                      ]
                    ),
                  ),
                  
                  SizedBox(height: 80.h,),
                  Container(
                      width: 334.w,
                      height: 42.h,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: TextButton(
                        onPressed: (){
                          checkout();
                        }, 
                        child: Text(
                          "Buat Pesanan",
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
    );
  }

  void checkout() async{
    var products = widget.products;
    var data = {
      'product_id' : products.id,
      'user_id' : userid,
      'quantity' : widget.quantity,
      'total' : totalHarga(),
      'total_keuntungan' : products.keuntungan,
      'status' : 'PENDING'
  
    };

    var res = await Network().checkout(data, '/checkout');
    var body = json.decode(res.body);
    if(body['meta']['code'] == 200){
      // print(json.encode(body['data']));
      String url = json.encode(body['data']['payment_url']);
      int lt = url.length;
      int max = lt-1;
      String fullUrl = url.substring(1, max);
      print(fullUrl);
      _launchWeb(fullUrl);
    }else{
      showSnackBar('Gagal Melakukan Pesanan');
    }


    // print(data);
    // String url  = 'https://app.sandbox.midtrans.com/snap/v3/redirection/197316f1-457b-4728-b7d1-19e5bddd51ba';
    // _launchWeb(url);
  }

  void _launchWeb(String url) async{
    if(await canLaunch(url)){
      await launch(url);
    }else{
      print('gagal');
    }
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