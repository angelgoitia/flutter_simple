import 'package:flutter/services.dart';
import 'package:flutter_simple/controller/authController.dart';
import 'package:flutter_simple/controller/globalController.dart';
import 'package:flutter_simple/model/data.dart';

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_simple/model/evaluate.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class DataTableController extends GetxController {
  TextEditingController controllerModalRemove = TextEditingController();
  final datas = <Data>[].obs;
  final statusError = false.obs;
  final indexActivity = 5;
  final statusVerify = true.obs;
  final isListening = false.obs;
  final lastId = 0.obs;

  GlobalController globalController = Get.put(GlobalController()); 

  getData() async{
    statusVerify.value = true;
    AuthController authController = Get.put(AuthController());  
    DateFormat formatter = DateFormat('yyyy-MM-dd');
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
          body: jsonEncode({
            'username' : authController.user.value.email,
            'date': formatter.format(authController.user.value.dateSelect!),
          }),
        ); // Petición api  ---  Respuestas que recibe
        print(response.body);
        jsonResponse = jsonDecode(response.body);

        if (jsonResponse['statusCode'] == 201) {
          datas.value = <Data>[];

          if(jsonResponse['length'] > 0)
            datas.value = (jsonResponse['datas'] as List).map((val) => Data.fromJson(val)).toList();

          await Future.delayed(Duration(seconds: 1));
          lastId.value = jsonResponse['lastId'];
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

    for (var data in datas) {
      for( var i = data.listEvaluate!.length ; i <= indexActivity; i++ ) { 
        data.listEvaluate!.add(
          Evaluate(
            id: i,
            repTiemp: null,
            note: null,
            pts: null,
          )
        );
      }
    }

    if(datas.length == 0){
      var listEvaluate = <Evaluate>[];

      for( var i = 1 ; i <= indexActivity; i++ ) { 
        listEvaluate.add(
          Evaluate(
            id: i,
            repTiemp: null,
            note: null,
            pts: null,
          )
        );
      }
      datas.add(
        Data(
          id: lastId.value,
          listEvaluate: listEvaluate,
        )
      );
    }
    statusVerify.value = false;

  }
  /* Verificar nuevo registro vacio */
  addData(status){
    var listEvaluate = <Evaluate>[];

    for( var i = 1 ; i <= indexActivity; i++ ) { 
      listEvaluate.add(
        Evaluate(
          id: i,
          repTiemp: null,
          note: null,
          pts: null,
        )
      );
    }

    datas.add(
      Data(
        id: status? datas[datas.length-1].id!+1 : lastId.value,
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
    AuthController authController = Get.put(AuthController()); 
    DateFormat formatter = DateFormat('yyyy-MM-dd');
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
              'username' : authController.user.value.email,
              'datas': datas,
              'date' : formatter.format(authController.user.value.dateSelect!),
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
        datas[indexList].gender = text;
        break;
      case 5:
        datas[indexList].size = text == null? null : double.parse(text.replaceAll(",", "."));
        break;
      case 6:
        datas[indexList].weight = text == null? null : double.parse(text.replaceAll(",", "."));
        break;
      case 7:
        datas[indexList].listEvaluate![showIndex(indexColumn)].repTiemp = text == null? null : text;
        bars(indexList, indexColumn);
        break;
      case 10:
      case 13:
      case 16:
      case 19:
        datas[indexList].listEvaluate![showIndex(indexColumn)].repTiemp = text == null? null : text;
        break;
      case 22:
        datas[indexList].total = text == null? null : double.parse(text.replaceAll(",", "."));
        break;
      case 23:
        datas[indexList].average = text == null? null : double.parse(text.replaceAll(",", "."));
        break;
      case 24:
        datas[indexList].result = text;
        break;
      default:
        break;
    } 

    
    
    /* Tipos de Evaluaciones, para poner nulo = 0 o si se jala una cantidad*/
    double? totalPts = 0, totalNts = 0;
    bool? statusNts = false;
    int count = 0;
    for( var i = 0 ; i < indexActivity; i++ ) {
      double? pts = datas[indexList].listEvaluate![i].pts == null? 0 : datas[indexList].listEvaluate![i].pts;
      double? note = datas[indexList].listEvaluate![i].note == null? 0 : datas[indexList].listEvaluate![i].note;

      totalPts = totalPts! + pts!; 
      totalNts = totalNts! + note!;

      if(datas[indexList].listEvaluate![i].note != null && datas[indexList].listEvaluate![i].note! > 0){
        count++;
      }
      
      if(datas[indexList].listEvaluate![i].note != null && datas[indexList].listEvaluate![i].note! == 0){
        statusNts = true;
      }
    }

    datas[indexList].total = totalPts; /* Sumatoria de Pts */
    datas[indexList].average = statusNts! || count == 0? 0 : double.parse((totalNts! / count).toStringAsExponential(2)); /*Sumatoria de Notas y saca el Promedio */
  }

  /* Barras */
  bars(indexList, indexColumn){
    var gender = datas[indexList].gender;
    var age = datas[indexList].age;
    var varRepTiemp;
    int min = 0, sec = 0;
    double note = 0, ptos = 0;

    if(gender == 0)
      varRepTiemp = double.parse(datas[indexList].listEvaluate![showIndex(indexColumn)].repTiemp!);
    else{
      varRepTiemp = datas[indexList].listEvaluate![showIndex(indexColumn)].repTiemp;
      var arr = varRepTiemp.split("'");
      min = arr[0];
      sec = arr[1];
    }

    if (gender == 0){

      if((age! < 25 && varRepTiemp >= 14) || (age >= 25 && age < 30 && varRepTiemp >= 13) || (age >= 30 && age < 35 && varRepTiemp >= 12) || (age >= 35 && age < 40 && varRepTiemp >= 11)){
        note = 20;
      }else if((age < 25 && varRepTiemp == 13) || (age >= 25 && age < 30 && varRepTiemp == 12) || (age >= 30 && age < 35 && varRepTiemp == 11) || (age >= 35 && age < 40 && varRepTiemp == 10)){
        note = 19.5;
      }else if((age < 25 && varRepTiemp == 12) || (age >= 25 && age < 30 && varRepTiemp == 11) || (age >= 30 && age < 35 && varRepTiemp == 10) || (age >= 35 && age < 40 && varRepTiemp == 9)){
        note = 19;
      }else if((age < 25 && varRepTiemp == 11) || (age >= 25 && age < 30 && varRepTiemp == 10) || (age >= 30 && age < 35 && varRepTiemp == 9) || (age >= 35 && age < 40 && varRepTiemp == 8)){
        note = 18;
      }else if((age < 25 && varRepTiemp == 10) || (age >= 25 && age < 30 && varRepTiemp == 09) || (age >= 30 && age < 35 && varRepTiemp == 8) || (age >= 35 && age < 40 && varRepTiemp == 7)){
        note = 17;
      }else if((age < 25 && varRepTiemp == 9) || (age >= 25 && age < 30 && varRepTiemp == 8) || (age >= 30 && age < 35 && varRepTiemp == 7) || (age >= 35 && age < 40 && varRepTiemp == 6)){
        note = 16;
      }else if((age < 25 && varRepTiemp == 8) || (age >= 25 && age < 30 && varRepTiemp == 7) || (age >= 30 && age < 35 && varRepTiemp == 6) || (age >= 35 && age < 40 && varRepTiemp == 5)){
        note = 15;
      }else if((age < 25 && varRepTiemp == 7) || (age >= 25 && age < 30 && varRepTiemp == 6) || (age >= 30 && age < 35 && varRepTiemp == 5) || (age >= 35 && age < 40 && varRepTiemp == 4)){
        note = 14;
      }else if((age < 25 && varRepTiemp == 6) || (age >= 25 && age < 30 && varRepTiemp == 5) || (age >= 30 && age < 35 && varRepTiemp == 4) || (age >= 35 && age < 40 && varRepTiemp == 3)){
        note = 13;
      }else{
        note = 0;
      }
      
    }else{

      if((age! < 25 && min >= 57) || (age >= 25 && age < 30 && min >= 52) || (age >= 30 && age < 35 && min >= 47) || (age >= 35 && age < 40 && min >= 32)){
        note = 20;
      }else if((age < 25 && min == 56) || (age >= 25 && age < 30 && min == 51) || (age >= 30 && age < 35 && min == 46) || (age >= 35 && age < 40 && min == 31)){
        note = 19.8;
      }else if((age < 25 && min == 55) || (age >= 25 && age < 30 && min == 50) || (age >= 30 && age < 35 && min == 45) || (age >= 35 && age < 40 && min == 30)){
        note = 19.5;
      }else if((age < 25 && min == 54) || (age >= 25 && age < 30 && min == 49) || (age >= 30 && age < 35 && min == 44) || (age >= 35 && age < 40 && min == 29)){
        note = 19.2;
      }else if((age < 25 && min == 53) || (age >= 25 && age < 30 && min == 48) || (age >= 30 && age < 35 && min == 43) || (age >= 35 && age < 40 && min == 28)){
        note = 18.9;
      }else if((age < 25 && min == 52) || (age >= 25 && age < 30 && min == 47) || (age >= 30 && age < 35 && min == 42) || (age >= 35 && age < 40 && min == 27)){
        note = 18.6;
      }else if((age < 25 && min == 51) || (age >= 25 && age < 30 && min == 46) || (age >= 30 && age < 35 && min == 41) || (age >= 35 && age < 40 && min == 26)){
        note = 18.3;
      }else if((age < 25 && min == 50) || (age >= 25 && age < 30 && min == 45) || (age >= 30 && age < 35 && min == 40) || (age >= 35 && age < 40 && min == 25)){
        note = 18;
      }else if((age < 25 && min == 49) || (age >= 25 && age < 30 && min == 44) || (age >= 30 && age < 35 && min == 39) || (age >= 35 && age < 40 && min == 24)){
        note = 17.5;
      }else if((age < 25 && min == 48) || (age >= 25 && age < 30 && min == 43) || (age >= 30 && age < 35 && min == 38) || (age >= 35 && age < 40 && min == 23)){
        note = 17;
      }else if((age < 25 && min == 47) || (age >= 25 && age < 30 && min == 44) || (age >= 30 && age < 35 && min == 37) || (age >= 35 && age < 40 && min == 22)){
        note = 16.5;
      }else if((age < 25 && min == 46) || (age >= 25 && age < 30 && min == 42) || (age >= 30 && age < 35 && min == 36) || (age >= 35 && age < 40 && min == 21)){
        note = 16;
      }else if((age < 25 && min == 45) || (age >= 25 && age < 30 && min == 41) || (age >= 30 && age < 35 && min == 35) || (age >= 35 && age < 40 && min == 20)){
        note = 15.5;
      }else if((age < 25 && min == 44) || (age >= 25 && age < 30 && min == 40) || (age >= 30 && age < 35 && min == 34) || (age >= 35 && age < 40 && min == 19)){
        note = 15;
      }else if((age < 25 && min == 43) || (age >= 25 && age < 30 && min == 39) || (age >= 30 && age < 35 && min == 33) || (age >= 35 && age < 40 && min == 18)){
        note = 14.5;
      }else if((age < 25 && min == 42) || (age >= 25 && age < 30 && min == 38) || (age >= 30 && age < 35 && min == 32) || (age >= 35 && age < 40 && min == 17)){
        note = 14;
      }else if((age < 25 && min == 41) || (age >= 25 && age < 30 && min == 37) || (age >= 30 && age < 35 && min == 31) || (age >= 35 && age < 40 && min == 16)){
        note = 13.5;
      }else if((age < 25 && min == 40) || (age >= 25 && age < 30 && min == 36) || (age >= 30 && age < 35 && min == 30) || (age >= 35 && age < 40 && min == 15)){
        note = 13;
      }else{
        note = 0;
      }

    }

    ptos = note *2;
    datas[indexList].listEvaluate![showIndex(indexColumn)].note = note;
    datas[indexList].listEvaluate![showIndex(indexColumn)].pts = ptos;
  }

/*Identificar las columnas , segun el tipo de Evaluacion */
  int showIndex(indexColumn){
    if(indexColumn >= 6 && indexColumn <= 8)
      return 0;
    else if(indexColumn >= 9 && indexColumn <= 11)
      return 1;
    else if(indexColumn >= 12 && indexColumn <= 14)
      return 2;
    else if(indexColumn >= 15 && indexColumn <= 17)
      return 3;
    else if(indexColumn >= 18 && indexColumn <= 20)
      return 4;
    else
      return 5;
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
            addData(false); /* Agregamos primer registro por defecto */
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
    if(indexColumn >= 1 && indexColumn <= 2 || indexColumn == 26)
      validateText(value); /* Validacion de Texto columna 1, 2 y 26 */
    else if (indexColumn == 3 )
      validateAge(value); /*Validacion de Años o Edad */
    else if (indexColumn >= 4 && indexColumn <= 14 || indexColumn >= 16 && indexColumn <= 17 || indexColumn >= 19 && indexColumn <= 20 || indexColumn >= 22 && indexColumn <= 25 )
      validateNum(value); /*Validacion de Numeros */
    else if(indexColumn == 15 || indexColumn == 18 || indexColumn == 21)
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