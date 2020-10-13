import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("闪")),
      backgroundColor: Colors.black12,
      body: Container(
          padding: const EdgeInsets.all(8.0),
          child:Center(
            child: SizedBox(
              width: 200.0,
              height: 100.0,
              child: Shimmer.fromColors(
                baseColor: Colors.red,
                highlightColor: Colors.yellow,
                child: Text(
                  '闪闪闪闪闪',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
      ),
    );
  }
}