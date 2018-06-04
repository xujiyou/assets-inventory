import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'task.dart';
import 'home_page.dart';
import 'assets_page.dart';

class DistributionPage extends StatefulWidget {

  final List<Place> placeList;

  DistributionPage(this.placeList);

  @override
  DistributionPageState createState() => new DistributionPageState(placeList);

}

class DistributionPageState extends State<DistributionPage> {

  List<Place> placeList;

  DistributionPageState(this.placeList);

  Future<List<Asset>> getAssets(String placeName) async {
    List<Asset> list = new List();
    var response = await http.get("http://xszhfw.jnxy.edu.cn:2124/assets/asset/" + placeName);
    for (Map map in jsonDecode(response.body)) {
      Asset asset = new Asset.fromJson(map);
      list.add(asset);
    }
    return list;
  }

  void showAssets(Place place, double begin, double end) {
    getAssets(place.place).then((list) => setState((){
      place.assetList = list;
    }));
    place.animation = new Tween(begin: begin, end: end).animate(place.controller)
      ..addListener(() {
        setState(() {
        });
      });
    place.controller.forward(from: 0.0);
    if (place.expend == false) {
      place.expend = true;
    } else {
      place.expend = false;
    }
  }

  List<Widget> allAsset(List<Asset> assetList) {
    List<Widget> widgetList = [];
    for (Asset asset in assetList) {
      widgetList.add(new FlatButton(onPressed: (){
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) {
              return new AssetsPage(asset);
            }
        ));
      },
        child: new Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 6.0),
          child: new Row(
            children: <Widget>[
              new Container(
                child: new Icon(Icons.last_page, color: Colors.blue),
              ),
              new Expanded(
                  child: new Container(
                    margin: const EdgeInsets.only(left: 6.0),
                    child: new Text(asset.assetsName),
                  )
              ),
              new Container(
                child: new Icon(Icons.chevron_right, color: Colors.blue,),
              )
            ],
          ),
        )
      ));
    }
    return widgetList;
  }

  List<Widget> allPlace() {
    List<Widget> widgetList = [];
    for (Place place in placeList) {
      widgetList.add(new Column(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  border: new BorderDirectional(bottom: new BorderSide(color: Colors.black12))
              ),
              child: new FlatButton(
                  onPressed: place.expend == false ? (){showAssets(place, 0.0, 1.0);} : (){showAssets(place, 1.0, 0.0);},
                child: new Container(
                  margin: const EdgeInsets.only(top: 12.0),
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        child: new Icon(Icons.place, color: Colors.blue),
                      ),
                      new Expanded(
                          child: new Container(
                            margin: const EdgeInsets.only(left: 6.0),
                            child: new Text(place.place),
                          )
                      ),
                      new Container(
                        child: place.expend == false ? new Icon(Icons.arrow_drop_down, color: Colors.blue,) :
                        new Icon(Icons.arrow_drop_up, color: Colors.blue,),
                      )
                    ],
                  ),
                )
              )
            ),
            new ClipRect(
              child: new Align(
                alignment: Alignment.topCenter,
                heightFactor: place.animation.value,
                child: place.assetList == null ? load() : new Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  padding: const EdgeInsets.only(left: 16.0, bottom: 10.0),
                  decoration: new BoxDecoration(
                      border: new BorderDirectional(bottom: new BorderSide(color: Colors.black12))
                  ),
                  child: new Column(
                    children: allAsset(place.assetList),
                  ),
                ),
              ))
          ],
        )
      );
    }
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Container(
        margin: const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0, bottom: 36.0),
        child:  new Column(
          children: allPlace(),
        ),
      ),
    );
  }

}