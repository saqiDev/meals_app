import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favortieMeal;
  const FavoritesScreen(this.favortieMeal, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favortieMeal.isEmpty) {
      return const Center(
        child: Text("You have no Favorites yet- start adding some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favortieMeal[index].id,
            title: favortieMeal[index].title,
            imageUrl: favortieMeal[index].imageUrl,
            duration: favortieMeal[index].duration,
            complexity: favortieMeal[index].complexity,
            affordability: favortieMeal[index].affordability,
          );
        },
        itemCount: favortieMeal.length,
      );
    }
  }
}
