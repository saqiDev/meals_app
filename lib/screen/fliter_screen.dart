import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FliterScreen extends StatelessWidget {
  const FliterScreen({Key key}) : super(key: key);
  static const routeName = '/fliters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fliters"),
      ),
      drawer: const MainDrawer(),
      body: const Center(
        child: Text("Fliter Screen !"),
      ),
    );
  }
}
