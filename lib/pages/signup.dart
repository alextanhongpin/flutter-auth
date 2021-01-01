import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Column(
          children: <Widget>[
            TextButton(
                child: Text("Sign in"),
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                }
            )
          ]
        )
    );
  }
}
