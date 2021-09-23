import 'package:flutter/services.dart';
import 'package:flutter_simple/controller/globalController.dart';
import 'package:flutter_simple/model/data.dart';

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_simple/model/evaluate.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DataTableController extends GetxController {
  TextEditingController controllerModalRemove = TextEditingController();
  final datas = <Data>[].obs;
  final statusError = false.obs;

  GlobalController globalController = Get.put(GlobalController()); 

  getData() async{
    
    var result, response, jsonResponse;
    globalController.loading();
    try {
      result = await InternetAddress.lookup('google.com'); //Verificar Internet
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        response = await http.post(
          Uri.parse(globalController.urlApi!+"getData"),
          headers:{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'X-Requested-With': 'XMLHttpRequest',
          },
        ); // Petición api  ---  Respuestas que recibe
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
/*Mensaje de falta de Internet */
      print("Sin conexión a internet"); 
      Get.back();
      globalController.showMessage("Sin conexión a internet", false); 
      await Future.delayed(Duration(seconds: 1));
      Get.back();

    }
  }
/* Verificar si existe un registro */
  verifyDatas(){
    var listEvaluate = <Evaluate>[];

    listEvaluate.add(
      Evaluate(
        id: 1,
        repTiemp: null,
        note: null,
        pts: null,
      )
    );
    listEvaluate.add(
      Evaluate(
        id: 2,
        repTiemp: null,
        note: null,
        pts: null,
      )
    );
    listEvaluate.add(
      Evaluate(
        id: 3,
        repTiemp: null,
        note: null,
        pts: null,
      )
    );

    listEvaluate.add(
      Evaluate(
        id: 4,
        repTiemp: null,
        note: null,
        pts: null,
      )
    );

    if(datas.length == 0)
      datas.add(
        Data(
          id: datas.length+1,
          listEvaluate: listEvaluate,
        )
      );
  }

  addData(){
    var listEvaluate = <Evaluate>[];

    listEvaluate.add(
      Evaluate(
        id: 1,
        repTiemp: null,
        note: null,
        pts: null,
      )
    );
    listEvaluate.add(
      Evaluate(
        id: 2,
        repTiemp: null,
        note: null,
        pts: null,
      )
    );
    listEvaluate.add(
      Evaluate(
        id: 3,
        repTiemp: null,
        note: null,
        pts: null,
      )
    );

    listEvaluate.add(
      Evaluate(
        id: 4,
        repTiemp: null,
        note: null,
        pts: null,
      )
    );

    datas.add(
      Data(
        id: datas.length+1,
        listEvaluate: listEvaluate,
      )
    );
  }

  removeData(){
    var length = datas.length;
    showMessage(length);
  }
/*Para guardar El Api en el Servidor */
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
            Uri.parse(globalController.urlApi!+"saveData"),
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
            getData();

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
/*Para guardar datos segun su respectivo modelo o arreglo */
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
    } /* Tipos de Evaluaciones, para poner nulo = 0 o si se jala una cantidad*/
    double? pt1 = datas[indexList].listEvaluate![0].pts == null? 0 : datas[indexList].listEvaluate![0].pts ;
    double? pt2 = datas[indexList].listEvaluate![1].pts == null? 0 : datas[indexList].listEvaluate![1].pts ;
    double? pt3 = datas[indexList].listEvaluate![2].pts == null? 0 : datas[indexList].listEvaluate![2].pts ;
    double? pt4 = datas[indexList].listEvaluate![3].pts == null? 0 : datas[indexList].listEvaluate![3].pts ;

    double? nt1 = datas[indexList].listEvaluate![0].note == null? 0 : datas[indexList].listEvaluate![0].note ;
    double? nt2 = datas[indexList].listEvaluate![1].note == null? 0 : datas[indexList].listEvaluate![1].note ;
    double? nt3 = datas[indexList].listEvaluate![2].note == null? 0 : datas[indexList].listEvaluate![2].note ;
    double? nt4 = datas[indexList].listEvaluate![3].note == null? 0 : datas[indexList].listEvaluate![3].note ;

    datas[indexList].total = (pt1!+pt2!+pt3!+pt4!); /* Sumatoria de Pts */
    datas[indexList].average = ((nt1!+nt2!+nt3!+nt4!)/4); /*Sumatoria de Notas = Promedio */
  }
/*Identificar las columnas , segun el tipo de Evaluacion */
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
/*Para mostrar el mensaje de Eliminar */
  showMessage(length) async {
    controllerModalRemove.text = length.toString();
    return Get.defaultDialog(
      title: 'Ingrese el N° de registro que desea eliminar',
      titlePadding: EdgeInsets.all(20),
      barrierDismissible: true,
      backgroundColor: Colors.white,
      content: new Row(
        children: <Widget>[
          new Expanded(
            child: Column(
              children: [
                new TextFormField(
                  controller: controllerModalRemove,
                  autofocus: true,
                  textCapitalization: TextCapitalization.words, 
                  keyboardType: TextInputType.number,
                    inputFormatters: [  
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (value) => removeDataIndex(value),
                )
              ],
            )
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(Colors.blue)
          ),
          child: const Text('Eliminar'),
          onPressed: () => removeDataIndex(controllerModalRemove.text),
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(Colors.red)
          ),
          child: const Text('Cancelar'),
          onPressed: () => Get.back(),
        ),
      ],
    );
    
  }
/* Mensaje de Error de Registro */
  removeDataIndex(index) async {
    index = int.parse(index);
    if(index > datas.length || index == 0){
      globalController.showMessage("Ingrese el N° de registro correctamente",false);
      await Future.delayed(Duration(seconds: 1));
      Get.back();
    }else{
      datas.removeAt(index-1);
      Get.back();
    }
  }

/* Mensaje de confirmacion de eliminacion de todos los registros */
  removeAllData() {
    return Get.defaultDialog(
      title: '',
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
              '¿Está seguro que desea eliminar todos los registros?',
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
            /* Limiapos la lista*/
            datas.value = <Data>[];
            addData(); /* Agregamos primer registro por defecto */
            Get.back();
          },
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(Colors.red)
          ),
          child: const Text('Cancelar'),
          onPressed: () => Get.back(),
        ),
      ],
    );

  }

/* Validaciones */
  validateModal(value, indexColumn){
    if(indexColumn >= 1 && indexColumn <= 2 || indexColumn == 20)
      validateText(value); /* Validacion de Texto columna 1, 2 y 20 */
    else if (indexColumn == 3 )
      validateAge(value); /*Validacion de Años o Edad */
    else if (indexColumn >= 4 && indexColumn <= 11 || indexColumn >= 13 && indexColumn <= 14 || indexColumn >= 16 && indexColumn <= 19)
      validateNum(value); /*Validacion de Numeros */
    else if(indexColumn == 12 || indexColumn == 15)
      validateTime(value);/*Validacion de Tiempo */
  }
//Validacion de Texto
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
// Validacion de Edad
  validateAge(value){
    statusError.value = false;
    String p = '[0-9]';
    RegExp regExp = new RegExp(p);

    if (!(value.isNotEmpty && regExp.hasMatch(value) && int.parse(value) >= 10 && int.parse(value) <= 100)){
      showModalError('Ingrese la edad correctamente');
      statusError.value = true;
    }
  }
// Validacion de Numeros
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
// Validacion de Tiempo
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