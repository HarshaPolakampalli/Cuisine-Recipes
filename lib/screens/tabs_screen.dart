import 'package:flutter/material.dart';

import '../screens/categories_screen.dart';
import '../screens/favouritescreen.dart';
import '../widgets/side_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}
class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: SideDrawer(),
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text("Cuisine Recipes"),
            bottom: TabBar(tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: "Favourites",
              )
            ]),
          ),
          body: TabBarView(
              children: <Widget>[CategoriesScreen(), FavouriteScreen(widget.favouriteMeals)]),
        ));
  }
}
