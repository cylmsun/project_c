import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  FocusNode blankNode = FocusNode();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: new Scaffold(
        appBar: new AppBar(
          //title: Text("新建"),
          centerTitle: true,
          elevation: 0.0, //底部阴影
          titleSpacing: NavigationToolbar.kMiddleSpacing,
          backgroundColor: Color.fromARGB(255, 63, 81, 181),
          textTheme: new TextTheme(
            title: new TextStyle(
              color: Colors.black87,
              fontSize: 22,
            ),
          ),
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
        body: new EditBody(),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(blankNode);
      },
    );
  }
}

class EditBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _EditBodyState();
  }
}
class _EditBodyState extends State<EditBody>{
  final contentController=new TextEditingController();
  final dateController=new TextEditingController();
  String day = "";
  String time = "";

  /*当Widget第一次插入到Widget树时会被调用*/
  @override
  void initState() {
    super.initState();
    _initAni();
  }

  //当State对象从树中被永久移除时调用；通常在此回调中释放资源
  @override
  void dispose() {
    super.dispose();
  }

  //当State对象的依赖发生变化时会被调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  //当State对象从树中被移除时
  @override
  void deactivate() {
    super.deactivate();
  }

  //如果Widget.canUpdate返回true则会调用此回调
  @override
  void didUpdateWidget(EditBody oldWidget) {
    _initAni();
    super.didUpdateWidget(oldWidget);
  }

  void _initAni() {
    var now=DateTime.now();
    day=now.year.toString()+"-"+now.month.toString().padLeft(2,'0')+"-"+now.day.toString();
    time=now.hour.toString().padLeft(2,'0')+":"+now.minute.toString().padLeft(2,'0');
  }

  void _showDate() async {
    var picker = await showDatePicker(
      locale: Locale('zh'),
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2100)
    );
    setState(() {
      day=picker.year.toString()+"-"+picker.month.toString().padLeft(2,'0')+"-"+picker.day.toString();
    });
  }

  void _showTime() async {
    var picker = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    setState(() {
      print(picker.hour);
      time=picker.hour.toString().padLeft(2,'0')+":"+picker.minute.toString().padLeft(2,'0');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Stack(
        children: <Widget>[
          new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Container(
                      height: 200,
                      color: Color.fromARGB(255, 63, 81, 181),
                      child: new Center(
                        child: new SizedBox(
                          width: 350,
                          child: new TextField(
                            controller: contentController,
                            style: new TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "事项内容：",
                              labelStyle: new TextStyle(color: Colors.white,fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              new Expanded(
                child: new Row(
                  children: <Widget>[
                    new Flexible(
                      child:new Center(
                        child: new SizedBox(
                          width: 350,
                          child: new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new GestureDetector(
                                  child: new Container(
                                    height: 30,
                                    decoration: new BoxDecoration(
                                        border: new Border(bottom: BorderSide(color: Colors.grey))
                                    ),
                                    child: new Center(
                                      child: new Text(day),
                                    ),
                                  ),
                                  onTap: (){
                                    _showDate();
                                  },
                                ),
                                flex: 3,
                              ),
                              new Expanded(
                                child: new Center(
                                  child: new Text(":"),
                                ),
                                flex: 1,
                              ),
                              new Expanded(
                                child: new GestureDetector(
                                  child: new Container(
                                    height: 30,
                                    decoration: new BoxDecoration(
                                      border: new Border(bottom: BorderSide(color: Colors.grey)),
                                    ),
                                    child: new Center(
                                      child: new Text(time),
                                    ),
                                  ),
                                  onTap: (){
                                    _showTime();
                                  },
                                ),
                                flex: 3,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          new Container(
            width: 50,
            height: 50,
            decoration: new BoxDecoration(
              color: Color.fromARGB(255, 3, 169, 244),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            margin: EdgeInsets.only(top: 175,left: 350,),
            child: new Center(
              child: new IconButton(
                  icon: new Icon(Icons.send,color: Colors.white,),
                  onPressed: (){
                    print(contentController.text);
                    print(day);
                    print(time);
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }
}