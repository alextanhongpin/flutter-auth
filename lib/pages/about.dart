import 'package:flutter/material.dart';
import 'package:auth/components/restaurant-list.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About Page'),
        ),
        body: RestaurantList()
    );
  }
}