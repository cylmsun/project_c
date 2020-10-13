import 'package:flutter/material.dart';
import 'cool_button.dart';
import 'pageTwo.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  Color buttonColor = Color(0xfffcb7d6);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff013bca),
      body: Stack(
        children: [
          Center(
            child: Text('第一个页面'),
          ),
          Align(
            alignment: Alignment(0, 0.5),
            child: CoolButton(
              curPageAccentColor: Color(0xff013bca),
              buttonColor: Color(0xfffcb7d6),
              nextButtonColor: Colors.white,
              pushPage: PageTwo(),
            ),
          ),
        ],
      ),
    );
  }
}
