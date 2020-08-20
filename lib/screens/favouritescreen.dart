import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';
class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouriteScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {

    if(favouriteMeals.length>0){
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: favouriteMeals[index].id,
              title: favouriteMeals[index].title,
              imageUrl: favouriteMeals[index].imageUrl,
              affordability: favouriteMeals[index].affordability,
              complexity: favouriteMeals[index].complexity,
              duration: favouriteMeals[index].duration);
        },
        itemCount: favouriteMeals.length,
      );
    }else{
      return Container(
          child: Text("You Don't have favourites"), alignment: Alignment.center);
    }

  }
}
