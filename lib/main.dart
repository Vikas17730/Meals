import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/modules/meals.dart';
import 'package:meals_app/screens/Category_meals_screen.dart';
import 'package:meals_app/screens/filters_Screen.dart';
import 'package:meals_app/screens/meal_detail_Screen.dart';
import 'screens/tabs_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'Glutan-Free': false,
    'Lactose-Free': false,
    'Vegetarian': false,
    'Vegan': false,
  };
  List<Meal> favourtieMeals = [];

  List<Meal> availableMeals = DUMMY_MEALS;
  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['Glutan-Free']! && (meal.isGlutenFree == false)) {
          return false;
        }
        if (filters['Lactose-Free']! && (meal.isLactoseFree == false)) {
          return false;
        }
        if (filters['Vegetarian']! && (meal.isVegetarian == false)) {
          return false;
        }
        if (filters['Vegan']! && (meal.isVegan == false)) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavourite(String id) {
    final existingIndex = favourtieMeals.indexWhere((meal) => meal.id == id);
    if (existingIndex >= 0) {
      setState(() {
        favourtieMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favourtieMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
      });
    }
  }

  bool isMealFavourite(String id) {
    return favourtieMeals.any((map) => map.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DaliyMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              subtitle1: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ))),
      //  home: CatogriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(favourtieMeals),
        Categorymeals.routeName: (ctx) => Categorymeals(availableMeals),
        mealDetailScreen.routeName: (ctx) =>
            mealDetailScreen(toggleFavourite, isMealFavourite),
        FilterScreen.routeName: (ctx) => FilterScreen(filters, setFilters),
      },
    );
  }
}
