import 'package:flutter/material.dart';
import 'package:auth/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:auth/components/star-rating.dart';
import 'package:auth/components/restaurant-list.dart';

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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome ${user}",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20.0),

              RestaurantList(),
              SizedBox(height: 20.0),

              Row(
                children: [
                  Image(
                    width: 160.0,
                    image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  ),
                  Column(
                    children: [
                      Text('Title', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                      Text('Description'),
                      StarRating(rating: 4.5,)
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