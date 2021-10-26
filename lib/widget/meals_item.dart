import 'package:flutter/material.dart';
import 'package:meals_app/modules/meals.dart';
import 'package:flutter/foundation.dart';
import 'package:meals_app/screens/meal_detail_Screen.dart';

class Mealitems extends StatelessWidget {
  final String? id;
  final String? title;
  final String? ImageURL;
  final int? duration;
  final Complexity? complexity;
  final Affordability? affordability;
  Mealitems(
      {@required this.id,
      @required this.title,
      @required this.ImageURL,
      @required this.duration,
      @required this.complexity,
      @required this.affordability});
  String? get complexitytest {
    if (complexity == Complexity.Simple) {
      return 'Simple';
    }
    if (complexity == Complexity.Challenging) {
      return 'Challenging';
    }
    if (complexity == Complexity.Hard) {
      return 'Hard';
    }
  }

  String? get testaffordability {
    if (affordability == Affordability.Affordable) {
      return 'Affordable';
    }
    if (affordability == Affordability.Pricey) {
      return 'Pricey';
    }
    if (affordability == Affordability.Luxurious) {
      return 'Luxurious';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      mealDetailScreen.routeName,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        print(result);
        // removeItem!(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    ImageURL!,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title!,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 2,
                        ),
                        Text('$duration min'),
                      ],
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(
                          width: 2,
                        ),
                        Text(complexitytest!),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 2,
                        ),
                        Text(testaffordability!),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
