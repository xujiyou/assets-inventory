import 'package:flutter/material.dart';
import 'task.dart';
import 'assets_view_page.dart';
import 'define_task_page.dart';
import 'dart:async';

class InventoryPage extends StatefulWidget {

  final List<Task> taskList;
  final List<Place> placeList;

  InventoryPage(this.taskList, this.placeList);

  @override
  _InventoryPageState createState() => new _InventoryPageState(taskList, placeList);
}

class _InventoryPageState extends State<InventoryPage>{

  List<Task> taskList;
  final List<Place> placeList;

  _InventoryPageState(this.taskList, this.placeList);

  void changeHeight(Task task, double begin, double end) {
    task.animation = new Tween(begin: begin, end: end).animate(task.controller)
      ..addListener(() {
        setState(() {
        });
      });
    task.controller.forward(from: 0.0);
    if (task.expend == false) {
      task.expend = true;
    } else {
      task.expend = false;
    }
  }

  Widget taskCard(Task task) {

    String location = "";
    for (String place in task.define.place) {
      location += place + ", ";
    }
    location = location.substring(0, location.length - 2);
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Text(task.name, style: new TextStyle(fontSize: 20.0),),
            alignment: Alignment.topLeft,
          ),
          new Container(
              child: new Text(task.createDate, style: new TextStyle(color: Colors.black45),),
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 4.0, bottom: 4.0)
          ),
          new Container(
            child: new Row(
              children: <Widget>[
                new Text("任务状态：", style: new TextStyle(color: Colors.black45)),
                task.state == "run" ?
                new Text("正在进行", style: new TextStyle(color: Colors.lightGreenAccent))
                :
                task.no.length == 0 ?
                new Text("圆满结束", style: new TextStyle(color: Colors.lightGreenAccent))
                :
                new Text("资产丢失！", style: new TextStyle(color: Colors.red))
              ],
            ),
          ),
          new Container(
              child: new Row(
                children: <Widget>[
                  new Container(
                    child: new RaisedButton(
                      onPressed: (){
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (context) {
                              return new AssetsViewPage(task.name + ": 已盘点", task.yes);
                            }
                        ));
                      }, child: new Text("已盘点", style: new TextStyle(color: Colors.blue),), color: new Color(0xFFFFFFFF)),
                    height: 30.0,
                    margin: const EdgeInsets.only(right: 8.0),
                  ),
                  new Container(
                    child: new RaisedButton(
                      onPressed: (){
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (context) {
                              return new AssetsViewPage(task.name + ": 未盘点", task.no);
                            }
                        ));
                      }, child: new Text("未盘点", style: new TextStyle(color: Colors.red)), color: new Color(0xFFFFFFFF)),
                    height: 30.0,
                  ),
                  new Expanded(
                    child: new Container(
                      child: new RaisedButton(
                          onPressed: task.expend == false ? (){changeHeight(task, 0.0, 1.0);} : (){changeHeight(task, 1.0, 0.0);},
                          child: new Text("盘点详情", style: new TextStyle(color: Colors.white)),
                          color: Colors.blue
                      ),
                      height: 30.0,
                      margin: const EdgeInsets.only(left: 30.0),
                    ),
                  )
                ],
              ),
              margin: const EdgeInsets.only(top: 20.0)
          ),
          new ClipRect(
            child: new Align(
              alignment: Alignment.topCenter,
              heightFactor: task.animation.value,
              child: new Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Expanded(
                            child: new Container(
                              child: new Column(
                                children: <Widget>[
                                  new CircleAvatar(
                                    radius: 24.0,
                                    child: new Text((task.yes.length + task.no.length).toString()),
                                    backgroundColor: Colors.red,
                                  ),
                                  new Container(
                                      child: new Text("任务资产总数", style: new TextStyle(color: Colors.black45)),
                                      margin: const EdgeInsets.only(top: 4.0)
                                  )
                                ],
                              ),
                            )
                        ),
                        new Expanded(
                            child: new Container(
                              child: new Column(
                                children: <Widget>[
                                  new CircleAvatar(
                                    radius: 24.0,
                                    child: new Text(task.yes.length.toString()),
                                    backgroundColor: Colors.blue,
                                  ),
                                  new Container(
                                      child: new Text("盘点数", style: new TextStyle(color: Colors.black45)),
                                      margin: const EdgeInsets.only(top: 4.0)
                                  )
                                ],
                              ),
                            )
                        ),
                        new Expanded(
                            child: new Container(
                              child: new Column(
                                children: <Widget>[
                                  new CircleAvatar(
                                    radius: 24.0,
                                    child: new Text(task.no.length.toString()),
                                    backgroundColor: Colors.black26,
                                  ),
                                  new Container(
                                      child: new Text("未盘点数", style: new TextStyle(color: Colors.black45)),
                                      margin: const EdgeInsets.only(top: 4.0)
                                  )
                                ],
                              ),
                            )
                        )
                      ],
                    ),
                    task.state == "run" ?
                    new Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      child: new Row(
                        children: <Widget>[
                          new Text("任务进行时间：", style: new TextStyle(color: Colors.black45)),
                          new Text(((new DateTime.now().millisecondsSinceEpoch - DateTime.parse(task.createDate).millisecondsSinceEpoch) / 1000 / 60 / 60).toInt().toString() + "小时")
                        ],
                      ),
                    )
                    :
                    new Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      child: new Row(
                        children: <Widget>[
                          new Text("任务结束时间：", style: new TextStyle(color: Colors.black45)),
                          new Text(task.endDate)
                        ],
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(top: 6.0),
                      child: new Row(
                        children: <Widget>[
                          new Text("资产的时间段：", style: new TextStyle(color: Colors.black45)),
                          new Text(task.define.startDate + "至" + task.define.endDate)
                        ],
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(top: 6.0),
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            child:  new Text("资产所在地址：", style: new TextStyle(color: Colors.black45)),
                            alignment: Alignment.topLeft,
                          ),
                          new Container(
                            child: new Text(location, style: new TextStyle(height: 1.4), textAlign: TextAlign.start),
                            alignment: Alignment.topLeft,
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(top: 10.0, left: 2.0, bottom: 2.0),
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            child: new RaisedButton(onPressed: (){}, child: new Text("结束任务", style: new TextStyle(color: Colors.blue),), color: new Color(0xFFFFFFFF)),
                            height: 30.0,
                          ),
                          new Expanded(
                            child: new Container(
                              child: new Icon(
                                Icons.clear,
                              ),
                              alignment: Alignment.bottomRight,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      width: 1000.0,
      margin: new EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
      padding: new EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
      decoration: new BoxDecoration(
        color: Colors.white,
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
    );
  }

  Widget getAllTaskCard() {
    List<Widget> list = [];
    for (Task task in taskList) {
      list.add(taskCard(task));
    }
    return new Column(
      children: list,
    );
  }

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: (){
        print("哈哈");
        setState(() {

        });
      },
      child: new SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: new Column(
          children: <Widget>[
            new Container(
                child: new RaisedButton(
                  onPressed: (){
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) {
                          return new DefineTaskPage(placeList);
                        }
                    ));
                  },
                  child: new Container(
                    child: new Text("定义盘点任务", style: new TextStyle(color: Colors.blue)),
                    padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                  ),
                  color: new Color(0xFFFFFFFF),
                ),
                margin: const EdgeInsets.only(top: 24.0, bottom: 30.0)
            ),
            getAllTaskCard()
          ],
        ),
      )
    );
  }
}