// To parse this JSON data, do
//
//     final genericModel = genericModelFromJson(jsonString);

import 'dart:convert';

List<GenericModel> genericModelFromJson(String str) => List<GenericModel>.from(
    json.decode(str).map((x) => GenericModel.fromJson(x)));

String genericModelToJson(List<GenericModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GenericModel {
  GenericModel({
    this.createOn,
    this.updatedOn,
    this.id,
    this.images,
    this.files,
    this.name,
    this.dayOfWeeksOpen,
    this.openTime,
    this.closeTime,
    this.slotTimeSize,
    this.costPerSlot,
    this.active,
    this.establishment,
    this.sports,
  });

  DateTime createOn;
  DateTime updatedOn;
  int id;
  List<String> images;
  dynamic files;
  String name;
  List<DayOfWeeksOpen> dayOfWeeksOpen;
  OpenTime openTime;
  CloseTime closeTime;
  int slotTimeSize;
  double costPerSlot;
  dynamic active;
  dynamic establishment;
  Sports sports;

  factory GenericModel.fromJson(Map<String, dynamic> json) => GenericModel(
        createOn: DateTime.parse(json["createOn"]),
        updatedOn: DateTime.parse(json["updatedOn"]),
        id: json["id"],
        images: json["images"] == null
            ? null
            : List<String>.from(json["images"].map((x) => x)),
        files: json["files"],
        name: json["name"],
        dayOfWeeksOpen: List<DayOfWeeksOpen>.from(
            json["dayOfWeeksOpen"].map((x) => dayOfWeeksOpenValues.map[x])),
        openTime: openTimeValues.map[json["openTime"]],
        closeTime: closeTimeValues.map[json["closeTime"]],
        slotTimeSize: json["slotTimeSize"],
        costPerSlot: json["costPerSlot"],
        active: json["active"],
        establishment: json["establishment"],
        sports: Sports.fromJson(json["sports"]),
      );

  Map<String, dynamic> toJson() => {
        "createOn": createOn.toIso8601String(),
        "updatedOn": updatedOn.toIso8601String(),
        "id": id,
        "images":
            images == null ? null : List<dynamic>.from(images.map((x) => x)),
        "files": files,
        "name": name,
        "dayOfWeeksOpen": List<dynamic>.from(
            dayOfWeeksOpen.map((x) => dayOfWeeksOpenValues.reverse[x])),
        "openTime": openTimeValues.reverse[openTime],
        "closeTime": closeTimeValues.reverse[closeTime],
        "slotTimeSize": slotTimeSize,
        "costPerSlot": costPerSlot,
        "active": active,
        "establishment": establishment,
        "sports": sports.toJson(),
      };
}

enum CloseTime { THE_1800 }

final closeTimeValues = EnumValues({"18:00": CloseTime.THE_1800});

enum DayOfWeeksOpen { MON, TUE, WED, THU, FRI, SAT, SUN }

final dayOfWeeksOpenValues = EnumValues({
  "Fri": DayOfWeeksOpen.FRI,
  "Mon": DayOfWeeksOpen.MON,
  "Sat": DayOfWeeksOpen.SAT,
  "Sun": DayOfWeeksOpen.SUN,
  "Thu": DayOfWeeksOpen.THU,
  "Tue": DayOfWeeksOpen.TUE,
  "Wed": DayOfWeeksOpen.WED
});

enum OpenTime { THE_0900 }

final openTimeValues = EnumValues({"09:00": OpenTime.THE_0900});

class Sports {
  Sports({
    this.createOn,
    this.updatedOn,
    this.id,
    this.name,
    this.iconWhiteUrl,
    this.iconBlackUrl,
  });

  dynamic createOn;
  dynamic updatedOn;
  int id;
  Name name;
  String iconWhiteUrl;
  String iconBlackUrl;

  factory Sports.fromJson(Map<String, dynamic> json) => Sports(
        createOn: json["createOn"],
        updatedOn: json["updatedOn"],
        id: json["id"],
        name: nameValues.map[json["name"]],
        iconWhiteUrl: json["iconWhiteUrl"],
        iconBlackUrl: json["iconBlackUrl"],
      );

  Map<String, dynamic> toJson() => {
        "createOn": createOn,
        "updatedOn": updatedOn,
        "id": id,
        "name": nameValues.reverse[name],
        "iconWhiteUrl": iconWhiteUrl,
        "iconBlackUrl": iconBlackUrl,
      };
}

enum Name { BASKETBALL, BADMINTON, FOOTBALL }

final nameValues = EnumValues({
  "Badminton": Name.BADMINTON,
  "Basketball": Name.BASKETBALL,
  "Football": Name.FOOTBALL
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
