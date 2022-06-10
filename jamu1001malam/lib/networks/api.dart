import 'package:jamu1001malam/model/home/product.dart';
import 'package:jamu1001malam/model/home/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Network{
  final String _url = 'http://192.168.1.9/api';
  // 192.168.1.2 is my IP, change with your IP address
  var token;

  _getToken() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
  }

  auth(data, apiURL) async{
    var full = _url + apiURL;
    var fullUrl = Uri.parse(full);
    return await http.post(
      fullUrl,
      body: jsonEncode(data),
      headers: _setHeaders()
    );
  }

  postImage (String data, apiURL) async{
    var full = _url + apiURL;
    var fullUrl = Uri.parse(full);
    var request = http.MultipartRequest('POST', fullUrl);
    request.headers.addAll(_setHeadersImage());
    request.files.add(await http.MultipartFile.fromPath('file', data));
    
  }

  uploadImage(data, apiURL) async{
    var full = _url + apiURL;
    var fullUrl = Uri.parse(full);
    await _getToken();
    var request =  http.MultipartRequest('POST', fullUrl);
    request.files.add(await http.MultipartFile.fromPath('file', data));
    request.headers.addAll(
      {
        'Content-type': 'multipart/form-data',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }
    );

    return request.send();
  }

  getData(apiURL) async{
    var full = _url + apiURL;
    var fullUrl = Uri.parse(full);
    await _getToken();
    return await http.get(
      fullUrl,
      headers: _setHeaders(),
    );
  }

  Future<List<Products>> getDataHome()async {
    var apiURL = '/products';
    var full = _url + apiURL;
    var url = Uri.parse(full);
    try{
      final response = await http.get(url, headers: _setHeaders());
      if(response.statusCode == 200){
        var json =jsonDecode(response.body);
        final parsed = json['data']['data'].cast<Map<String, dynamic>>();
        return parsed.map<Products>((json) =>Products.fromJson(json)).toList();
      }else{
        return[];
      }
    }catch(e){
      return[];
    }
  }

  Future<User> getDataUser()async {
    User? user;
    var apiURL = '/user';
    var full = _url + apiURL;
    var url = Uri.parse(full);
      final response = await http.get(url, headers: _setHeaders());
      if(response.statusCode == 200){
        var body = json.decode(response.body);
        return User.fromJson(json.decode(body['data']));
        // var json =jsonDecode(response.body);
        // final parsed = json['data'].cast<Map<String, dynamic>>();
        // return parsed.map<User>((json) =>User.fromJson(json));

        // return User.fromJson(json.decode(response.body['data']));
      }else{
        throw Exception('failed to load user');
      }
  }

  _setHeaders() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };
  _setHeadersImage() => {
    'Content-type': 'multipart/form-data',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };
}