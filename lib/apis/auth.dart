import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

// Domains.
import 'package:auth/domains/error.dart';
import 'package:auth/domains/auth.dart';
import 'package:auth/domains/user.dart';


String buildURL(String path) {
  return 'http://localhost:3000$path';
}

Future<Credentials> postLogin({String email, password}) async {
  final response = await http.post(
      buildURL('/login'),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': email,
        'password': password,
      })
  );
  if (response.statusCode == 200) {
    return Credentials.fromJson(jsonDecode(response.body));
  }
  var errorResponse = ErrorResponse.fromJson(jsonDecode(response.body));
  throw Exception(errorResponse.error);
}

Future<Credentials> postRegister({String email, password}) async {
  final response = await http.post(
      buildURL('/register'),
      headers: <String, String> {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': email,
        'password': password,
      })
  );
  if (response.statusCode == 200) {
    return Credentials.fromJson(jsonDecode(response.body));
  }
  var errorResponse = ErrorResponse.fromJson(jsonDecode(response.body));
  throw Exception(errorResponse.error.toString());
}


Future<User> postAuthorize() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String accessToken = prefs.getString('accessToken') ?? '';
  if (accessToken.isEmpty) {
    return null;
  }
  final response = await http.post(
      buildURL('/authorize'),
      headers: <String, String> {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        HttpHeaders.authorizationHeader: accessToken,
      }
  );
  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  }
  var errorResponse = ErrorResponse.fromJson(jsonDecode(response.body));
  throw Exception(errorResponse.error.toString());
}