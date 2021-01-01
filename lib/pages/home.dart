import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Startup name generator'),
        ),
        body: Center(
            child: Column(
                children: [
                  TextButton(
                      child: Text("Sign Up"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      }
                  ),
                  TextButton(
                      child: Text("Sign in"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signin');
                      }
                  )
                ]
            )
        )
    );
  }
}