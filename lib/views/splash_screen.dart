import 'package:flutter_simple/controller/mainController.dart';

import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  static Widget create(BuildContext context) => SplashScreen();

  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (_home) => WillPopScope(
        onWillPop: () async =>false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Welcome'),
          ),
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top:5, bottom: 5),
                  child: AutoSizeText(
                    "Loading...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    maxFontSize: 24,
                    minFontSize: 24,
                  ),
                ),
                CircularProgressIndicator(),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
