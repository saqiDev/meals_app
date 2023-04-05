import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;
  // const CategoryMealsScreen(this.categoryId, this.categoryTitle, {Key key})
  //     : super(key: key);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: categoryMeal[index].id,
                title: categoryMeal[index].title,
                imageUrl: categoryMeal[index].imageUrl,
                duration: categoryMeal[index].duration,
                complexity: categoryMeal[index].complexity,
                affordability: categoryMeal[index].affordability);
          },
          itemCount: categoryMeal.length,
        ));
  }
}
