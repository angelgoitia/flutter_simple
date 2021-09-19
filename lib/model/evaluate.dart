class Evaluate {
  String? repTiemp;
  int? id;
  double? note, pts;

  Evaluate({this.id, this.repTiemp, this.note, this.pts});

  factory  Evaluate.fromJson(Map<String, dynamic> json) {
    return new Evaluate(
      id : json['type'],
      repTiemp : json['repTiemp'],
      note : json['note'].toDouble(),
      pts : json['pts'].toDouble(),
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
