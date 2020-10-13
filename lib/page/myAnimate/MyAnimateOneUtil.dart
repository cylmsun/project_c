import 'package:flutter/material.dart';
import 'dataservice.dart';

class PerCentCol extends StatefulWidget {
  final double num;
  const PerCentCol({
    @required this.num,
  });

  @override
  State<StatefulWidget> createState() {
    return new _PerCentColState(num: num);
  }
}
class _PerCentColState extends State<PerCentCol> with TickerProviderStateMixin {
  final double num;
  _PerCentColState({
    @required this.num,
  });
  Animation<double> _height;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _initAni();
    _animationController.forward();
  }

  void _initAni() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1500));
    _height = Tween(
      begin: 0.1,
      end: 300 * num,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutQuart,
    ))
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    _height.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //_animationController.repeat();
      } else if (status == AnimationStatus.dismissed) {
        //_animationController.forward();
      }
    });
  }

  dispose() {
    _animationController.dispose();
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
  void didUpdateWidget(PerCentCol oldWidget) {
    _initAni();
    _animationController.forward();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 60,
      height: _height.value,
      margin: EdgeInsets.only(bottom: 0),
      color: Colors.deepOrangeAccent,
    );
    /*return new ClipPath(
      clipper: BottomClipper(),
      child: new Container(
        width: 60,
        height: _height.value,
        margin: EdgeInsets.only(bottom: 0),
        color: Colors.deepOrangeAccent,
      ),
    );*/
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 10);
    var firstControlPoint = Offset(size.width / 4, 20);
    var firstEndPoint = Offset(size.width / 2.25, 10);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width / 4 * 3, 0);
    var secondEndPoint = Offset(size.width, 10);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    //path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    //path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}




class PopCol extends StatefulWidget {
  PopCol({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _PopColState();
  }
}
class _PopColState extends State<PopCol> with TickerProviderStateMixin {
  double syx; //这边不能用final，因为数字会随时改变
  Animation<double> _bottom;
  AnimationController _animationController;

  void _initAni() {
    syx=Percent().getPercent();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _bottom = Tween(
      begin: 1.0,
      end: 300 * syx,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      });
    _bottom.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //_animationController.repeat();
      } else if (status == AnimationStatus.dismissed) {
        //_animationController.forward();
      }
    });
  }

  /*当Widget第一次插入到Widget树时会被调用*/
  @override
  void initState() {
    super.initState();
    _initAni();
    _animationController.forward();
  }

  //当State对象从树中被永久移除时调用；通常在此回调中释放资源
  @override
  void dispose() {
    _animationController.dispose();
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
  void didUpdateWidget(PopCol oldWidget) {
    _initAni();
    _animationController.forward();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(bottom: _bottom.value),
      child: new Stack(
        children: <Widget>[
          new Image(
            image: new AssetImage('assets/pop1.png'),
            width: 90,
            height: 90,
          ),
          new Container(
            width: 90,
            height: 90,
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              right: 5,
            ),
            child: new Text(
              ((_bottom.value / 300) * 100).toStringAsFixed(1) + "%",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}