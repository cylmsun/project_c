import 'package:flutter/material.dart';

class ManyRowsList2 extends StatefulWidget {
  @override
  _ManyRowsList2State createState() => _ManyRowsList2State();
}

class _ManyRowsList2State extends State<ManyRowsList2> {
  List<String> list = List.generate(100000, (index) => "第  $index  个Card");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('巨量列表滚动性能2'),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop(

            );
          },
        ),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(list[index]),
              direction: DismissDirection.endToStart,
              movementDuration: Duration(milliseconds: 300),
              child: Card(
                child: ListTile(
                  leading: FlutterLogo(),
                  title: Text('这是'+'${list[index]}'),
                ),
              ),
              background: Container(
                color: Colors.redAccent,
              ),
              onDismissed: (direction) {
                setState(() {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('删除'+"${list[index]}"),duration:Duration(milliseconds: 500)));
                  list.removeAt(index);
                });
              },
            );
          }),
    );
  }
}