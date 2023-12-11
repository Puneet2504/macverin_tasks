import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 4,
      child: TabBar(
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
        // isScrollable: true,
        tabs: [
          Tab(
            child: Text(
              'Forte',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Tab(
            child: Text(
              'Posts',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Tab(
            child: Text(
              'Group',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Tab(
            child: Text(
              'Reactions',
              style: TextStyle(fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
