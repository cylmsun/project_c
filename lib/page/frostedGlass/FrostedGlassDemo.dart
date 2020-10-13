import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedGlass extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '高斯模糊',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: FrostedGlassDemo(),
      ),
    );
  }
}

class FrostedGlassDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: new Image.asset('assets/image/img1.jpg'),
              // child: new FlutterLogo()
          ),
          new Center(
            child: new ClipRect(
              child: new BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Opacity(
                  opacity: 0.5,
                  child: new Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: new BoxDecoration(
//                  color: Colors.grey.shade200.withOpacity(0.5),
                      color: Colors.grey.shade200,
                    ),
                    child: new Center(
                      child: new Text('看这里',
                          style: Theme.of(context).textTheme.display3),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}