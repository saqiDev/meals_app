import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screen/categories_screen.dart';
import 'package:meals_app/screen/category_meals_screen.dart';
import 'package:meals_app/screen/fliter_screen.dart';
import 'package:meals_app/screen/mela_details_screen.dart';
import 'package:meals_app/screen/tab_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _fliters = {
    "gluten": false,
    "Vegan": false,
    "Vegetarian": false,
    "lactose": false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favortieMeal = [];
  void _setFliter(Map<String, bool> fliterData) {
    setState(
      () {
        _fliters = fliterData;
        _availableMeals = DUMMY_MEALS.where((meal) {
          if (_fliters['gluten'] && !meal.isGlutenFree) {
            return false;
          }
          if (_fliters['Vegan'] && !meal.isVegan) {
            return false;
          }
          if (_fliters['Vegetarian'] && !meal.isVegetarian) {
            return false;
          }
          if (_fliters['lactose'] && !meal.isLactoseFree) {
            return false;
          }
          return true;
        }).toList();
      },
    );
  }

  void _toggleFavorites(String mealId) {
    final existingIndex = _favortieMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favortieMeal.removeAt(existingIndex);
      });
    } else {
      _favortieMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }
  }

  bool isMealFavorite(String id) {
    return _favortieMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // ignore: deprecated_member_use
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyMedium: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            titleLarge: const TextStyle(
              fontSize: 20,
              fontFamily: "RobotoCondensed",
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: const CategoriesScreen(),
      // initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favortieMeal),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routName: (ctx) =>
            MealDetailScreen(_toggleFavorites, isMealFavorite),
        FliterScreen.routeName: (context) => FliterScreen(_fliters, _setFliter),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: const Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
