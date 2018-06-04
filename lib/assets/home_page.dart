import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'inventory_page.dart';
import 'task.dart';
import 'statistics_page.dart';
import 'distribution_page.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  bool inventoryStart = true;
  int statisticsStart = 0;
  bool distributionStart = true;

  List<Task> taskList = new List();
  Map staMap = new Map();
  List<Place> placeList = new List();

  @override
  void initState() {
    super.initState();
    getTasks().then((list) => setState((){
      taskList = list;
      inventoryStart = false;
    }));
    getStatistics().then((map) => setState((){
      staMap = map;
      statisticsStart++;
    }));
    getPlaces().then((list) => setState((){
      placeList = list;
      statisticsStart++;
      distributionStart = false;
    }));
  }

  @override
  dispose() {
    for (Task task in taskList) {
      task.controller.dispose();
    }
    super.dispose();
  }

  Future<List<Task>> getTasks() async {
    List<Task> list = new List();
    var response = await http.get("http://xszhfw.jnxy.edu.cn:2124/assets/task");
    for (Map map in jsonDecode(response.body)) {
      Task task = new Task.formjosn(map);
      task.controller = new AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
      task.animation = new Tween(begin: 0.0, end: 0.0).animate(task.controller);
      task.controller.forward();
      list.add(task);
    }
    return list;
  }

  Future<Map> getStatistics() async {
    var response = await http.get("http://xszhfw.jnxy.edu.cn:2124/assets/statistics");
    return jsonDecode(response.body);
  }

  Future<List<Place>> getPlaces() async {
    List<Place> list = new List();
    var response = await http.get("http://xszhfw.jnxy.edu.cn:2124/assets/place");
    for (Map map in jsonDecode(response.body)) {
      Place place = new Place.fromJson(map);
      place.controller = new AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
      place.animation = new Tween(begin: 0.0, end: 0.0).animate(place.controller);
      place.controller.forward();
      list.add(place);
    }
    return list;
  }

  Widget barSearch() {
    return new Container(
        child: new Row(
          children: <Widget>[
            new Expanded(
                child: new FlatButton.icon(
                  onPressed: (){

                  },
                  icon: new Icon(
                      Icons.search,
                      size: 16.0
                  ),
                  label: new Text(
                    "搜索学院资产",
                    style: new TextStyle(),
                  ),
                )
            )
          ],
        ),
        decoration: new BoxDecoration(
          borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
          color: Colors.black12,
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          title: barSearch(),
          bottom: new TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black,
            tabs: [
              new Tab(text: "资产盘点"),
              new Tab(text: "资产分布"),
              new Tab(text: "资产统计"),
            ],
          ),
        ),
        body: new TabBarView(
            children: [
              inventoryStart == true ?
              load()
              :
              new InventoryPage(taskList, placeList),

              distributionStart == true ?
              load()
              :
              new DistributionPage(placeList),

              statisticsStart == 0 ?
              load()
              :
              statisticsStart == 1 ?
              load()
              :
              new StatisticsPage(staMap, placeList),
            ]
        ),
      ),
    );
  }
}

Widget load() {
  return new Container(
    child: new Container(
      child: new Container(
        child: new CircularProgressIndicator(),
        width: 30.0,
        height: 30.0,
        alignment: Alignment.center,
      ),
      width: 50.0,
      height: 50.0,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(const Radius.circular(25.0)),
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
    ),
    alignment: Alignment.topCenter,
    margin: const EdgeInsets.only(top: 16.0),
  );
}