import 'package:flutter_simple/model/evaluate.dart';
// Clase Datos 
// Creacion de Atributos
class Data {
  String? specialty, name, result;
  int? id, age;
  double? size, weight, total, average;
  List<Evaluate>? listEvaluate;

//Constructor
  Data({this.id, this.specialty, this.name, this.age, this.size, this.weight, this.listEvaluate, this.total, this.average, this.result});

  factory  Data.fromJson(Map<String, dynamic> json) {
    return new Data(
      id : json['id'],
      specialty : json['specialty'],
      name : json['name'],
      age : json['age'],
      size : json['size'] == null? null : double.parse(json['size']),
      weight : json['weight'] == null? null : double.parse(json['weight']),
      listEvaluate : json['evaluates'] == null ? null : (json['evaluates']as List).map((val) => Evaluate.fromJson(val)).toList(),
      total : json['total'] == null? null : double.parse(json['total']),
      average : json['average'] == null? null : double.parse(json['average']),
      result : json['result'] == null? null : json['result'],
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
    'listEvaluate': listEvaluate!.map((i) => i.toJson()).toList(),
    'total': total,
    'average': average,
    'result': result,
  };
}
