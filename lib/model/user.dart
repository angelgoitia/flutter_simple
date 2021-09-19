class MyUser {
  final String? uid, email, image;
  final int? type;

  MyUser({this.uid, this.email, this.image, this.type});

  Map<String, Object?> toFirebaseMap({String? newImage}) {
    return <String, Object?>{
      'uid': uid,
      'email': email,
    };
  }
}
