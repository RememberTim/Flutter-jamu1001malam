import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jamu1001malam/model/home/product.dart';
import 'package:jamu1001malam/model/home/user.dart';
import 'package:jamu1001malam/model/jamu.dart';
import 'package:jamu1001malam/model/transaction.dart';
import 'package:jamu1001malam/networks/api.dart';
import 'package:jamu1001malam/pages/cancelledScreen.dart';
import 'package:jamu1001malam/pages/cartScreen.dart';
import 'package:jamu1001malam/pages/deliveryScreen.dart';
import 'package:jamu1001malam/pages/detailScreen.dart';
import 'package:jamu1001malam/pages/login.dart';
import 'package:jamu1001malam/pages/payScreen.dart';
import 'package:jamu1001malam/pages/registerScreen.dart';
import 'package:jamu1001malam/pages/waitingScreen.dart';
import 'package:jamu1001malam/widgets/formatRupiah.dart';
import 'package:jamu1001malam/widgets/themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  


  // void _logout() async{
    
  // }

  Future<void> getToken() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String token = localStorage.getString('token')!;
    print(token);
  }

  

  

  int _index = 0;

  final tabs = [
    //body home
    SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 32.h,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1001Malam',
                            style: title,
                          ),
                          Text(
                            'Dapatkan beberapa jamu herbal',
                            style: subTitle,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 84.w,
                      ),
                      Builder(
                        builder: (context) {
                          return GestureDetector(
                            onTap:() async{
                              // Navigator.push(context, MaterialPageRoute(builder: (context) {
                              //   return CartScreen();
                              // },));
                              // getToken();
                              SharedPreferences localStorage = await SharedPreferences.getInstance();
                              String token = localStorage.getString('token')!;
                              print(token);
                            },
                            child: Image.asset(
                              'assets/image_keranjang_home.png',
                            ),
                          );
                        }
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 23.h,
            ),
            Container(
              width: 375.w,
              height: 17.h,
              decoration: BoxDecoration(color: Color(0xffF5F5F5)),
            ),
            SizedBox(
              height: 33.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.w),
              child: Column(
                children: [
                  Container(
                    width: 375.w,
                    height: 190.h,
                    child: FutureBuilder<List<Products>>(
                      future: Network().getDataProducts(),
                      builder: (context,  snaphot) {
                        if(snaphot.connectionState == ConnectionState.waiting){
                          return Center(child: CircularProgressIndicator(),);
                        }else{
                          List<Products> listProducts = snaphot.data!;
                          print(listProducts);
                          return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return DetailScreen(products: listProducts[index],);
                                },));
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                child: Container(
                                  width: 181.w,
                                  height: 187.h,
                                  decoration: BoxDecoration(
                                    color: Color(0xffF5F5F5),
                                    borderRadius: BorderRadius.circular(10.w)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        listProducts[index].picturePath,
                                        width: 181.w,
                                        height: 113.h,
                                      ),
                                      SizedBox(
                                        height: 13.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 11.w),
                                        child: Text(
                                          listProducts[index].nama,
                                          style: labelHorizontal,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.w),
                                        child: RatingBar.builder(
                                          initialRating: double.parse(listProducts[index].rating) ,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding:
                                              EdgeInsets.symmetric(horizontal: 2),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                          itemSize: 20.w,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: listProducts.length
                        );
                        }
                      }
                    ),
                  )
                ],
              ),
            ),
            TabBar(
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  child: Text(
                    'Dewasa',
                    style: subTitle,
                  ),
                ),
                Tab(
                  child: Text(
                    'Anak-anak',
                    style: subTitle,
                  ),
                ),
                Tab(
                  child: Text(
                    'Semua Usia',
                    style: subTitle,
                  ),
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  //Body Dewasa
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w,),
                    child: Container(
                      width: 375.w,
                      height: 150.h,
                      child: FutureBuilder<List<Products>>(
                        future: Network().getDataProductsDewasa(),
                        builder: (context, snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return Center(child: CircularProgressIndicator(),);
                          }else{
                            List<Products> products = snapshot.data!;
                            return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemBuilder: ((context, index) {
                              return InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return DetailScreen(products: products[index]);
                                  },));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(top: 17.h),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 71.w,
                                        height: 67.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.w),
                                          image: DecorationImage(
                                            image: NetworkImage(products[index].picturePath),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 19.w,),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              products[index].nama,
                                              style: sb14,
                                            ),
                                            SizedBox(height: 3.h,),
                                            Text(
                                              FormatRupiah.convertToIdr(int.parse(products[index].harga)),
                                              style: hintText,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          children: [
                                            RatingBar.builder(
                                              initialRating: double.parse(products[index].rating) ,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding:
                                                      EdgeInsets.symmetric(horizontal: 2),
                                                  itemBuilder: (context, _) => Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    print(rating);
                                                  },
                                                  itemSize: 15.w,
                                            ),
                                            Text(
                                              '${products[index].rating}'
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 17.h)
                                    ],
                                  ),
                                ),
                              );
                            }),
                            itemCount: products.length,
                          );
                          }
                          
                        }
                      ),
                    ),
                  ),
                  //Body anak anak
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w,),
                    child: Container(
                      width: 375.w,
                      height: 150.h,
                      child: FutureBuilder<List<Products>>(
                        future: Network().getDataProductsAnakanak(),
                        builder: (context, snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return Center(child: CircularProgressIndicator(),);
                          }else{
                            List<Products> products = snapshot.data!;
                            return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemBuilder: ((context, index) {
                              return InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return DetailScreen(products: products[index],);
                                  },));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(top: 17.h),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 71.w,
                                        height: 67.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.w),
                                          image: DecorationImage(
                                            image: NetworkImage(products[index].picturePath),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 19.w,),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              products[index].nama,
                                              style: sb14,
                                            ),
                                            SizedBox(height: 3.h,),
                                            Text(
                                              FormatRupiah.convertToIdr(int.parse(products[index].harga)),
                                              style: hintText,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          children: [
                                            RatingBar.builder(
                                              initialRating: double.parse(products[index].rating) ,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding:
                                                      EdgeInsets.symmetric(horizontal: 2),
                                                  itemBuilder: (context, _) => Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    print(rating);
                                                  },
                                                  itemSize: 15.w,
                                            ),
                                            Text(
                                              '${products[index].rating}'
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 17.h)
                                    ],
                                  ),
                                ),
                              );
                            }),
                            itemCount: products.length,
                          );
                          }
                          
                        }
                      ),
                    ),
                  ),
                  //Body semua usia
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w,),
                    child: Container(
                      width: 375.w,
                      height: 150.h,
                      child: FutureBuilder<List<Products>>(
                        future: Network().getDataProductsSemuausia(),
                        builder: (context, snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return Center(child: CircularProgressIndicator(),);
                          }else{
                            List<Products> products = snapshot.data!;
                            return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemBuilder: ((context, index) {
                              return InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return DetailScreen(products: products[index],);
                                  },));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(top: 17.h),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 71.w,
                                        height: 67.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5.w),
                                          image: DecorationImage(
                                            image: NetworkImage(products[index].picturePath),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 19.w,),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              products[index].nama,
                                              style: sb14,
                                            ),
                                            SizedBox(height: 3.h,),
                                            Text(
                                              FormatRupiah.convertToIdr(int.parse(products[index].harga)),
                                              style: hintText,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          children: [
                                            RatingBar.builder(
                                              initialRating: double.parse(products[index].rating) ,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding:
                                                      EdgeInsets.symmetric(horizontal: 2),
                                                  itemBuilder: (context, _) => Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    print(rating);
                                                  },
                                                  itemSize: 15.w,
                                            ),
                                            Text(
                                              '${products[index].rating}'
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 17.h)
                                    ],
                                  ),
                                ),
                              );
                            }),
                            itemCount: products.length,
                          );
                          }
                          
                        }
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
    //body Berlangsung
    SafeArea(
        child: DefaultTabController(
          length: 4,
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
                      'Pemesanan',
                      style: title,
                    ),
                    Text(
                      'Tunggu pesanan jamu terbaikmu',
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
              TabBar(
                indicatorColor: Colors.black,
                tabs: [
                  Tab(
                    child: Text(
                      'Waiting',
                      style: subTitle,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Dikirim',
                      style: subTitle,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Selesai',
                      style: subTitle,
                    ),
                  ), 
                  Tab(
                    child: Text(
                      'Batal',
                      style: subTitle,
                    ),
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    //Body berlangsung
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w,),
                      child: Container(
                        width: 375.w,
                        height: 150.h,
                        child: FutureBuilder<List<Transaction>>(
                          future: Network().getDataTransactionBerlangsung(),
                          builder: (context, snapshot) {
                            if(snapshot.connectionState == ConnectionState.waiting){
                              return Center(child: CircularProgressIndicator(),);
                            }else{
                              List<Transaction> transaction = snapshot.data!;
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemBuilder: ((context, index) {
                                // final Jamu jamu = listJamu[index];
                                return InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return WaitingScreen(transaction : transaction[index], quantity: int.parse(transaction[index].quantity));
                                    },));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 17.h),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 71.w,
                                          height: 67.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.w),
                                            image: DecorationImage(
                                              image: NetworkImage(transaction[index].product.picturePath),
                                              fit: BoxFit.cover,
                                            ),  
                                          ),
                                        ),
                                        SizedBox(width: 19.w,),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                transaction[index].product.nama,
                                                style: sb14,
                                              ),
                                              SizedBox(height: 3.h,),
                                              Text(
                                                '${transaction[index].quantity} items ' + FormatRupiah.convertToIdr(int.parse(transaction[index].total)),
                                                style: hintText,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 17.h)
                                      ],
                                    ),
                                  ),
                                );
                              }),
                              itemCount: transaction.length,
                            );
                            }
                            
                          }
                        ),
                      ),
                    ),
                    //Body anak anak
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w,),
                      child: Container(
                        width: 375.w,
                        height: 150.h,
                        child: FutureBuilder<List<Transaction>>(
                          future: Network().getDataTransactionDikirim(),
                          builder: (context, snapshot) {
                            if(snapshot.hasData){
                              List<Transaction> transaction = snapshot.data!;
                              return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemBuilder: ((context, index) {
                                // final Jamu jamu = listJamu[index];
                                return InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return DeliveryScreen(transaction : transaction[index], quantity: int.parse(transaction[index].quantity));
                                    },));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 17.h),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 71.w,
                                          height: 67.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.w),
                                            image: DecorationImage(
                                              image: NetworkImage(transaction[index].product.picturePath),
                                              fit: BoxFit.cover,
                                            ),  
                                          ),
                                        ),
                                        SizedBox(width: 19.w,),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                transaction[index].product.nama,
                                                style: sb14,
                                              ),
                                              SizedBox(height: 3.h,),
                                              Text(
                                                 '${transaction[index].quantity} items ' + FormatRupiah.convertToIdr(int.parse(transaction[index].total)),
                                                style: hintText,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 17.h)
                                      ],
                                    ),
                                  ),
                                );
                              }),
                              itemCount: transaction.length,
                            );
                            }else{
                              return Center(
                                child: Row(
                                  children: [
                                    Text(
                                      'pesanan tidak ada',
                                      style: pesanan,
                                    ),
                                  ],
                                ),
                              );
                            }
                            
                          }
                        ),
                      ),
                    ),
                    //Body Batal
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w,),
                      child: Container(
                        width: 375.w,
                        height: 150.h,
                        child: FutureBuilder<List<Transaction>>(
                          future: Network().getDataTransactionSelesai(),
                          builder: (context, snapshot) {
                            if(snapshot.connectionState == ConnectionState.waiting){
                              return Center(child: CircularProgressIndicator(),);
                            }else{
                              List<Transaction> transaction = snapshot.data!;
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemBuilder: ((context, index) {
                                // final Jamu jamu = listJamu[index];
                                return InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return NoButtonOrderScreen(products: transaction[index].product, quantity: int.parse(transaction[index].quantity));
                                    },));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 17.h),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 71.w,
                                          height: 67.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.w),
                                            image: DecorationImage(
                                              image: NetworkImage(transaction[index].product.picturePath),
                                              fit: BoxFit.cover,
                                            ),  
                                          ),
                                        ),
                                        SizedBox(width: 19.w,),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                transaction[index].product.nama,
                                                style: sb14,
                                              ),
                                              SizedBox(height: 3.h,),
                                              Text(
                                                 '${transaction[index].quantity} items ' + FormatRupiah.convertToIdr(int.parse(transaction[index].total)),
                                                style: hintText,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 17.h)
                                      ],
                                    ),
                                  ),
                                );
                              }),
                              itemCount: transaction.length,
                            );
                            }
                            
                          }
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w,),
                      child: Container(
                        width: 375.w,
                        height: 150.h,
                        child: FutureBuilder<List<Transaction>>(
                          future: Network().getDataTransactionBatal(),
                          builder: (context, snapshot) {
                            if(snapshot.connectionState == ConnectionState.waiting){
                              return Center(child: CircularProgressIndicator(),);
                            }else{
                              List<Transaction> transaction = snapshot.data!;
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemBuilder: ((context, index) {
                                // final Jamu jamu = listJamu[index];
                                return InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return NoButtonOrderScreen(products: transaction[index].product, quantity: int.parse(transaction[index].quantity));
                                    },));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 17.h),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 71.w,
                                          height: 67.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.w),
                                            image: DecorationImage(
                                              image: NetworkImage(transaction[index].product.picturePath),
                                              fit: BoxFit.cover,
                                            ),  
                                          ),
                                        ),
                                        SizedBox(width: 19.w,),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                transaction[index].product.nama,
                                                style: sb14,
                                              ),
                                              SizedBox(height: 3.h,),
                                              Text(
                                                 '${transaction[index].quantity} items ' + FormatRupiah.convertToIdr(int.parse(transaction[index].total)),
                                                style: hintText,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 17.h)
                                      ],
                                    ),
                                  ),
                                );
                              }),
                              itemCount: transaction.length,
                            );
                            }
                            
                          }
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
            
          ),
        ),
      ),
    SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder<User>(
            future: Network().getDataUser(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
              User user = snapshot.data!;
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: 26.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25.h,),
                    Center(
                      child: CircleAvatar(
                      radius: 47.0.w,
                      backgroundImage:  user.profilePhotoPath == null 
                      ? AssetImage('assets/image_empty.png',) 
                      : NetworkImage("https://ws-tif.com/kel3"+user.profilePhotoUrl,) as ImageProvider   
                    ),
                      // user.profilePhotoPath == null 
                      // ? Image.asset('assets/image_empty.png', width: 81.w,) 
                      // : Image.network("https://ws-tif.com/kel3"+user.profilePhotoUrl, width: 81.w, height: 81.h, fit: BoxFit.cover,)
                      ),
                    SizedBox(height: 7.h,),
                    Center(
                      child: Text(
                        user.name,
                        style: pesanan,
                      )
                    ),
                    Center(
                      child: Text(
                        user.email,
                        style: hintText,
                      )
                    ),
                    SizedBox(height: 10.h,),
                    Text('Akun', style: pesanan,),
                  ],
                ),
              );
            }
          ),
          SizedBox(height: 10.h,),
          Container(
              height: 9.h,
              width: 375.w,
              decoration: BoxDecoration(
                color: Color(0xffF5F5F5)
              ),
          ),
          SizedBox(height: 14.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.w),
            child: Column(
              children: [
                GestureDetector(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Text(
                          'Edit Profile',
                          style: price,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 14.w,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: ()async{
                        var res = await Network().logout();
                        var body = json.decode(res.body);
                        if(body['meta']['code'] == 200){
                          SharedPreferences localStorage = await SharedPreferences.getInstance();
                          localStorage.setBool("isLogin", false);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                        }
                      },
                      child: Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Text(
                              'Logout',
                              style: price,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 14.w,
                            ),
                          )
                        ],
                      ),
                    );
                  }
                ),
              ],
            ),
          )
        ],
      )
    )
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_index],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        backgroundColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          )
        ],
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
