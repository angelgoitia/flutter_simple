// Clase Evaluacion
// Creacion de Atributos
class Evaluate {
  String? repTiemp;
  int? id;
  double? note, pts;
//Constructor
  Evaluate({this.id, this.repTiemp, this.note, this.pts});

  factory  Evaluate.fromJson(Map<String, dynamic> json) {
    return new Evaluate(
      id : json['type'],
      repTiemp : json['repTiemp'] == null? null : json['repTiemp'],
      note : json['note'] == null? null : double.parse(json['note']),
      pts : json['pts'] == null? null :  double.parse(json['pts']),
    );
  }

  Map<String, dynamic> toJson() => 
  {
    'id': id,
    'repTiemp': repTiemp,
    'note': note,
    'pts': pts,
  };
}
