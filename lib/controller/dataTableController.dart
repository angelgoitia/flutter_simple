import 'package:flutter_simple/controller/globalController.dart';
import 'package:flutter_simple/model/data.dart';
import 'package:flutter_simple/model/evaluate.dart';

import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DataTableController extends GetxController {

  final datas = <Data>[].obs;

  getData() async{
    
    GlobalController globalController = Get.put(GlobalController());
    var result, response, jsonResponse;
    globalController.loading();
    try {
      result = await InternetAddress.lookup('google.com'); //verify network
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await http.post(
          Uri.parse(globalController.urlApi!+"getData/"),
          headers:{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ); // petición api
        print(response.body);
        jsonResponse = jsonDecode(response.body);

        if (jsonResponse['statusCode'] == 201) {
          datas.value = <Data>[];

          if(jsonResponse['length'] > 0)
            datas.value = (jsonResponse['datas'] as List).map((val) => Data.fromJson(val)).toList();

          await Future.delayed(Duration(seconds: 1));
          verifyDatas();
          await Future.delayed(Duration(seconds: 1));
          Get.back();

        } else if(jsonResponse['statusCode'] == 400){

          Get.back();
          globalController.showMessage(jsonResponse['message'], false);
          await Future.delayed(Duration(seconds: 1));
          Get.back();

        } 
      }
    } on SocketException catch (_) {

      print("Sin conexión a internet"); 
      Get.back();
      globalController.showMessage("Sin conexión a internet", false); 
      await Future.delayed(Duration(seconds: 1));
      Get.back();

    }
  }

  verifyDatas(){
    var listEvaluate = <Evaluate>[];

    listEvaluate.add(
      Evaluate(
        id: 1,
        repTiemp: "32",
        note: 13.8,
        pts: 13.8,
      )
    );
    listEvaluate.add(
      Evaluate(
        id: 2,
        repTiemp: "17",
        note: 15,
        pts: 30,
      )
    );
    listEvaluate.add(
      Evaluate(
        id: 3,
        repTiemp: "12\'32\'\'",
        note: 18.4,
        pts: 36.8,
      )
    );

    listEvaluate.add(
      Evaluate(
        id: 4,
        repTiemp: "0\'34\'\'",
        note: 16,
        pts: 32,
      )
    );

    datas.add(
      Data(
        id: 1,
        specialty: "Tco JS MM",
        name: "Goitia Guardia, Angel",
        age: 25,
        size: 1.76,
        weight: 71,
        listEvaluate: listEvaluate,
        total: 112.6,
        average: 16.8,
        result: "Aprobado"
      )
    ); 

    if(datas.length == 0)
      datas.add(
        Data(
          id: datas.length+1,
        )
      );
  }

  addData(){
    datas.add(
      Data(
        id: datas.length+1,
      )
    );
  }

  removeData(){
    var length = datas.length;
    showMessage(length);
  }

  saveData()async{
    GlobalController globalController = Get.put(GlobalController());
    var result, response, jsonResponse;
    globalController.loading();
    try {
      result = await InternetAddress.lookup('google.com'); //verify network
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await http.post(
          Uri.parse(globalController.urlApi!+"saveData/"),
          headers:{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'X-Requested-With': 'XMLHttpRequest',
          },
          body: jsonEncode({
            'datas': jsonEncode(datas.map((i) => i.toJson()).toList()).toString(),
          }),
        ); // petición api
        print(response.body);
        jsonResponse = jsonDecode(response.body);

        if (jsonResponse['statusCode'] == 201) {

          Get.back();
          globalController.showMessage("Ha sido Guardado correctamente!", true);
          await Future.delayed(Duration(seconds: 1));
          Get.back();

        } else if(jsonResponse['statusCode'] == 400){

          Get.back();
          globalController.showMessage(jsonResponse['message'], false);
          await Future.delayed(Duration(seconds: 1));
          Get.back();

        } 
      }
    } on SocketException catch (_) {

      Get.back();
      globalController.showMessage("Sin conexión a internet", false); 
      await Future.delayed(Duration(seconds: 1));
      Get.back();

    } 
  }

  updateData(indexList, indexColumn, text){
    switch (indexColumn) {
      case 1:
        datas[indexList].specialty = text;
        break;
      case 2:
        datas[indexList].name = text;
        break;
      case 3:
        datas[indexList].age = text;
        break;
      case 4:
        datas[indexList].size = text;
        break;
      case 5:
        datas[indexList].weight = text;
        break;
      case 6:
      case 9:
      case 12:
      case 15:
        datas[indexList].listEvaluate![showIndex(indexColumn)].repTiemp = text;
        break;
      case 7:
      case 10:
      case 13:
      case 16:
        datas[indexList].listEvaluate![showIndex(indexColumn)].note = text;
        break;
      case 8:
      case 11:
      case 14:
      case 17:
        datas[indexList].listEvaluate![showIndex(indexColumn)].pts = text;
        break;
      case 18:
        datas[indexList].total = text;
        break;
      case 19:
        datas[indexList].average = text;
        break;
      case 20:
        datas[indexList].result = text;
        break;
      default:
        break;
    }
  }

  int showIndex(indexColumn){
    if(indexColumn >= 6 && indexColumn <= 8)
      return 0;
    else if(indexColumn >= 9 && indexColumn <= 11)
      return 1;
    else if(indexColumn >= 12 && indexColumn <= 14)
      return 2;
    else
      return 3;
  }

  showMessage(length) async {
    
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
          Container(
            padding: EdgeInsets.all(5),
            child: Text(
              "¿Estás seguro de que quiere eliminar el registro N° $length ?",
              style: TextStyle(
                color: Colors.black,
                fontSize:14
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(Colors.blue)
          ),
          child: const Text('Aceptar'),
          onPressed: () {
            datas.removeAt(length-1);
            Get.back();
          },
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(Colors.red)
          ),
          child: const Text('Cancelar'),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
  }
}