import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class HeroDemoOne extends StatefulWidget {
  @override
  _HeroDemoOneState createState() => _HeroDemoOneState();
}

class _HeroDemoOneState extends State<HeroDemoOne> {
  Hero _sourceHero = new Hero(
      tag: "hero tag",
    child: Container(
      height: 100.0,
      width: 100.0,
      color: Colors.lightBlue,
    ),
  );

  @override
  Widget build(BuildContext context) {
    timeDilation = 3.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('第一页'),
      ),
      body: Center(),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(
          Icons.add,
        ),
        heroTag: "hero tag",
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return DestinationHeroPage();
            }),
          );
        },
      ),
    );
  }
}

class DestinationHeroPage extends StatefulWidget {
  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationHeroPage> {
  Hero _destinationHero = new Hero(
      tag: "hero tag",
      child: Container(
        height: 100.0,
        color: Colors.blue,
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二页'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
              child: _destinationHero, onTap: () => Navigator.of(context).pop())
        ],
      ),
    );
  }
}