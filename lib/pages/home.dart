import 'package:flutter/material.dart';
import 'package:auth/services/auth.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
            child: Column(
                children: [
                  Consumer<AuthService>(
                    builder: (BuildContext context, AuthService service, child) {
                      var user = service.currentUser;
                      return Text(user['email']);
                    }
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/about');
                      },
                      child: Text('Go to about')
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<AuthService>(context, listen: false).logout();
                    },
                    child: Text('Logout')
                  )
                ]
            )
        )
    );
  }
}