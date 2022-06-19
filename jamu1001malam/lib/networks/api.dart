import 'package:jamu1001malam/model/home/product.dart';
import 'package:jamu1001malam/model/home/user.dart';
import 'package:jamu1001malam/model/transaction.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Network{
  final String _url = 'https://ws-tif.com/kel3/api';
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

  logout() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token1 = localStorage.getString('token')!;
    int long = token1.length;
    int max = long - 1;
    var subToken = token1.substring(1,max);
    var apiURL = '/logout';
    var full = _url + apiURL;
    var url = Uri.parse(full);
    Map<String, String> headers = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + subToken
        };
    return await http.post(
      url,
      headers: headers
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

  pesananDiterima(data, apiURL) async{
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

  Future<List<Products>> getDataProducts()async {
    var apiURL = '/product';
    var full = _url + apiURL;
    var url = Uri.parse(full);
    try{
      final response = await http.get(url, headers: _setHeaders());
      if(jsonDecode(response.body)['meta']['code'] == 200){
        var json =jsonDecode(response.body);
        final parsed = json['data']['data'].cast<Map<String, dynamic>>();
        return parsed.map<Products>((json) =>Products.fromJson(json)).toList();
      }else{
        return[];
      }
    }catch(e){
      print(e);  
      return[];
    }
  }

  Future<List<Products>> getDataProductsAnakanak()async {
    var apiURL = '/product?tipe=Anak-anak';
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
  Future<List<Products>> getDataProductsDewasa()async {
    var apiURL = '/product?tipe=Dewasa';
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

  Future<List<Products>> getDataProductsSemuausia()async {
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

  Future<List<Transaction>> getDataTransactionBerlangsung()async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token1 = localStorage.getString('token')!;
    int long = token1.length;
    int max = long - 1;
    var subToken = token1.substring(1,max);
    var apiURL = '/transaction?status=PENDING';
    var full = _url + apiURL;
    var url = Uri.parse(full);
    Map<String, String> headers = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + subToken
        };
    try{
      final response = await http.get(url, headers: headers);
      if(response.statusCode == 200){
        var json =jsonDecode(response.body);
        final parsed = json['data']['data'].cast<Map<String, dynamic>>();
        return parsed.map<Transaction>((json) =>Transaction.fromJson(json)).toList();
      }else{
        return[];
      }
    }catch(e){
      return[];
    }
  }

  Future<List<Transaction>> getDataTransactionDikirim()async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token1 = localStorage.getString('token')!;
    int long = token1.length;
    int max = long - 1;
    var subToken = token1.substring(1,max);
    var apiURL = '/transaction?status=DELIVERED';
    var full = _url + apiURL;
    var url = Uri.parse(full);
    Map<String, String> headers = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + subToken
        };
    try{
      final response = await http.get(url, headers: headers);
      if(response.statusCode == 200){
        var json =jsonDecode(response.body);
        final parsed = json['data']['data'].cast<Map<String, dynamic>>();
        return parsed.map<Transaction>((json) =>Transaction.fromJson(json)).toList();
      }else{
        return[];
      }
    }catch(e){
      return[];
    }
  }

  Future<List<Transaction>> getDataTransactionBatal()async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token1 = localStorage.getString('token')!;
    int long = token1.length;
    int max = long - 1;
    var subToken = token1.substring(1,max);
    var apiURL = '/transaction?status=CANCELLED';
    var full = _url + apiURL;
    var url = Uri.parse(full);
    Map<String, String> headers = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + subToken
        };
    try{
      final response = await http.get(url, headers: headers);
      if(response.statusCode == 200){
        var json =jsonDecode(response.body);
        final parsed = json['data']['data'].cast<Map<String, dynamic>>();
        return parsed.map<Transaction>((json) =>Transaction.fromJson(json)).toList();
      }else{
        return[];
      }
    }catch(e){
      return[];
    }
  }

  Future<List<Transaction>> getDataTransactionSelesai()async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token1 = localStorage.getString('token')!;
    int long = token1.length;
    int max = long - 1;
    var subToken = token1.substring(1,max);
    var apiURL = '/transaction?status=SUCCESS';
    var full = _url + apiURL;
    var url = Uri.parse(full);
    Map<String, String> headers = {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + subToken
        };
    try{
      final response = await http.get(url, headers: headers);
      if(response.statusCode == 200){
        var json =jsonDecode(response.body);
        final parsed = json['data']['data'].cast<Map<String, dynamic>>();
        return parsed.map<Transaction>((json) =>Transaction.fromJson(json)).toList();
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