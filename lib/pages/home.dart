import 'package:flutter/material.dart';
import 'package:auth/models/auth.dart';
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
                  Consumer<AuthModel>(
                    builder: (BuildContext context, AuthModel model, child) {
                      var user = model.user;
                      return Text(user.email);
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
                      Provider.of<AuthModel>(context, listen: false).logout();
                    },
                    child: Text('Logout')
                  )
                ]
            )
        )
    );
  }
}