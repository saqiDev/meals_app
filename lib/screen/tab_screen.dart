import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Your Favorite'}
  ];

  int _selectPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectPageIndex]['title'],
        ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
          ]),
    );
    // DefaultTabController(
    //     length: 2,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         title: const Text("Melas"),
    //         bottom: const TabBar(
    //           tabs: [
    //             Tab(
    //               icon: Icon(Icons.category),
    //               child: Text("Categories"),
    //             ),
    //             Tab(
    //               icon: Icon(Icons.favorite),
    //               child: Text("Favorites"),
    //             )
    //           ],
    //         ),
    //       ),
    //       body: const TabBarView(children: [
    //         CategoriesScreen(),
    //         FavoritesScreen(),
    //       ]),
    //     ));
  }
}
