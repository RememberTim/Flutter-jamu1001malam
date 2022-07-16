import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jamu1001malam/pages/registerScreen2.dart';
import 'package:jamu1001malam/widgets/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jamu1001malam/networks/api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/home/user.dart';
import 'homeScreen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({ Key? key }) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  String? nama,email,password,alamat,telp, houseNumber, city;
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  
  TextEditingController _nama = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _alamat = TextEditingController();
  TextEditingController _telp = TextEditingController();
  TextEditingController _houseNumber = TextEditingController();
  TextEditingController _city = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<User>(
            future: Network().getDataUser(),
            builder: (context, snapshot) {
              return Column(
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
                  SizedBox(height: 10.h,),
                  Center(
                    child: Stack(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 47.0.w,
                          backgroundImage: _imageFile == null
                          ? AssetImage("assets/image_empty.png")
                          : FileImage(File(_imageFile!.path)) as ImageProvider               
                        ),
                        Positioned(
                          bottom: 20.h,
                          right: 20.w,
                          child: InkWell(
                            onTap: (){
                              showModalBottomSheet(
                                context: context, 
                                builder: ((builder) => bottomSheet()),
                              );
                            },
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.teal,
                              size: 18.w,
                            ),
                          ),
                        )
                      ],
                    )
                  ),
                  SizedBox(height: 3.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 19.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nama',
                          style: label,
                        ),
                        SizedBox(height: 7.h,),
                        SizedBox(
                          width: 334.w,
                          height: 42.h,
                          child: TextFormField(
                            controller: _nama,
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
                              hintStyle: hintText,
                            ),
                          ),
                        ),
                        SizedBox(height: 7.h,),
                        Text(
                          'Email',
                          style: label,
                        ),
                        SizedBox(height: 7.h,),
                        SizedBox(
                          width: 334.w,
                          height: 42.h,
                          child: TextFormField(
                            controller: _email,
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
                        SizedBox(height: 7.h,),
                        Text(
                          'Password',
                          style: label,
                        ),
                        SizedBox(height: 7.h,),
                        SizedBox(
                          width: 334.w,
                          height: 42.h,
                          child: TextFormField(
                            controller: _password,
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
                        SizedBox(height: 7.h,),
                        Text(
                          'Alamat',
                          style: label,
                        ),
                        SizedBox(height: 7.h,),
                        SizedBox(
                          width: 334.w,
                          height: 42.h,
                          child: TextFormField(
                            controller: _alamat,
                            // obscureText: true,
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
                              hintText: "Masukkan Alamat Anda",
                              hintStyle: hintText
                            ),
                          ),
                        ),
                        SizedBox(height: 7.h,),
                        Text(
                          'No. Telepon',
                          style: label,
                        ),
                        SizedBox(height: 7.h,),
                        SizedBox(
                          width: 334.w,
                          height: 42.h,
                          child: TextFormField(
                            controller: _telp,
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
                              hintText: "Masukkan No. Telepon Anda",
                              hintStyle: hintText
                            ),
                          ),
                        ),
                        SizedBox(height: 18.h,),
                        Container(
                            width: 334.w,
                            height: 42.h,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: TextButton(
                              onPressed: (){
                                // Navigator.push(
                                //   context, 
                                //   MaterialPageRoute(builder: (context) => RegisterScreen2(),)
                                // );

                                _editProfile();
                              }, 
                              child: Text(
                                "Daftar",
                                style: buttonPrimaryText,
                              )
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }


  void _editProfile() async{
    nama = _nama.text.toString();
    email = _email.text.toString();
    password = _password.text.toString();
    alamat = _alamat.text.toString();
    telp = _telp.text.toString();
    houseNumber = _houseNumber.text.toString();
    city = _city.text.toString();

    var data = {
      'name' : nama,
      'email' : email,
      'password' : password,
      'password_confirmation' : password,
      'alamat' : alamat,
      'telepon' : telp

    };

    var res = await Network().edit(data, '/user ');
    var body = json.decode(res.body);
    if(body['meta']['code'] == 200){
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', json.encode(body['data']['access_token']));
        if(_imageFile != null){
          final String _url = 'https://ws-tif.com/kel3/api/user/photo';
          var uri = Uri.parse(_url);
          SharedPreferences localStorage = await SharedPreferences.getInstance();
          String token = jsonDecode(localStorage.getString('token')!);

          var request =  http.MultipartRequest('POST', uri);
          request.files.add(await http.MultipartFile.fromPath('file', _imageFile!.path));
          request.headers.addAll(
            {
              'Content-type': 'multipart/form-data',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            }
          );

          http.StreamedResponse response = await request.send();

          if(response.statusCode == 200){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
          }else{
            print(response.statusCode);
          }

        }else{
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
        }
       
    }else{
      showSnackBar('Edit Profile Gagal');
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

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

}