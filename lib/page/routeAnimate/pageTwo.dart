import 'package:flutter/material.dart';
import 'cool_button.dart';
import 'pageThree.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcb7d6),
      body: Stack(
        children: [
          Center(
            child: Text('第二个页面'),
          ),
          Align(
              alignment: Alignment(0, 0.5),
              child: CoolButton(
                curPageAccentColor: Color(0xfffcb7d6),
                buttonColor: Colors.white,
                nextButtonColor: Colors.green,
                pushPage: PageThree(),
              )),
        ],
      ),
    );
  }
}
