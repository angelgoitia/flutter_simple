import 'dart:convert';

import 'package:flutter_simple/model/evaluate.dart';

class Data {
  String? specialty, name, result;
  int? id, age;
  double? size, weight, total, average;
  List<Evaluate>? listEvaluate;

  Data({this.id, this.specialty, this.name, this.age, this.size, this.weight, this.listEvaluate, this.total, this.average, this.result});

  factory  Data.fromJson(Map<String, dynamic> json) {
    return new Data(
      id : json['id'],
      specialty : json['specialty'],
      name : json['name'],
      age : json['age'],
      size : json['size'].toDouble(),
      weight : json['weight'].toDouble(),
      listEvaluate : json['evaluates'] == null ? null : (json['evaluates']as List).map((val) => Evaluate.fromJson(val)).toList(),
      total : json['total'].toDouble(),
      average : json['average'].toDouble(),
      result : json['result'],
    );
  }

  Map<String, dynamic> toJson() => 
  {
    'id': id,
    'specialty': specialty,
    'name': name,
    'age': age,
    'size': size,
    'weight': weight,
    'listEvaluate': jsonEncode(listEvaluate!.map((i) => i.toJson()).toList()).toString(),
    'total': total,
    'average': average,
    'result': result,
  };
}
