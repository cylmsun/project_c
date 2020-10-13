import 'package:flutter/material.dart';
import 'cool_button.dart';
import 'pageFour.dart';

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Text('第三个页面'),
          ),
          Align(
            alignment: Alignment(0, 0.5),
            child: CoolButton(
              curPageAccentColor: Colors.white,
              buttonColor: Colors.green,
              nextButtonColor: Colors.red,
              pushPage: PageFour(),
            ),
          ),
        ],
      ),
    );
  }
}
