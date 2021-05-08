import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'splash_screen_controller.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState
    extends ModularState<SplashScreenPage, SplashScreenController> {
  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
}
