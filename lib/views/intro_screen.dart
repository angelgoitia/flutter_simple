import 'package:flutter/material.dart';
import 'package:flutter_simple/views/intro_screnn_widget/loginPage.dart';
import 'package:page_indicator/page_indicator.dart';

class IntroScreen extends StatelessWidget {
  static Widget create(BuildContext context) => IntroScreen();

  final String exampleText =
      'Lorem ipsum dolor sit amet, consecrated advising elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
      ),
      body: SafeArea(
        child: PageIndicatorContainer(
          child: PageView(
            children: <Widget>[
              /*DescriptionPage(
                text: exampleText,
                imagePath: 'assets/intro_1.png',
              ),
              DescriptionPage(
                text: exampleText,
                imagePath: 'assets/intro_2.png',
              ),*/
              /*DescriptionPage(
                text: exampleText,
                imagePath: 'assets/intro_3.png',
              ),*/

              LoginPage(),
            ],
          ),
          align: IndicatorAlign.bottom,
          length: 2, /* Numero de tabs*/
          indicatorSpace: 12,
          indicatorColor: Colors.grey,
          indicatorSelectorColor: Colors.black,
        )
      ),
    );
  }
}

