import 'package:flutter/material.dart';
import 'cool_button.dart';
import 'pageTwo.dart';

class PageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          Center(
            child: Text('第四个页面'),
          ),
          Align(
              alignment: Alignment(0, 0.5),
              child: CoolButton(
                curPageAccentColor: Colors.green,
                buttonColor: Colors.red,
                nextButtonColor: Colors.red,
                pushPage: PageTwo(),
              )),
        ],
      ),
    );
  }
}
