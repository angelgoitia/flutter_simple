import 'package:flutter_simple/controller/globalController.dart';
import 'package:flutter_simple/model/data.dart';

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DataTableController extends GetxController {
  final datas = <Data>[].obs;
  final statusError = false.obs;

  GlobalController globalController = Get.put(GlobalController()); 

  getData() async{
    
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
    /* var listEvaluate = <Evaluate>[];

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
        repTiemp: "12'32''",
        note: 18.4,
        pts: 36.8,
      )
    );

    listEvaluate.add(
      Evaluate(
        id: 4,
        repTiemp: "0'34''",
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
    );  */

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

    bool resultArray = await verifyArray();

    if(resultArray)
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
    else{
      Get.back();
      globalController.showMessage("Debe tener los registro al menos con Grado Especialidad, nombre y edad", false); 
      await Future.delayed(Duration(seconds: 3));
      Get.back();
    }
  }

  verifyArray(){
    bool statusArray = true;
    for (var data in datas) {
      if(data.specialty == null || data.name == null || data.age == null){
        statusArray = false;
        break;
      }
    }
    return statusArray;
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
        datas[indexList].age = int.parse(text);
        break;
      case 4:
        datas[indexList].size = text == null? null : double.parse(text.replaceAll(",", "."));
        break;
      case 5:
        datas[indexList].weight = text == null? null : double.parse(text.replaceAll(",", "."));
        break;
      case 6:
      case 9:
      case 12:
      case 15:
        datas[indexList].listEvaluate![showIndex(indexColumn)].repTiemp = text == null? null : text;
        print(datas[indexList].listEvaluate![showIndex(indexColumn)].repTiemp);
        break;
      case 7:
      case 10:
      case 13:
      case 16:
        datas[indexList].listEvaluate![showIndex(indexColumn)].note = text == null? null : double.parse(text.replaceAll(",", "."));
        break;
      case 8:
      case 11:
      case 14:
      case 17:
        datas[indexList].listEvaluate![showIndex(indexColumn)].pts = text == null? null : double.parse(text.replaceAll(",", "."));
        break;
      case 18:
        datas[indexList].total = text == null? null : double.parse(text.replaceAll(",", "."));
        break;
      case 19:
        datas[indexList].average = text == null? null : double.parse(text.replaceAll(",", "."));
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


  validateModal(value, indexColumn){
    if(indexColumn >= 1 && indexColumn <= 2 || indexColumn == 20)
      validateText(value);
    else if (indexColumn == 3 )
      validateAge(value);
    else if (indexColumn >= 4 && indexColumn <= 11 || indexColumn >= 13 && indexColumn <= 14 || indexColumn >= 16 && indexColumn <= 19)
      validateNum(value);
    else if(indexColumn == 12 || indexColumn == 15)
      validateTime(value);
  }

  validateText(value){
    statusError.value = false;
    value = value.trim();
    String p = '[a-zA-Z]{3,}';
    RegExp regExp = new RegExp(p);

    if (!(value.isNotEmpty && regExp.hasMatch(value) && value.length > 3)){
      showModalError('Ingrese un dato válido');
      statusError.value = true;
    }
  }

  validateAge(value){
    statusError.value = false;
    String p = '[0-9]';
    RegExp regExp = new RegExp(p);

    if (!(value.isNotEmpty && regExp.hasMatch(value) && int.parse(value) >= 10 && int.parse(value) <= 100)){
      showModalError('Ingrese la edad correctamente');
      statusError.value = true;
    }
  }

  validateNum(value){
    statusError.value = false;
    value = value.replaceAll(",", ".");
    var arry = value.split(".");
    if(arry.length > 2)
      if(arry[1].length > 2){
        showModalError('Solo permitido dos decimales');
        statusError.value = true;
      }
  }

  validateTime(value){
    statusError.value = false;
    var arr = value.split("'");
    var min= int.parse(arr[0]);
    var sec = int.parse(arr[1]);

    if(min>240 || sec > 60){
      showModalError('Ingrese el tiempo correctamente');
      statusError.value = true;
    }
  }

  showModalError(msg)async{
    globalController.showMessage(msg,false);
    await Future.delayed(Duration(seconds: 1));
    Get.back();
  }

}