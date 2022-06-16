import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jamu1001malam/model/home/product.dart';
import 'package:jamu1001malam/model/jamu.dart';
import 'package:jamu1001malam/networks/api.dart';
import 'package:jamu1001malam/pages/cartScreen.dart';
import 'package:jamu1001malam/pages/detailScreen.dart';
import 'package:jamu1001malam/pages/login.dart';
import 'package:jamu1001malam/pages/registerScreen.dart';
import 'package:jamu1001malam/widgets/themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  


  Future<void> logOut() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setBool("isLogin", false);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
  }

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
                      future: Network().getDataHome(),
                      builder: (context,  snaphot) {
                        if(snaphot.connectionState == ConnectionState.waiting){
                          return Center(child: CircularProgressIndicator(),);
                        }else{
                          List<Products> listProducts = snaphot.data!;
                          print(listProducts);
                          return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final Jamu jamu = listJamu[index];
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
                                          initialRating: listProducts[index].rating,
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
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemBuilder: ((context, index) {
                          final Jamu jamu = listJamu[index];
                          return InkWell(
                            // onTap: (){
                            //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //   return DetailScreen(jamu: jamu,);
                            //   },));
                            // },
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
                                        image: AssetImage(jamu.imageAssets!),
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
                                          jamu.nama!,
                                          style: sb14,
                                        ),
                                        SizedBox(height: 3.h,),
                                        Text(
                                          jamu.harga!,
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
                                          initialRating: jamu.rating!,
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
                                          '${jamu.rating!}'
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
                        itemCount: listJamu.length,
                      ),
                    ),
                  ),
                  //Body anak anak
                  Center(
                    child: Text(
                      'Anak-anak',
                      style: title,
                    ),
                  ),
                  //Body semua usia
                  Center(
                    child: Text(
                      'Semua Usia',
                      style: title,
                    ),
                  )
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
          length: 3,
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
                      'Berlangsung',
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
                    //Body Dewasa
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w,),
                      child: Container(
                        width: 375.w,
                        height: 150.h,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemBuilder: ((context, index) {
                            final Jamu jamu = listJamu[index];
                            return InkWell(
                              // onTap: (){
                              //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                              //   return DetailScreen(jamu: jamu,);
                              //   },));
                              // },
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
                                          image: AssetImage(jamu.imageAssets!),
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
                                            jamu.nama!,
                                            style: sb14,
                                          ),
                                          SizedBox(height: 3.h,),
                                          Text(
                                            jamu.harga!,
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
                                            initialRating: jamu.rating!,
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
                                            '${jamu.rating!}'
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
                          itemCount: listJamu.length,
                        ),
                      ),
                    ),
                    //Body anak anak
                    Center(
                      child: Text(
                        'Anak-anak',
                        style: title,
                      ),
                    ),
                    //Body semua usia
                    Center(
                      child: Text(
                        'Semua Usia',
                        style: title,
                      ),
                    )
                  ],
                ),
              )
            ],
            
          ),
        ),
      ),
    //body profile
    Center(
      child: Center(
        child: Builder(
          builder: (context) {
            return FlatButton(
              onPressed: ()async{
                SharedPreferences localStorage = await SharedPreferences.getInstance();
                localStorage.setBool("isLogin", false);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
              },
              child: Text("LogOut") 
            );
          }
        ),
      ),
    ),
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
