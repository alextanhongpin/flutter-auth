import 'package:flutter/material.dart';


class FoodItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.search),
      title: Text("Title"),
      subtitle: Text('Description')
    );
  }
}