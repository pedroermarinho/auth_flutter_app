import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Container(
          child: Center(
            child: ElevatedButton(
              child: Text("signOut"),
              onPressed: controller.signOut,
            ),
          ),
        ),
      );
}
