import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Domains.
import 'package:auth/domains/user.dart';
import 'package:auth/domains/auth.dart';

// Apis.
import 'package:auth/apis/auth.dart';

class AuthModel with ChangeNotifier {
  User user;

  Future<User> authorize() async {
    if (user != null) return user;

    user = await postAuthorize();
    notifyListeners();
    return user;
  }

  logout() async {
    await _clearToken();
    this.user = null;

    notifyListeners();
  }

  register({String email, String password}) async {
    Credentials credential = await postRegister(email: email, password: password);
    await _storeToken(credential.accessToken);
    this.authorize();
  }

  login({ String email, String password }) async {
    Credentials credential = await postLogin(email: email, password: password);
    await _storeToken(credential.accessToken);
    this.authorize();
  }

  Future<bool> _storeToken(String accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString('accessToken', accessToken);
  }

  Future<bool> _clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.remove('accessToken');
  }
}