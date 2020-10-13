import 'package:flutter/material.dart';
import 'main.dart';
import 'advancePage.dart';

class OwnDrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _OwnDrawerState();
  }
}

class _OwnDrawerState extends State<OwnDrawer>{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            '哎呀呀',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('基础'),
          onTap: (){
            Navigator.pushAndRemoveUntil(context, (new MaterialPageRoute(
                builder: (BuildContext context) {
                  return MyApp();
                })),(route)=>false);
          },
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('进阶'),
          onTap: (){
            Navigator.pushAndRemoveUntil(context, (new MaterialPageRoute(
                builder: (BuildContext context) {
                  return AdvancePage();
                })),(route)=>false);
          },
        ),
      ],
    );
  }
}