import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FliterScreen extends StatefulWidget {
  FliterScreen(this.currentFilter, this.saveFilters, {Key key})
      : super(key: key);
  static const routeName = '/fliters';
  final Function saveFilters;
  final Map<String, bool> currentFilter;

  @override
  State<FliterScreen> createState() => _FliterScreenState();
}

class _FliterScreenState extends State<FliterScreen> {
  Widget _bulidSwitchTiel(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
        title: Text(description),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  void initState() {
    _GlutenFree = widget.currentFilter['gluten'];
    _GlutenFree = widget.currentFilter['Vegan'];

    _GlutenFree = widget.currentFilter['Vegetarian'];

    _GlutenFree = widget.currentFilter['lactose'];

    super.initState();
  }

  bool _GlutenFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;
  bool _LactoseFree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fliters"),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFliter = {
                  "gluten": _GlutenFree,
                  "Vegan": _Vegan,
                  "Vegetarian": _Vegetarian,
                  "lactose": _LactoseFree,
                };
                widget.saveFilters(selectedFliter);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _bulidSwitchTiel(
                "Gluten-free",
                "Gluten free meal",
                _GlutenFree,
                (newValue) {
                  setState(
                    () {
                      _GlutenFree = newValue;
                    },
                  );
                },
              ),
              _bulidSwitchTiel(
                "Lactose-free",
                "Lactose free meal",
                _LactoseFree,
                (newValue) {
                  setState(
                    () {
                      _LactoseFree = newValue;
                    },
                  );
                },
              ),
              _bulidSwitchTiel(
                "Vegan-free",
                "Vegan free meal",
                _Vegan,
                (newValue) {
                  setState(
                    () {
                      _Vegan = newValue;
                    },
                  );
                },
              ),
              _bulidSwitchTiel(
                "Vegetarian-free",
                "Vegetarian free meal",
                _Vegetarian,
                (newValue) {
                  setState(
                    () {
                      _Vegetarian = newValue;
                    },
                  );
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
