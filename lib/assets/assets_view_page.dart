import 'package:flutter/material.dart';
import 'task.dart';

class AssetsViewPage extends StatefulWidget {

  List<Asset> assetList;
  String title;

  AssetsViewPage(this.title, this.assetList);

  @override
  AssetsViewPageState createState() => new AssetsViewPageState(title, assetList);
}

class AssetsViewPageState extends State<AssetsViewPage> {

  List<Asset> assetList;
  String title;

  AssetsViewPageState(this.title, this.assetList);

  Widget showAssets(){
    List<Widget> widgetList = [];
    int i = 0;
    for (Asset asset in assetList) {
      if (i < 60) {
        if (asset.inventoryLocation == null) {
          widgetList.add(new Container(
            child: new ListTile(
              title: new Text(asset.assetsName + " : " + asset.assetsNumber),
              subtitle: new Text(asset.username),
              trailing: new FlatButton(onPressed: (){}, child: new Text("确定存在", style: new TextStyle(color: Colors.blue),)),
            ),
            margin: const EdgeInsets.only(left: 16.0, right: 16.0),
            decoration: new BoxDecoration(
                border: new BorderDirectional(bottom: new BorderSide(color: Colors.black12))
            ),
          )
          );
        } else {
          widgetList.add(new Container(
            child: new ListTile(
              title: new Text(asset.assetsName + " : " + asset.assetsNumber, style: new TextStyle(color: Colors.blue),),
              subtitle: new Column(
                children: <Widget>[
                  new Container(
                    child: new Text(asset.inventoryDate),
                    alignment: Alignment.topLeft,
                  ),
                  new Container(
                    child: new Text(asset.inventoryLocation),
                    alignment: Alignment.topLeft,
                  ),
                ],
              ),
            ),
            margin: const EdgeInsets.only(left: 16.0, right: 16.0),
            decoration: new BoxDecoration(
                border: new BorderDirectional(bottom: new BorderSide(color: Colors.black12))
            ),
          )
          );
        }
      }
      i++;
    }
    return new Column(
      children: widgetList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new SingleChildScrollView(
        child: showAssets(),
      ),
    );
  }

}
