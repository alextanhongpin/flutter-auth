import 'package:flutter/material.dart';
import 'package:auth/models/auth.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String user = context.watch<AuthModel>().user.email;

    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "Welcome ${user}",
                style: TextStyle(fontSize: 20.0),
              ),

              Row(
                children: [
                  Image(
                    width: 160.0,
                    image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  ),
                  Column(
                    children: [
                      Text('Title', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                      Text('Description')
                    ],
                  )
                ],
              ),

              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  child: Text('Go to about')
              ),
              TextButton(
                  onPressed: () {
                    context.read<AuthModel>().logout();
                  },
                  child: Text('Logout')
              )
            ]
        )
      ),
    );
  }
}