import 'dart:async';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  var currentUser;
  
  Future getUser() {
    return Future.value(currentUser);
  }

  Future logout() {
    this.currentUser = null;
    notifyListeners();
    return Future.value(currentUser);
  }

  Future createUser({
    String firstName,
    String lastName,
    String email,
    String password
  }) async {

  }

  Future loginUser({ String email, String password }) {
    if (password == '1234') {
      this.currentUser = { email };
      notifyListeners();
      return Future.value(currentUser);
    }
    this.currentUser = null;
    notifyListeners();
    return Future.error('Wrong username or password');
  }
}