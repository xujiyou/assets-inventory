import 'package:flutter/material.dart';
import 'task.dart';

class DefineTaskPage extends StatefulWidget {

  final List<Place> placeList;

  DefineTaskPage(this.placeList);

  @override
  DefineTaskPageState createState() => new DefineTaskPageState(placeList);

}

class DefineTaskPageState extends State<DefineTaskPage> {

  final List<Place> placeList;

  DefineTaskPageState(this.placeList);

  List<PopupMenuItem<String>> showPlaces() {
    List<PopupMenuItem<String>> list = [];
    for (Place place in placeList) {
      list.add(new PopupMenuItem<String>(
        value: place.place,
        child: new Container(
          child: new Row(
            children: <Widget>[
              new Container(
                child: new Checkbox(value: place.selected, onChanged: (value){
                  setState((){
                    place.selected = value;
                  });
                }),
              ),
              new Container(
                child: new Text(place.place),
              )
            ],
          ),
        )
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("定义盘点任务"),
      ),
      body: new SingleChildScrollView(
        child: new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                margin:  const EdgeInsets.only(left: 16.0, top: 20.0, right: 16.0, bottom: 20.0),
                child: new Container(
                  margin: const EdgeInsets.only(right: 4.0, bottom: 4.0),
                  child: new Container(
                    child: new RaisedButton(
                      onPressed: (){},
                      child: new Text("选择地点", style: new TextStyle(color: Colors.blue),),
                      color: Colors.white,
                    ),
                    height: 30.0,
                  ),
                )
              )
            ],
          ),
        ),
      )
    );
  }

}