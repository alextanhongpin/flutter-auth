import 'dart:async';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Domains.
import 'package:auth/domains/user.dart';
import 'package:auth/domains/auth.dart';

// Apis.
import 'package:auth/apis/auth.dart';

class AuthModel with ChangeNotifier {
  User user;

  AuthModel() {
    // The right way to call the method once instead of putting it in
    // initState in a stateful widget.
    authorize();
  }

  Future<User> fetchUser() async {
    return user;
  }

  authorize() async {
    // Skip if user is already authorized.
    if (user != null) return;

    // Don't authorize if there are no token.
    String token = await _getToken();
    if (token.isEmpty) {
      return;
    }

    user = await postAuthorize();
    notifyListeners();
  }

  logout() async {
    await _clearToken();
    this.user = null;

    notifyListeners();
  }

  register({String email, String password}) async {
    Credentials credential = await postRegister(
        email: email,
        password: password
    );
    await _storeToken(credential.accessToken);
    await this.authorize();
  }

  login({ String email, String password }) async {
    Credentials credential = await postLogin(
        email: email,
        password: password
    );
    await _storeToken(credential.accessToken);
    await this.authorize();
  }

  Future<bool> _storeToken(String accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString('accessToken', accessToken);
  }

  Future<bool> _clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.remove('accessToken');
  }

  Future<String> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString('accessToken') ?? '';
  }
}