// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'entity/todo.dart';
import 'dart:convert';

class Percent{
  int num=0;
  int total=0;
  // List<TodoObj> todos=new List<TodoObj>();
  // final storage = new FlutterSecureStorage();

  //单例模式
  factory Percent() =>_getInstance();
  static Percent get instance => _getInstance();

  static Percent _instance;
  Percent._internal() {
    num=80;
    total=100;
    // _initDate();
  }
  static Percent _getInstance() {
    if (_instance == null) {
      _instance = new Percent._internal();
    }
    return _instance;
  }


  // _initDate() async{
  //   var allValues = await storage.readAll();
  //   allValues.forEach((dateStr,str){
  //     DateTime mainDate=DateTime.parse(dateStr);
  //     var l = json.decode(str);
  //     var tasks = l.map((Map model)=> TaskObj.fromJson(model)).toList();
  //     var todo=new TodoObj(mainDate, tasks);
  //     todos.add(todo);
  //   });
  //   todos.sort((a,b)=>a.date.compareTo(b.date));
  //   await accNumber();
  // }

  // accNumber() async{
  //   var now=DateTime.now();
  //   todos.forEach((todo){
  //     todo.tasks.forEach((task){
  //       total++;
  //       if(task.isDone==1){
  //         if(task.date.compareTo(now)<=0){
  //           num++;
  //         }
  //       }
  //     });
  //   });
  // }

  double getPercent(){
    if(total==0){
      return 0;
    }else{
      return ((num/total)*100.floorToDouble())/100;
    }
  }

  // saveNewTodo(String day,String time,String content){
  //   DateTime dt=DateTime.parse(day+" "+time);
  //   DateTime dtStart=DateTime.parse(day);
  //   var taskObj=new TaskObj(dt, content, 0);
  //   var existTodoObj=todos.firstWhere((item)=>item.date.compareTo(dtStart)==0,orElse: null);
  //   if(existTodoObj==null){
  //     var tmpObj=new List<TaskObj>();
  //     tmpObj.add(taskObj);
  //     existTodoObj=new TodoObj(dtStart,tmpObj);
  //     //保存
  //     storage.write(key: dtStart.toString(), value: JsonEncoder().convert(existTodoObj)).then((content)=>{
  //       todos.add(existTodoObj)
  //     });
  //   }else{
  //     //保存
  //     storage.delete(key: dtStart.toString()).then((x)=>{
  //       storage.write(key: dtStart.toString(), value: JsonEncoder().convert(existTodoObj)).then((content)=>{
  //         existTodoObj.tasks.add(taskObj)
  //       })
  //     });
  //   }
  // }
}