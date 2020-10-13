import 'package:flutter/material.dart';
import 'MyAnimateOneUtil.dart';
// import 'listpage.dart';
import 'dataservice.dart';

class MyAnimateOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(color: Colors.white),
      child: new Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: new AppBar(
          title: Text("OverView"),
          centerTitle: true,
          elevation: 0.0, //底部阴影
          titleSpacing: NavigationToolbar.kMiddleSpacing,
          backgroundColor: Colors.white,
          textTheme: new TextTheme(
            title: new TextStyle(
              color: Colors.black87,
              fontSize: 22,
            ),
          ),
          leading: new IconButton(
            icon: new Icon(Icons.info_outline),
            iconSize: 30.0,
            color: Colors.grey,
            onPressed: () {},
          ),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.add_circle_outline),
              color: Colors.grey,
              iconSize: 30.0,
              onPressed: () {
                print(Percent().getPercent());
              },
            ),
          ],
        ),
        body: new Container(
          color: Colors.white,
          child: new HomeBody2(),
        ),
        floatingActionButton: new FloatingActionButton(
          child: new Icon(
            Icons.add,
          ),
          onPressed: () {
            // Navigator.of(context)
            //     .push(new MaterialPageRoute(builder: (BuildContext context) {
            //   return Edit();
            // }));
          },
        ),
      ),
    );
  }
}


class HomeBody2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new Center(
          child: new Column(
            children: <Widget>[
              new Text(
                "你还差得远呢",
                style: new TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    height: 1.5,
                    color: Colors.black54),
              ),
              new Text((Percent().getPercent()*100).toString()+"%"),
            ],
          ),
        ),
        new Padding(
          padding: EdgeInsets.only(top: 0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: 90,
                height: 390,
                margin: EdgeInsets.only(right: 10),
                //color: Colors.blue,
                alignment: Alignment.bottomCenter,
                child: PopCol(),
              ),
              new Container(
                width: 60,
                height: 300,
                child: new Align(
                  alignment: Alignment.bottomCenter,
                  child: new DecoratedBox(
                    position: DecorationPosition.foreground,
                    decoration: new BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 197, 221, 255),
                            Color.fromARGB(255, 140, 156, 255)
                          ]),
                    ),
                    child: PerCentCol(num: Percent().getPercent()),
                  ),
                ),
              ),

              ///中间
              /*new ClipPath(
                clipper: BottomClipper(),
                child: new Container(
                  width: 90,
                  height: 290,
                  margin: EdgeInsets.only(bottom: 0),
                  color: Colors.deepOrangeAccent,
                ),
              ),*/
              new Container(
                width: 90,
                height: 300,
                margin: EdgeInsets.only(left: 10),
                color: Colors.white,
              )
            ],
          ),
        ),
        new Container(
            margin: EdgeInsets.only(top: 0),
            height: 60,
            child: new ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                new Container(
                    width: 130,
                    margin: EdgeInsets.only(left: 20),
                    child: new FlatButton.icon(
                      color: Color.fromARGB(255, 242, 127, 166),
                      icon: new Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                        size: 28,
                      ),
                      label: new Text(
                        "跳转列表",
                        style: new TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {
                        // Navigator.of(context).push(
                        //   new MaterialPageRoute(
                        //       builder: (BuildContext context){
                        //         return ListPage();
                        //       }
                        //   ),
                        // );
                      },
                    )
                ),
                new Container(
                    width: 130,
                    margin: EdgeInsets.only(left: 20),
                    child: new FlatButton.icon(
                      color: Color.fromARGB(255, 101, 214, 222),
                      icon: new Icon(
                        Icons.timer,
                        color: Colors.white,
                        size: 28,
                      ),
                      label: new Text(
                        "按我",
                        style: new TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {},
                    )
                ),
                new Container(
                    width: 130,
                    margin: EdgeInsets.only(left: 20),
                    child: new FlatButton.icon(
                      color: Color.fromARGB(255, 253, 208, 89),
                      icon: new Icon(
                        Icons.timeline,
                        color: Colors.white,
                        size: 28,
                      ),
                      label: new Text(
                        "按我",
                        style: new TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {},
                    )
                ),
                new Container(
                    width: 130,
                    margin: EdgeInsets.only(left: 20),
                    child: new FlatButton.icon(
                      color: Color.fromARGB(255, 242, 127, 166),
                      icon: new Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                        size: 28,
                      ),
                      label: new Text(
                        "按我",
                        style: new TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {},
                    )
                ),
                new Container(
                    width: 130,
                    margin: EdgeInsets.only(left: 20),
                    child: new FlatButton.icon(
                      color: Color.fromARGB(255, 242, 127, 166),
                      icon: new Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                        size: 28,
                      ),
                      label: new Text(
                        "按我",
                        style: new TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {},
                    )
                ),
                new Container(
                    width: 130,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: new FlatButton.icon(
                      color: Color.fromARGB(255, 242, 127, 166),
                      icon: new Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                        size: 28,
                      ),
                      label: new Text(
                        "按我",
                        style: new TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {},
                    )
                )
              ],
            )
        ),
      ],
    );
  }
}
