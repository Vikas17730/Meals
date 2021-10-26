import 'package:flutter/material.dart';
import 'package:meals_app/modules/meals.dart';
import '../widget/meals_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favourtieMeals;
  FavoritesScreen(this.favourtieMeals);
  @override
  Widget build(BuildContext context) {
    if (favourtieMeals.isEmpty) {
      return Center(child: Text('No Favourites Yet!'));
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return Mealitems(
            id: favourtieMeals[index].id,
            title: favourtieMeals[index].title,
            ImageURL: favourtieMeals[index].imageUrl,
            duration: favourtieMeals[index].duration,
            complexity: favourtieMeals[index].complexity,
            affordability: favourtieMeals[index].affordability,
          );
        },
        itemCount: favourtieMeals.length,
      );
    }
  }
}
