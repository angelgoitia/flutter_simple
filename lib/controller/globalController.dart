import 'package:flutter_simple/model/dataTime.dart';
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

  Map<String, String> numbers = {
    'uno': "1",
    'dos': "2",
    'tres': "3",
    'cuatro': "4",
    'cinco': "5",
    'seis': "6",
    'siete': "7",
    'ocho': "8",
    'nueve': "9",
    'diez': "10",
    'once': "11",
    'doce': "12",
    'trece': "13",
    'catorce': "14",
    'quince': "15",
    'dieciséis': "16",
    'diecisiete': "17",
    'dieciocho': "18",
    'diecinueve': "19",
    'veinte': "20",
    'veintiuno': "21",
    'veintidós': "22",
    'veintitrés': "23",
    'veinticuatro': "24",
    'veinticinco': "25",
    'veintiséis': "26",
    'veintisiete': "27",
    'veintiocho': "28",
    'veintinueve': "29",
    'treinta': "30",
    'treinta y uno': "31",
    'treinta y dos': "32",
    'treinta y tres': "33",
    'treinta y cuatro': "34",
    'treinta y cinco': "35",
    'treinta y seis': "36",
    'treinta y siete': "37",
    'treinta y ocho': "38",
    'treinta y nueve': "39",
    'cuarenta': "40",
    'cuarenta y uno': "41",
    'cuarenta y dos': "42",
    'cuarenta y tres': "43",
    'cuarenta y cuatro': "44",
    'cuarenta y cinco': "45",
    'cuarenta y seis': "46",
    'cuarenta y siete': "47",
    'cuarenta y ocho': "48",
    'cuarenta y nueve': "49",
    'cincuenta': "50",
    'cincuenta y uno': "51",
    'cincuenta y dos': "52",
    'cincuenta y tres': "53",
    'cincuenta y cuatro': "54",
    'cincuenta y cinco': "55",
    'cincuenta y seis': "56",
    'cincuenta y siete': "57",
    'cincuenta y ocho': "58",
    'cincuenta y nueve': "59",
    'sesenta': "60",
    'sesenta y uno': "61",
    'sesenta y dos': "62",
    'sesenta y tres': "63",
    'sesenta y cuatro': "64",
    'sesenta y cinco': "65",
    'sesenta y seis': "66",
    'sesenta y siete': "67",
    'sesenta y ocho': "68",
    'sesenta y nueve': "69",
    'setenta': "70",
    'setenta y uno': "71",
    'setenta y dos': "72",
    'setenta y tres': "73",
    'setenta y cuatro': "74",
    'setenta y cinco': "75",
    'setenta y seis': "76",
    'setenta y siete': "77",
    'setenta y ocho': "78",
    'setenta y nueve': "79",
    'ochenta': "80",
    'ochenta y uno': "81",
    'ochenta y dos': "82",
    'ochenta y tres': "83",
    'ochenta y cuatro': "84",
    'ochenta y cinco': "85",
    'ochenta y seis': "86",
    'ochenta y siete': "87",
    'ochenta y ocho': "88",
    'ochenta y nueve': "89",
    'noventa': "90",
    'noventa y uno': "91",
    'noventa y dos': "92",
    'noventa y tres': "93",
    'noventa y cuatro': "94",
    'noventa y cinco': "95",
    'noventa y seis': "96",
    'noventa y siete': "97",
    'noventa y ocho': "98",
    'noventa y nueve': "99",
    'cien': "100",
  };

  @override
  void onInit() {
    super.onInit();
    url = "flutter-simple-api.herokuapp.com"; //heroku
    //url = "192.168.1.114:8000"; //localhost

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

  //obtener value de la lista
  getValueList(text){
    for (String key in numbers.keys) {
      if (key == text) {
        return numbers[key];
      }
    }
    return '';
  }

  getNumberTime(arr){
    var result = DataTime(
      min: "0",
      sec: "0",
    );
    arr.asMap().forEach((index, value) {
      if(value == 'minutos' || value == 'minuto'){
        result.min = arr[index-1];
      }

      if(value == 'segundos' || value == 'segundo'){
        result.sec = arr[index-1];
      }
    });

    return result;
  }
}