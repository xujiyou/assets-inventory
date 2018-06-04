import 'package:flutter/material.dart';
import 'task.dart';

class StatisticsPage extends StatefulWidget {

  Map staMap;
  List<Place> placeList;

  StatisticsPage(this.staMap, this.placeList);

  @override
  StatisticsPageState createState() => new StatisticsPageState(staMap, this.placeList);

}

class StatisticsPageState extends State<StatisticsPage> with TickerProviderStateMixin {

  Map staMap;
  List<Place> placeList;
  Animation<double> animation;
  AnimationController controller;
  bool expend = false;

  StatisticsPageState(this.staMap, this.placeList);

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    animation = new Tween(begin: 0.0, end: 0.0).animate(controller);
    controller.forward();
  }

  void changeHeight(double begin, double end) {
    animation = new Tween(begin: begin, end: end).animate(controller)
      ..addListener(() {
        setState(() {
        });
      });
    controller.forward(from: 0.0);
    if (expend == false) {
      expend = true;
    } else {
      expend = false;
    }
  }

  Widget distribution() {
    List<Widget> widgetList = [];
    for (Place place in placeList) {
      widgetList.add(new Container(
        child: new Column(
          children: <Widget>[
            new Container(
              child: new Text(place.place, style: new TextStyle(color: Colors.white),),
              alignment: Alignment.topLeft,
            ),
            new Container(
              child: new Text("资产数量: " + place.count + ", " + "资产总值: " + place.price + " 元", style: new TextStyle(color: Colors.white70),),
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 4.0, bottom: 10.0),
              padding: const EdgeInsets.only(bottom: 4.0),
              decoration: new BoxDecoration(
                  border: new BorderDirectional(bottom: new BorderSide(color: Colors.white10))
              ),
            )
          ],
        ),
      ));
    }
    return new Column(
      children: widgetList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new Text("信息管理中心", style: new TextStyle(fontSize: 20.0, color: Colors.white),),
                              alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(top: 10.0)
                            ),
                            new Container(
                              child: new Text("资产数量: " + staMap["count"].toString(), style: new TextStyle(color: Colors.white70),),
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(top: 10.0, bottom: 4.0)
                            ),
                            new Container(
                              child: new Text("资产总值: " + staMap["price"].toString(), style: new TextStyle(color: Colors.white70),),
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(bottom: 4.0)
                            ),
                          ],
                        ),
                      ),
                    ),
                    new Expanded(
                      child: new AspectRatio(
                          aspectRatio: 4.0 / 1.2,
                          child: new Container(
                            foregroundDecoration:new BoxDecoration(
                                image: new DecorationImage(
                                  image: new NetworkImage("http://www.jnxy.edu.cn/images/logo.png"),
                                  centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                                ),
                                borderRadius: const BorderRadius.all(const Radius.circular(6.0))
                            ),
                          )
                      ),
                    )
                  ],
                ),
                new Container(
                  child: new RaisedButton(
                    onPressed: expend == false ? (){changeHeight(0.0, 1.0);} : (){changeHeight(1.0, 0.0);},
                    child: new Text("分布统计", style: new TextStyle(color: Colors.white),), color: Colors.blue
                  ),
                  height: 30.0,
                  margin: const EdgeInsets.only(right: 8.0, top: 20.0),
                  alignment: Alignment.topLeft,
                ),
                new ClipRect(
                  child: new Align(
                    alignment: Alignment.topCenter,
                    heightFactor: animation.value,
                    child: new Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      child: distribution(),
                    ),
                  )
                )
              ],
            ),
            width: 1000.0,
            margin: new EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0, top: 24.0),
            padding: new EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
            decoration: new BoxDecoration(
              color: Colors.blue,
              //box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.12), 0 1px 5px 0 rgba(0, 0, 0, 0.2);
              boxShadow: <BoxShadow>[
                new BoxShadow (
                    color: const Color(0x0e000000),
                    offset: new Offset(0.0, 2.0),
                    blurRadius: 2.0,
                    spreadRadius: 0.0
                ),
                new BoxShadow (
                    color: const Color(0x0c000000),
                    offset: new Offset(0.0, 3.0),
                    blurRadius: 1.0,
                    spreadRadius: -2.0
                ),
                new BoxShadow (
                    color: const Color(0x15000000),
                    offset: new Offset(0.0, 1.0),
                    blurRadius: 5.0,
                    spreadRadius: 0.0
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}