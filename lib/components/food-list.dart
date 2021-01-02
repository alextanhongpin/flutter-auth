import 'package:flutter/material.dart';

class FoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
          ),
          SliverPadding(
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
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100.0,
                    child: Card(
                      child: Text('hello world')
                    )
                  );
                }
              )
            )
          ),
          SliverToBoxAdapter(
              child: Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                            width: 100.0,
                            child: Card(
                                child: Container(
                                  height: 100.0,
                                  child: Text('hello world')
                                )
                            )
                        );
                      }
                  )
              )
          )
        ]
      )
    );
  }
}