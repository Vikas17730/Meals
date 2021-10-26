import 'package:flutter/material.dart';
import 'package:meals_app/modules/meals.dart';
import 'package:meals_app/widget/meals_item.dart';

class Categorymeals extends StatefulWidget {
  static const routeName = '\Categories-meal';
  final List<Meal> availableMeals;
  Categorymeals(this.availableMeals);

  @override
  _CategorymealsState createState() => _CategorymealsState();
}

class _CategorymealsState extends State<Categorymeals> {
  String? Categorytitle;
  List<Meal>? displayedMeals;
  var loadedinitData = false;
  @override
  void initState() {
    //...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!loadedinitData) {
      final routeArg =
          ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
      Categorytitle = routeArg['title'];
      final Categoryid = routeArg['id'];
      displayedMeals = widget.availableMeals.where((m) {
        return m.categories!.contains(Categoryid);
      }).toList();
      loadedinitData = true;
    }

    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      displayedMeals!.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Categorytitle.toString()),
      ),
      body: Center(
          child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Mealitems(
            id: displayedMeals![index].id,
            title: displayedMeals![index].title,
            ImageURL: displayedMeals![index].imageUrl,
            duration: displayedMeals![index].duration,
            complexity: displayedMeals![index].complexity,
            affordability: displayedMeals![index].affordability,
          );
        },
        itemCount: displayedMeals!.length,
      )),
    );
  }
}
