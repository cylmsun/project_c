import 'package:flutter/material.dart';

class ManyRowsList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("巨量列表滚动性能"),
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
      body: new ManyRowsListContent(),
    );
  }
}

class ManyRowsListContent extends StatelessWidget{
  Widget _buildListItem(BuildContext context, int index) {
    return Card(
      child: ListTile(
        leading: FlutterLogo(),
        title: Text('这是第  '+index.toString()+'  个Card'),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100000,
      itemBuilder: this._buildListItem,
    );
  }
}