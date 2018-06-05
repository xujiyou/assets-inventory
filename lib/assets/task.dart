import 'package:flutter/material.dart';

class Task {

  Animation<double> animation;
  AnimationController controller;
  bool expend = false;

  String user;
  String name;
  String state;
  String createDate;
  String endDate;
  Define define;
  List<Asset> no;
  List<Asset> yes;

  Task(this.user, this.name, this.state, this.createDate, this.endDate, this.define, this.no, this.yes);

  factory Task.formjosn(Map<String, dynamic> map) {
    List<Asset> noAsset = new List();
    for (Map noMap in map["no"]) {
      noAsset.add(new Asset.fromJson(noMap));
    }
    List<Asset> yesAsset = new List();
    for (Map yesMap in map["yes"]) {
      yesAsset.add(new Asset.fromJson(yesMap));
    }
    return new Task(map["user"], map["name"], map["state"], map["createDate"], map["endDate"], new Define.fromJson(map["define"]), noAsset, yesAsset);
  }

  @override
  String toString() {
    return 'Task{user: $user, name: $name, state: $state, createDate: $createDate, endDate: $endDate, define: $define, no: $no, yes: $yes}';
  }
}

class Define {
  List<String> place;
  String startDate;
  String endDate;
  String name;
  String user;

  Define(this.place, this.startDate, this.endDate, this.name, this.user);

  factory Define.fromJson(Map<String, dynamic> map) {
    List<String> placeList = [];
    for (dynamic str in map["place"]) {
      placeList.add(str.toString());
    }
    return new Define(placeList, map["startDate"], map["endDate"], map["name"], map["user"]);
  }

  @override
  String toString() {
    return 'Define{place: $place, startDate: $startDate, endDate: $endDate, name: $name, user: $user}';
  }
}

class Asset {

  String admissionDate;
  String assetsName;
  String assetsNumber;
  String auditStatus;
  String auditor;
  String buyDate;
  String currentSituation;
  String db_place;
  String evidenceId;
  String financeName;
  String model;
  String number;
  String place;
  String spec;
  String totalPrice;
  String username;
  String inventoryDate;
  String inventoryLocation;

  Asset(this.admissionDate, this.assetsName, this.assetsNumber, this.auditStatus, this.auditor, this.buyDate, this.currentSituation, this.db_place, this.evidenceId,
      this.financeName, this.model, this.number, this.place, this.spec, this.totalPrice, this.username, this.inventoryDate, this.inventoryLocation);

  factory Asset.fromJson(Map<String, dynamic> map) {
    return new Asset(map["admissionDate"], map["assetsName"], map["assetsNumber"], map["auditStatus"], map["auditor"], map["buyDate"],
        map["currentSituation"], map["db_place"], map["evidenceId"], map["financeName"], map["model"], map["number"],
        map["place"], map["spec"], map["totalPrice"], map["username"], map["inventoryDate"], map["inventoryLocation"]);
  }

  @override
  String toString() {
    return 'Asset{admissionDate: $admissionDate, assetsName: $assetsName, assetsNumber: $assetsNumber, auditStatus: $auditStatus, auditor: $auditor, buyDate: $buyDate, currentSituation: $currentSituation, db_place: $db_place, evidenceId: $evidenceId, financeName: $financeName, model: $model, number: $number, place: $place, spec: $spec, totalPrice: $totalPrice, username: $username, inventoryDate: $inventoryDate, inventoryLocation: $inventoryLocation}';
  }
}

class Place {

  Animation<double> animation;
  AnimationController controller;
  bool expend = false;
  bool selected = false;

  String depart;
  String place;
  String count;
  String price;

  List<Asset> assetList;

  Place(this.depart, this.place, this.count, this.price);

  factory Place.fromJson(Map<String, dynamic> map) {
    return new Place(map["depart"], map["place"], map["count"].toString(), map["price"].toString());
  }
}