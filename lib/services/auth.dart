import 'dart:async';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  var currentUser;

  Future getUser() async {
    return currentUser;
  }

  Future logout() async {
    this.currentUser = null;
    notifyListeners();
  }

  Future createUser({
    String firstName,
    String lastName,
    String email,
    String password
  }) async {

  }

  Future loginUser({ String email, String password }) async {
    if (password == '1234') {
      this.currentUser = { 'email': email };
      notifyListeners();
      return currentUser;
    }
    this.currentUser = null;
    throw Exception('Wrong username or password');
  }
}