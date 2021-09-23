import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GlobalController extends GetxController { 
  String? url, urlApi;

  List listTable = [
    {
      "title" : "Abdominales Masculino - Femenino",
      "url" : "assets/table/ABDOMINALES - MILITAR MASCULINO Y FEMENINO.png",
    },
    {
      "title" : "Barras - Planchas Masculino",
      "url" : "assets/table/BARRAS O PLANCHAS - MILITAR MASCULINO.png",
    },
    {
      "title" : "Caminata Masculino",
      "url" : "assets/table/CAMINATA - PERSONAL MASCULINO.png",
    },
    {
      "title" : "Carrera Femenino",
      "url" : "assets/table/CARRERA - MILITAR FEMENINO.png",
    },
    {
      "title" : "Carrera Masculino",
      "url" : "assets/table/CARRERA - MILITAR MASCULINO.png",
    },
    {
      "title" : "Natación Femenino",
      "url" : "assets/table/NATACION ESTILO CROL - MILITAR FEMENINO.png",
    },
    {
      "title" : "Natación Masculino",
      "url" : "assets/table/NATACION ESTILO CROL - MILITAR MASCULINO.png",
    },
    {
      "title" : "Pista de Combate Femenino",
      "url" : "assets/table/PISTA DE COMBATE - MILITAR FEMENINO.png",
    },
    {
      "title" : "Pista de Combate Masculino",
      "url" : "assets/table/PISTA DE COMBATE - MILITAR MASCULINO.png",
    },
    {
      "title" : "Suspensión o Seminplanchas Femenino",
      "url" : "assets/table/SUSPENSION O SEMI PLANCHAS - MILITAR FEMENINO.png",
    },
  ];

  @override
  void onInit() {
    super.onInit();
    //url = "flutter-simple-api.herokuapp.com"; //heroku
    url = "192.168.1.114:8000"; //localhost

    urlApi = "http://$url/api/auth/";
  }

  loading(){
    Get.defaultDialog(
      title: "",
      titlePadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      barrierDismissible: false,
      content: WillPopScope(
        onWillPop: () async => false,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                child: CircularProgressIndicator(),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Loading",
                        style: TextStyle(
                          color: Colors.black,
                        )
                      ),
                      TextSpan(
                        text: "...",
                        style: TextStyle(
                          color: Colors.blue,
                        )
                      ),
                    ]
                  ),
                ),
              ),
            ],
        ),
      ),
    );
  }

  showMessage(_titleMessage, _statusCorrectly) async {

    return Get.defaultDialog(
      title: '',
      titlePadding: EdgeInsets.zero,
      barrierDismissible: true,
      backgroundColor: Colors.white,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _statusCorrectly? Padding(
            padding: EdgeInsets.all(5),
            child: Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 30,
            )
          )
          : Padding(
            padding: EdgeInsets.all(5),
            child: Icon(
              Icons.error,
              color: Colors.red,
              size: 30,
            )
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Text(
              _titleMessage.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize:14
              ),
            ),
          ),
        ],
      ),
    );
  }
}