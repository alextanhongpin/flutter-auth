import 'package:flutter/material.dart';
import 'package:auth/components/food-item.dart';

class FoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          _buildSliverPadding(context),
          _buildSliverListHorizontal(context),
          _buildSliverList(context)
        ]
      )
    );
  }

  Widget _buildSliverAppBar(context) {
    return SliverAppBar(
        snap: true,
        pinned: true,
        floating: true,
        expandedHeight: 150.0,
        flexibleSpace: const FlexibleSpaceBar(title: Text('Profile')),
        actions: [
          IconButton(
              icon: const Icon(Icons.add_circle),
              tooltip: 'Add new entry',
              onPressed: () {
                print('hello');
              }
          )
        ]
    );
  }

  Widget _buildSliverPadding(context) {
    return SliverPadding(
        padding: EdgeInsets.all(16.0),
        sliver: SliverList(
            delegate: SliverChildListDelegate(
                [
                  Card(
                      child: Text('hello')
                  ),
                  Card(
                      child: Text('world')
                  )
                ]
            )
        )
    );
  }

  Widget _buildSliverListHorizontal(context) {
    return SliverToBoxAdapter(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            height: 160.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                      width: 240.0,
                      child: Card(
                          child: FoodItem()
                      )
                  );
                }
            )
        )
    );
  }

  Widget _buildSliverList(context) {
    return SliverToBoxAdapter(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(child: FoodItem());
                }
            )
        )
    );
  }
}