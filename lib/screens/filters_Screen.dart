import 'package:flutter/material.dart';
import 'package:meals_app/widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function? saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);
  static const routeName = 'filter-Screen';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool txGLutanfree = false;
  bool txLactosefree = false;
  bool txVegetarian = false;
  bool txVegan = false;
  @override
  initState() {
    txGLutanfree = widget.currentFilters['Glutan-Free']!;
    txLactosefree = widget.currentFilters['Lactose-Free']!;
    txVegetarian = widget.currentFilters['Vegetarian']!;
    txVegan = widget.currentFilters['Vegan']!;
    super.initState();
  }

  Widget buildSwitch(String titletx, bool txvalue) {
    return SwitchListTile(
      title: Text(titletx),
      subtitle: Text("Include ${titletx} meals Only"),
      value: txvalue,
      onChanged: (bool newValue) => setState(() {
        txvalue = newValue;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Filters"),
          actions: [
            IconButton(
                onPressed: () {
                  final SelectedFilters = {
                    'Glutan-Free': txGLutanfree,
                    'Lactose-Free': txLactosefree,
                    'Vegetarian': txVegetarian,
                    'Vegan': txVegan,
                  };
                  widget.saveFilters!(SelectedFilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust Your Meal',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                buildSwitch('Glutan-Free', txGLutanfree),
                buildSwitch('Lactose-Free', txLactosefree),
                buildSwitch('Vegetarian', txVegetarian),
                buildSwitch('Vegan', txVegan),
              ],
            ))
          ],
        ));
  }
}
