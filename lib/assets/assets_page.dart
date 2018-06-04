import 'package:flutter/material.dart';
import 'task.dart';

class AssetsPage extends StatefulWidget {

  final Asset asset;

  AssetsPage(this.asset);

  @override
  AssetsPageState createState() => new AssetsPageState(asset);

}

class AssetsPageState extends State<AssetsPage> {

  Asset asset;

  AssetsPageState(this.asset);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(asset.assetsName),
      ),
      body: new SingleChildScrollView(
        child: new Container(
          margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0, bottom: 20.0),
          child: new Column(
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                    border: new BorderDirectional(bottom: new BorderSide(color: Colors.black12))
                ),
                padding: const EdgeInsets.only(bottom: 6.0, top: 10.0),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new Text("审核状态", style: new TextStyle(fontSize: 17.0),),
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(bottom: 4.0),
                    ),
                    new Container(
                      child: new Text(asset.auditStatus, style: new TextStyle(color: Colors.black54),),
                      alignment: Alignment.topLeft,
                    )
                  ],
                ),
              ),
              new Container(
                decoration: new BoxDecoration(
                    border: new BorderDirectional(bottom: new BorderSide(color: Colors.black12))
                ),
                padding: const EdgeInsets.only(bottom: 6.0, top: 10.0),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new Text("资产编号", style: new TextStyle(fontSize: 17.0),),
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(bottom: 4.0),
                    ),
                    new Container(
                      child: new Text(asset.assetsNumber, style: new TextStyle(color: Colors.black54),),
                      alignment: Alignment.topLeft,
                    )
                  ],
                ),
              ),
              new Container(
                decoration: new BoxDecoration(
                    border: new BorderDirectional(bottom: new BorderSide(color: Colors.black12))
                ),
                padding: const EdgeInsets.only(bottom: 6.0, top: 10.0),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new Text("总价", style: new TextStyle(fontSize: 17.0),),
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(bottom: 4.0),
                    ),
                    new Container(
                      child: new Text(asset.totalPrice, style: new TextStyle(color: Colors.black54),),
                      alignment: Alignment.topLeft,
                    )
                  ],
                ),
              ),
              new Container(
                decoration: new BoxDecoration(
                    border: new BorderDirectional(bottom: new BorderSide(color: Colors.black12))
                ),
                padding: const EdgeInsets.only(bottom: 6.0, top: 10.0),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new Text("数量", style: new TextStyle(fontSize: 17.0),),
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(bottom: 4.0),
                    ),
                    new Container(
                      child: new Text(asset.number, style: new TextStyle(color: Colors.black54),),
                      alignment: Alignment.topLeft,
                    )
                  ],
                ),
              ),
              new Container(
                decoration: new BoxDecoration(
                    border: new BorderDirectional(bottom: new BorderSide(color: Colors.black12))
                ),
                padding: const EdgeInsets.only(bottom: 6.0, top: 10.0),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new Text("使用人", style: new TextStyle(fontSize: 17.0),),
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(bottom: 4.0),
                    ),
                    new Container(
                      child: new Text(asset.username, style: new TextStyle(color: Colors.black54),),
                      alignment: Alignment.topLeft,
                    )
                  ],
                ),
              ),
              new Container(
                decoration: new BoxDecoration(
                    border: new BorderDirectional(bottom: new BorderSide(color: Colors.black12))
                ),
                padding: const EdgeInsets.only(bottom: 6.0, top: 10.0),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new Text("存放地点", style: new TextStyle(fontSize: 17.0),),
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(bottom: 4.0),
                    ),
                    new Container(
                      child: new Text(asset.db_place, style: new TextStyle(color: Colors.black54),),
                      alignment: Alignment.topLeft,
                    )
                  ],
                ),
              ),
              new Container(
                decoration: new BoxDecoration(
                    border: new BorderDirectional(bottom: new BorderSide(color: Colors.black12))
                ),
                padding: const EdgeInsets.only(bottom: 6.0, top: 10.0),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new Text("现状", style: new TextStyle(fontSize: 17.0),),
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(bottom: 4.0),
                    ),
                    new Container(
                      child: new Text(asset.currentSituation, style: new TextStyle(color: Colors.black54),),
                      alignment: Alignment.topLeft,
                    )
                  ],
                ),
              ),
              new Container(
                decoration: new BoxDecoration(
                    border: new BorderDirectional(bottom: new BorderSide(color: Colors.black12))
                ),
                padding: const EdgeInsets.only(bottom: 6.0, top: 10.0),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new Text("购置日期", style: new TextStyle(fontSize: 17.0),),
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(bottom: 4.0),
                    ),
                    new Container(
                      child: new Text(asset.buyDate, style: new TextStyle(color: Colors.black54),),
                      alignment: Alignment.topLeft,
                    )
                  ],
                ),
              ),
              new Container(
                decoration: new BoxDecoration(
                    border: new BorderDirectional(bottom: new BorderSide(color: Colors.black12))
                ),
                padding: const EdgeInsets.only(bottom: 6.0, top: 10.0),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new Text("入帐日期", style: new TextStyle(fontSize: 17.0),),
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(bottom: 4.0),
                    ),
                    new Container(
                      child: new Text(asset.admissionDate, style: new TextStyle(color: Colors.black54),),
                      alignment: Alignment.topLeft,
                    )
                  ],
                ),
              ),
              new Container(
                decoration: new BoxDecoration(
                    border: new BorderDirectional(bottom: new BorderSide(color: Colors.black12))
                ),
                padding: const EdgeInsets.only(bottom: 6.0, top: 10.0),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new Text("凭证号", style: new TextStyle(fontSize: 17.0),),
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(bottom: 4.0),
                    ),
                    new Container(
                      child: new Text(asset.evidenceId, style: new TextStyle(color: Colors.black54),),
                      alignment: Alignment.topLeft,
                    )
                  ],
                ),
              ),
              new Container(
                decoration: new BoxDecoration(
                    border: new BorderDirectional(bottom: new BorderSide(color: Colors.black12))
                ),
                padding: const EdgeInsets.only(bottom: 6.0, top: 10.0),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new Text("型号", style: new TextStyle(fontSize: 17.0),),
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(bottom: 4.0),
                    ),
                    new Container(
                      child: new Text(asset.model, style: new TextStyle(color: Colors.black54),),
                      alignment: Alignment.topLeft,
                    )
                  ],
                ),
              ),
              new Container(
                decoration: new BoxDecoration(
                    border: new BorderDirectional(bottom: new BorderSide(color: Colors.black12))
                ),
                padding: const EdgeInsets.only(bottom: 6.0, top: 10.0),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new Text("规格", style: new TextStyle(fontSize: 17.0),),
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(bottom: 4.0),
                    ),
                    new Container(
                      child: new Text(asset.spec, style: new TextStyle(color: Colors.black54),),
                      alignment: Alignment.topLeft,
                    )
                  ],
                ),
              ),
              new Container(
                decoration: new BoxDecoration(
                    border: new BorderDirectional(bottom: new BorderSide(color: Colors.black12))
                ),
                padding: const EdgeInsets.only(bottom: 6.0, top: 10.0),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new Text("审核人", style: new TextStyle(fontSize: 17.0),),
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(bottom: 4.0),
                    ),
                    new Container(
                      child: new Text(asset.auditor, style: new TextStyle(color: Colors.black54),),
                      alignment: Alignment.topLeft,
                    )
                  ],
                ),
              ),
              new Container(
                decoration: new BoxDecoration(
                    border: new BorderDirectional(bottom: new BorderSide(color: Colors.black12))
                ),
                padding: const EdgeInsets.only(bottom: 6.0, top: 10.0),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new Text("财务审核人", style: new TextStyle(fontSize: 17.0),),
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(bottom: 4.0),
                    ),
                    new Container(
                      child: new Text(asset.financeName, style: new TextStyle(color: Colors.black54),),
                      alignment: Alignment.topLeft,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}