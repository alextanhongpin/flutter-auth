import 'dart:async';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  var currentUser;

  AuthService() {
    print('new auth service');
  }

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
    print("AuthService.login_user($email, $password)");
    if (password == '1234') {
      this.currentUser = { email };
      notifyListeners();
      return Future.value(currentUser);
    } else {
      this.currentUser = null;
      return Future.value(null);
    }
  }
}