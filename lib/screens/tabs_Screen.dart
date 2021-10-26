import 'package:flutter/material.dart';
import 'package:meals_app/modules/meals.dart';
import 'package:meals_app/widget/main_drawer.dart';
import 'Catogries_Screen.dart';
import 'favorites_Screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favourtieMeals;
  TabsScreen(this.favourtieMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>>? Pages;
  int selectedPageIndex = 0;
  @override
  void initState() {
    Pages = [
      {'page': CatogriesScreen(), 'title': 'Categories'},
      {
        'page': FavoritesScreen(widget.favourtieMeals),
        'title': 'Your Favorites'
      }
    ];
    super.initState();
  }

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Pages![selectedPageIndex]['title'].toString()),
      ),
      drawer: MainDrawer(),
      body: Pages![selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectPage,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: selectedPageIndex,
          backgroundColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category),
                title: Text('Categories')),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.star),
                title: Text('Favorites')),
          ]),
    );
  }
}
