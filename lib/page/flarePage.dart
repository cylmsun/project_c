import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class FlarePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _FlarePageState();
  }
}

class _FlarePageState extends State<FlarePage>{
  bool isCheck;
  int animationState;
  String animationName;
  Duration timeout = const Duration(seconds: 1);

  @override
  void initState() {
    isCheck=true;
    animationState=1;
    animationName="night_idle";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text("自制flare动画效果"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            setState(() {
              changeAnimation();
              isCheck=!isCheck;
            });
          },
          child: FlareActor(
            "assets/switch_daytime.flr",
            alignment:Alignment.center,
            fit:BoxFit.contain,
            animation: animationName,
            callback: (name){
              print('afterTimer=2');
              Timer(timeout, () { //不管用?
                print('4');
                animationName=(name=="switch_day"?"day_idle":"night_idle");
              });
              print('afterTimer=3');
            },
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     setState(() {});
      //   },
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }

  //每次改变状态，只需要对应两个转变动画，结束动画由回调改变
  void changeAnimation(){
    print('afterTimer=1');
    if(isCheck){
      animationName="switch_day";
    }else{
      animationName="switch_night";
    }
  }
}