import 'package:jamu1001malam/model/home/product.dart';
import 'package:jamu1001malam/model/home/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Network{
  final String _url = 'http://192.168.0.117/api';
  // 192.168.1.2 is my IP, change with your IP address
  var token;

  _getToken() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token')!)['token'];
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

  checkout(data, apiURL) async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token1 = localStorage.getString('token')!;
    int long = token1.length;
    int max = long - 1;
    var subToken = token1.substring(1,max);
    var full = _url + apiURL;
    var url = Uri.parse(full);
    Map<String, String> headers = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + subToken
        };
    return await http.post(
      url,
      body: jsonEncode(data),
      headers: headers
    );
  }

  Future<User> login({
    String? email,
    String? password,
  }) async {
    var url = '$_url/login';
    var headers = _setHeaders();
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      User user = User.fromJson(data['user']);
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var _token =  data['access_token'];
      localStorage.setString(token, _token);

      return user;
    } else {
      throw Exception('Gagal Login');
    }
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
    var apiURL = '/product';
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
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token1 = localStorage.getString('token')!;
    int long = token1.length;
    int max = long - 1;
    var subToken = token1.substring(1,max);
    var apiURL = '/user';
    var full = _url + apiURL;
    var url = Uri.parse(full);
    Map<String, String> headers = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + subToken
        };
      final response = await http.get(url, headers: headers);
      if(response.statusCode == 200){
        return User.fromJson(jsonDecode(response.body)['data']);
      }else{
        throw Exception('failed to load user');
      }
  }

  _setHeaders() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
  _setHeadersImage() => {
    'Content-type': 'multipart/form-data',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };
}