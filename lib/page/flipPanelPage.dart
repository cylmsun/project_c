import 'package:flutter/material.dart';
import 'package:flip_panel/flip_panel.dart';

class FlipPanelPage extends StatelessWidget{
  final digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("翻页钟")),
      body: Container(
          padding: const EdgeInsets.all(8.0),
          child:Center(
            child: FlipPanel.builder(
              itemBuilder: (context, index) => Container(
                color: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(
                  '${digits[index]}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                      color: Colors.white),
                ),
              ),
              itemsCount: digits.length,
              period: const Duration(milliseconds: 1000),
              loop: 1,
            )
          )
      ),
    );
  }
}