import 'package:flutter/material.dart';
import '../screens/Category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String? title;
  final Color? colour;
  final String? id;
  CategoryItem(this.id, this.title, this.colour);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(Categorymeals.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title.toString(),
          style: Theme.of(context).textTheme.subtitle1,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colour!.withOpacity(0.7), colour!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
