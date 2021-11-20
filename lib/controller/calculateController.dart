import 'package:flutter_simple/controller/dataTableController.dart';

import 'package:get/get.dart';

class CalculateController extends GetxController {

  DataTableController dataTableController = Get.put(DataTableController()); 

  int converteTimeToSec(min, sec){
    return (sec + (min * 60));
  }

  /* Barras y Suspensión */
  barsSuspension(indexList, indexColumn){
    var gender = dataTableController.datas[indexList].gender;
    var age = dataTableController.datas[indexList].age;
    var varRepTiemp;
    int sec = 0, min = 0;
    double note = 0, ptos = 0;

    if(gender == 0)
      varRepTiemp = int.parse(dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].repTiemp!);
    else{
      varRepTiemp = dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].repTiemp;
      var arr = varRepTiemp.split("'");
      min = int.parse(arr[0]);
      sec = int.parse(arr[1]);

      sec = sec + (min * 60);
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

      if((age! < 25 && sec >= 57) || (age >= 25 && age < 30 && sec >= 52) || (age >= 30 && age < 35 && sec >= 47) || (age >= 35 && age < 40 && sec >= 32)){
        note = 20;
      }else if((age < 25 && sec == 56) || (age >= 25 && age < 30 && sec == 51) || (age >= 30 && age < 35 && sec == 46) || (age >= 35 && age < 40 && sec == 31)){
        note = 19.8;
      }else if((age < 25 && sec == 55) || (age >= 25 && age < 30 && sec == 50) || (age >= 30 && age < 35 && sec == 45) || (age >= 35 && age < 40 && sec == 30)){
        note = 19.5;
      }else if((age < 25 && sec == 54) || (age >= 25 && age < 30 && sec == 49) || (age >= 30 && age < 35 && sec == 44) || (age >= 35 && age < 40 && sec == 29)){
        note = 19.2;
      }else if((age < 25 && sec == 53) || (age >= 25 && age < 30 && sec == 48) || (age >= 30 && age < 35 && sec == 43) || (age >= 35 && age < 40 && sec == 28)){
        note = 18.9;
      }else if((age < 25 && sec == 52) || (age >= 25 && age < 30 && sec == 47) || (age >= 30 && age < 35 && sec == 42) || (age >= 35 && age < 40 && sec == 27)){
        note = 18.6;
      }else if((age < 25 && sec == 51) || (age >= 25 && age < 30 && sec == 46) || (age >= 30 && age < 35 && sec == 41) || (age >= 35 && age < 40 && sec == 26)){
        note = 18.3;
      }else if((age < 25 && sec == 50) || (age >= 25 && age < 30 && sec == 45) || (age >= 30 && age < 35 && sec == 40) || (age >= 35 && age < 40 && sec == 25)){
        note = 18;
      }else if((age < 25 && sec == 49) || (age >= 25 && age < 30 && sec == 44) || (age >= 30 && age < 35 && sec == 39) || (age >= 35 && age < 40 && sec == 24)){
        note = 17.5;
      }else if((age < 25 && sec == 48) || (age >= 25 && age < 30 && sec == 43) || (age >= 30 && age < 35 && sec == 38) || (age >= 35 && age < 40 && sec == 23)){
        note = 17;
      }else if((age < 25 && sec == 47) || (age >= 25 && age < 30 && sec == 44) || (age >= 30 && age < 35 && sec == 37) || (age >= 35 && age < 40 && sec == 22)){
        note = 16.5;
      }else if((age < 25 && sec == 46) || (age >= 25 && age < 30 && sec == 42) || (age >= 30 && age < 35 && sec == 36) || (age >= 35 && age < 40 && sec == 21)){
        note = 16;
      }else if((age < 25 && sec == 45) || (age >= 25 && age < 30 && sec == 41) || (age >= 30 && age < 35 && sec == 35) || (age >= 35 && age < 40 && sec == 20)){
        note = 15.5;
      }else if((age < 25 && sec == 44) || (age >= 25 && age < 30 && sec == 40) || (age >= 30 && age < 35 && sec == 34) || (age >= 35 && age < 40 && sec == 19)){
        note = 15;
      }else if((age < 25 && sec == 43) || (age >= 25 && age < 30 && sec == 39) || (age >= 30 && age < 35 && sec == 33) || (age >= 35 && age < 40 && sec == 18)){
        note = 14.5;
      }else if((age < 25 && sec == 42) || (age >= 25 && age < 30 && sec == 38) || (age >= 30 && age < 35 && sec == 32) || (age >= 35 && age < 40 && sec == 17)){
        note = 14;
      }else if((age < 25 && sec == 41) || (age >= 25 && age < 30 && sec == 37) || (age >= 30 && age < 35 && sec == 31) || (age >= 35 && age < 40 && sec == 16)){
        note = 13.5;
      }else if((age < 25 && sec == 40) || (age >= 25 && age < 30 && sec == 36) || (age >= 30 && age < 35 && sec == 30) || (age >= 35 && age < 40 && sec == 15)){
        note = 13;
      }else{
        note = 0;
      }

    }

    ptos = note *2;
    dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].note = double.parse(note.toStringAsFixed(2));
    dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].pts = double.parse(ptos.toStringAsFixed(2));
  }

  /* Abdominales */

  abs(indexList, indexColumn){
    var gender = dataTableController.datas[indexList].gender;
    var age = dataTableController.datas[indexList].age;
    var varRepTiemp = int.parse(dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].repTiemp!);
    double note = 0, ptos = 0;

    if (gender == 0){

      if((age! < 25 && varRepTiemp >= 64) || (age >= 25 && age < 30 && varRepTiemp >= 62) || (age >= 30 && age < 35 && varRepTiemp >= 60) || (age >= 35 && age < 40 && varRepTiemp >= 58)){
        note = 20;
      }else if((age < 25 && varRepTiemp == 63) || (age >= 25 && age < 30 && varRepTiemp == 61) || (age >= 30 && age < 35 && varRepTiemp == 59) || (age >= 35 && age < 40 && varRepTiemp == 57)){
        note = 19.6;
      }else if((age < 25 && varRepTiemp == 62) || (age >= 25 && age < 30 && varRepTiemp == 60) || (age >= 30 && age < 35 && varRepTiemp == 58) || (age >= 35 && age < 40 && varRepTiemp == 56)){
        note = 19.2;
      }else if((age < 25 && varRepTiemp == 61) || (age >= 25 && age < 30 && varRepTiemp == 59) || (age >= 30 && age < 35 && varRepTiemp == 57) || (age >= 35 && age < 40 && varRepTiemp == 55)){
        note = 18.8;
      }else if((age < 25 && varRepTiemp == 60) || (age >= 25 && age < 30 && varRepTiemp == 58) || (age >= 30 && age < 35 && varRepTiemp == 56) || (age >= 35 && age < 40 && varRepTiemp == 54)){
        note = 18.4;
      }else if((age < 25 && varRepTiemp == 59) || (age >= 25 && age < 30 && varRepTiemp == 57) || (age >= 30 && age < 35 && varRepTiemp == 55) || (age >= 35 && age < 40 && varRepTiemp == 53)){
        note = 18;
      }else if((age < 25 && varRepTiemp == 58) || (age >= 25 && age < 30 && varRepTiemp == 56) || (age >= 30 && age < 35 && varRepTiemp == 54) || (age >= 35 && age < 40 && varRepTiemp == 52)){
        note = 17.8;
      }else if((age < 25 && varRepTiemp == 57) || (age >= 25 && age < 30 && varRepTiemp == 55) || (age >= 30 && age < 35 && varRepTiemp == 53) || (age >= 35 && age < 40 && varRepTiemp == 51)){
        note = 17.4;
      }else if((age < 25 && varRepTiemp == 56) || (age >= 25 && age < 30 && varRepTiemp == 54) || (age >= 30 && age < 35 && varRepTiemp == 52) || (age >= 35 && age < 40 && varRepTiemp == 50)){
        note = 17;
      }else if((age < 25 && varRepTiemp == 55) || (age >= 25 && age < 30 && varRepTiemp == 53) || (age >= 30 && age < 35 && varRepTiemp == 51) || (age >= 35 && age < 40 && varRepTiemp == 49)){
        note = 16.6;
      }else if((age < 25 && varRepTiemp == 54) || (age >= 25 && age < 30 && varRepTiemp == 52) || (age >= 30 && age < 35 && varRepTiemp == 50) || (age >= 35 && age < 40 && varRepTiemp == 48)){
        note = 16.2;
      }else if((age < 25 && varRepTiemp == 53) || (age >= 25 && age < 30 && varRepTiemp == 51) || (age >= 30 && age < 35 && varRepTiemp == 49) || (age >= 35 && age < 40 && varRepTiemp == 47)){
        note = 16;
      }else if((age < 25 && varRepTiemp == 52) || (age >= 25 && age < 30 && varRepTiemp == 50) || (age >= 30 && age < 35 && varRepTiemp == 48) || (age >= 35 && age < 40 && varRepTiemp == 46)){
        note = 15.8;
      }else if((age < 25 && varRepTiemp == 51) || (age >= 25 && age < 30 && varRepTiemp == 49) || (age >= 30 && age < 35 && varRepTiemp == 47) || (age >= 35 && age < 40 && varRepTiemp == 45)){
        note = 15.6;
      }else if((age < 25 && varRepTiemp == 50) || (age >= 25 && age < 30 && varRepTiemp == 48) || (age >= 30 && age < 35 && varRepTiemp == 46) || (age >= 35 && age < 40 && varRepTiemp == 44)){
        note = 15.4;
      }else if((age < 25 && varRepTiemp == 49) || (age >= 25 && age < 30 && varRepTiemp == 47) || (age >= 30 && age < 35 && varRepTiemp == 45) || (age >= 35 && age < 40 && varRepTiemp == 43)){
        note = 15.2;
      }else if((age < 25 && varRepTiemp == 48) || (age >= 25 && age < 30 && varRepTiemp == 46) || (age >= 30 && age < 35 && varRepTiemp == 44) || (age >= 35 && age < 40 && varRepTiemp == 42)){
        note = 15;
      }else if((age < 25 && varRepTiemp == 47) || (age >= 25 && age < 30 && varRepTiemp == 45) || (age >= 30 && age < 35 && varRepTiemp == 43) || (age >= 35 && age < 40 && varRepTiemp == 41)){
        note = 14.8;
      }else if((age < 25 && varRepTiemp == 46) || (age >= 25 && age < 30 && varRepTiemp == 44) || (age >= 30 && age < 35 && varRepTiemp == 42) || (age >= 35 && age < 40 && varRepTiemp == 40)){
        note = 14.6;
      }else if((age < 25 && varRepTiemp == 45) || (age >= 25 && age < 30 && varRepTiemp == 43) || (age >= 30 && age < 35 && varRepTiemp == 41) || (age >= 35 && age < 40 && varRepTiemp == 39)){
        note = 14.4;
      }else if((age < 25 && varRepTiemp == 44) || (age >= 25 && age < 30 && varRepTiemp == 42) || (age >= 30 && age < 35 && varRepTiemp == 40) || (age >= 35 && age < 40 && varRepTiemp == 38)){
        note = 14.2;
      }else if((age < 25 && varRepTiemp == 43) || (age >= 25 && age < 30 && varRepTiemp == 41) || (age >= 30 && age < 35 && varRepTiemp == 39) || (age >= 35 && age < 40 && varRepTiemp == 37)){
        note = 14;
      }else if((age < 25 && varRepTiemp == 42) || (age >= 25 && age < 30 && varRepTiemp == 40) || (age >= 30 && age < 35 && varRepTiemp == 38) || (age >= 35 && age < 40 && varRepTiemp == 36)){
        note = 13.8;
      }else if((age < 25 && varRepTiemp == 41) || (age >= 25 && age < 30 && varRepTiemp == 39) || (age >= 30 && age < 35 && varRepTiemp == 37) || (age >= 35 && age < 40 && varRepTiemp == 35)){
        note = 13.6;
      }else if((age < 25 && varRepTiemp == 40) || (age >= 25 && age < 30 && varRepTiemp == 38) || (age >= 30 && age < 35 && varRepTiemp == 36) || (age >= 35 && age < 40 && varRepTiemp == 34)){
        note = 13.4;
      }else if((age < 25 && varRepTiemp == 39) || (age >= 25 && age < 30 && varRepTiemp == 37) || (age >= 30 && age < 35 && varRepTiemp == 35) || (age >= 35 && age < 40 && varRepTiemp == 33)){
        note = 13.2;
      }else if((age < 25 && varRepTiemp == 38) || (age >= 25 && age < 30 && varRepTiemp == 36) || (age >= 30 && age < 35 && varRepTiemp == 34) || (age >= 35 && age < 40 && varRepTiemp == 32)){
        note = 13;
      }else{
        note = 0;
      }
      
    }else{

      if((age! < 25 && varRepTiemp >= 56) || (age >= 25 && age < 30 && varRepTiemp >= 54) || (age >= 30 && age < 35 && varRepTiemp >= 52) || (age >= 35 && age < 40 && varRepTiemp >= 50)){
        note = 20;
      }else if((age < 25 && varRepTiemp == 55) || (age >= 25 && age < 30 && varRepTiemp == 53) || (age >= 30 && age < 35 && varRepTiemp == 51) || (age >= 35 && age < 40 && varRepTiemp == 49)){
        note = 19.6;
      }else if((age < 25 && varRepTiemp == 54) || (age >= 25 && age < 30 && varRepTiemp == 52) || (age >= 30 && age < 35 && varRepTiemp == 50) || (age >= 35 && age < 40 && varRepTiemp == 48)){
        note = 19.2;
      }else if((age < 25 && varRepTiemp == 53) || (age >= 25 && age < 30 && varRepTiemp == 51) || (age >= 30 && age < 35 && varRepTiemp == 49) || (age >= 35 && age < 40 && varRepTiemp == 47)){
        note = 18.8;
      }else if((age < 25 && varRepTiemp == 52) || (age >= 25 && age < 30 && varRepTiemp == 50) || (age >= 30 && age < 35 && varRepTiemp == 48) || (age >= 35 && age < 40 && varRepTiemp == 46)){
        note = 18.4;
      }else if((age < 25 && varRepTiemp == 51) || (age >= 25 && age < 30 && varRepTiemp == 49) || (age >= 30 && age < 35 && varRepTiemp == 47) || (age >= 35 && age < 40 && varRepTiemp == 45)){
        note = 18;
      }else if((age < 25 && varRepTiemp == 50) || (age >= 25 && age < 30 && varRepTiemp == 48) || (age >= 30 && age < 35 && varRepTiemp == 46) || (age >= 35 && age < 40 && varRepTiemp == 44)){
        note = 17.8;
      }else if((age < 25 && varRepTiemp == 49) || (age >= 25 && age < 30 && varRepTiemp == 47) || (age >= 30 && age < 35 && varRepTiemp == 45) || (age >= 35 && age < 40 && varRepTiemp == 43)){
        note = 17.4;
      }else if((age < 25 && varRepTiemp == 48) || (age >= 25 && age < 30 && varRepTiemp == 46) || (age >= 30 && age < 35 && varRepTiemp == 44) || (age >= 35 && age < 40 && varRepTiemp == 42)){
        note = 17;
      }else if((age < 25 && varRepTiemp == 47) || (age >= 25 && age < 30 && varRepTiemp == 45) || (age >= 30 && age < 35 && varRepTiemp == 43) || (age >= 35 && age < 40 && varRepTiemp == 41)){
        note = 16.6;
      }else if((age < 25 && varRepTiemp == 46) || (age >= 25 && age < 30 && varRepTiemp == 44) || (age >= 30 && age < 35 && varRepTiemp == 42) || (age >= 35 && age < 40 && varRepTiemp == 40)){
        note = 16.2;
      }else if((age < 25 && varRepTiemp == 45) || (age >= 25 && age < 30 && varRepTiemp == 43) || (age >= 30 && age < 35 && varRepTiemp == 41) || (age >= 35 && age < 40 && varRepTiemp == 39)){
        note = 16;
      }else if((age < 25 && varRepTiemp == 44) || (age >= 25 && age < 30 && varRepTiemp == 42) || (age >= 30 && age < 35 && varRepTiemp == 40) || (age >= 35 && age < 40 && varRepTiemp == 38)){
        note = 15.8;
      }else if((age < 25 && varRepTiemp == 43) || (age >= 25 && age < 30 && varRepTiemp == 41) || (age >= 30 && age < 35 && varRepTiemp == 39) || (age >= 35 && age < 40 && varRepTiemp == 37)){
        note = 15.6;
      }else if((age < 25 && varRepTiemp == 42) || (age >= 25 && age < 30 && varRepTiemp == 40) || (age >= 30 && age < 35 && varRepTiemp == 38) || (age >= 35 && age < 40 && varRepTiemp == 36)){
        note = 15.4;
      }else if((age < 25 && varRepTiemp == 41) || (age >= 25 && age < 30 && varRepTiemp == 39) || (age >= 30 && age < 35 && varRepTiemp == 37) || (age >= 35 && age < 40 && varRepTiemp == 35)){
        note = 15.2;
      }else if((age < 25 && varRepTiemp == 40) || (age >= 25 && age < 30 && varRepTiemp == 38) || (age >= 30 && age < 35 && varRepTiemp == 36) || (age >= 35 && age < 40 && varRepTiemp == 34)){
        note = 15;
      }else if((age < 25 && varRepTiemp == 39) || (age >= 25 && age < 30 && varRepTiemp == 37) || (age >= 30 && age < 35 && varRepTiemp == 35) || (age >= 35 && age < 40 && varRepTiemp == 33)){
        note = 14.8;
      }else if((age < 25 && varRepTiemp == 38) || (age >= 25 && age < 30 && varRepTiemp == 36) || (age >= 30 && age < 35 && varRepTiemp == 34) || (age >= 35 && age < 40 && varRepTiemp == 32)){
        note = 14.6;
      }else if((age < 25 && varRepTiemp == 37) || (age >= 25 && age < 30 && varRepTiemp == 35) || (age >= 30 && age < 35 && varRepTiemp == 33) || (age >= 35 && age < 40 && varRepTiemp == 31)){
        note = 14.4;
      }else if((age < 25 && varRepTiemp == 36) || (age >= 25 && age < 30 && varRepTiemp == 34) || (age >= 30 && age < 35 && varRepTiemp == 32) || (age >= 35 && age < 40 && varRepTiemp == 30)){
        note = 14.2;
      }else if((age < 25 && varRepTiemp == 35) || (age >= 25 && age < 30 && varRepTiemp == 33) || (age >= 30 && age < 35 && varRepTiemp == 31) || (age >= 35 && age < 40 && varRepTiemp == 29)){
        note = 14;
      }else if((age < 25 && varRepTiemp == 34) || (age >= 25 && age < 30 && varRepTiemp == 32) || (age >= 30 && age < 35 && varRepTiemp == 30) || (age >= 35 && age < 40 && varRepTiemp == 28)){
        note = 13.8;
      }else if((age < 25 && varRepTiemp == 33) || (age >= 25 && age < 30 && varRepTiemp == 31) || (age >= 30 && age < 35 && varRepTiemp == 29) || (age >= 35 && age < 40 && varRepTiemp == 27)){
        note = 13.6;
      }else if((age < 25 && varRepTiemp == 32) || (age >= 25 && age < 30 && varRepTiemp == 30) || (age >= 30 && age < 35 && varRepTiemp == 28) || (age >= 35 && age < 40 && varRepTiemp == 26)){
        note = 13.4;
      }else if((age < 25 && varRepTiemp == 31) || (age >= 25 && age < 30 && varRepTiemp == 29) || (age >= 30 && age < 35 && varRepTiemp == 27) || (age >= 35 && age < 40 && varRepTiemp == 25)){
        note = 13.2;
      }else if((age < 25 && varRepTiemp == 30) || (age >= 25 && age < 30 && varRepTiemp == 28) || (age >= 30 && age < 35 && varRepTiemp == 26) || (age >= 35 && age < 40 && varRepTiemp == 24)){
        note = 13;
      }else{
        note = 0;
      }

    }

    ptos = note *1;
    dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].note = double.parse(note.toStringAsFixed(2));
    dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].pts = double.parse(ptos.toStringAsFixed(2));
  }


  /* Carrera */
  career(indexList, indexColumn){
    var gender = dataTableController.datas[indexList].gender;
    var age = dataTableController.datas[indexList].age;
    var varRepTiemp = dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].repTiemp;
    int min = 0, sec=0;
    double note = 0, ptos = 0;

    var arr = varRepTiemp!.split("'");
    min = int.parse(arr[0]);
    sec = int.parse(arr[1]);

    sec = sec + (min * 60);

    if (gender == 0){

      if((age! < 25 && sec <= converteTimeToSec(8,30)) || (age >= 25 && age < 30 && sec <= converteTimeToSec(9,0)) || (age >= 30 && age < 35 && sec <= converteTimeToSec(9,30)) || (age >= 35 && age < 40 && sec <= converteTimeToSec(10,0))){
        note = 20;
      }else if((age < 25 && sec >= converteTimeToSec(8,31) && sec <= converteTimeToSec(8,36)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(9,1) && sec <= converteTimeToSec(9,6)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(9,31) && sec <= converteTimeToSec(9,36)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(10,1) && sec <= converteTimeToSec(10,6))){
        note = 19.80;
      }else if((age < 25 && sec >= converteTimeToSec(8,37) && sec <= converteTimeToSec(8,42)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(9,7) && sec <= converteTimeToSec(9,12)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(9,37) && sec <= converteTimeToSec(9,42)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(10,7) && sec <= converteTimeToSec(10,12))){
        note = 19.60;
      }else if((age < 25 && sec >= converteTimeToSec(8,43) && sec <= converteTimeToSec(8,48)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(9,13) && sec <= converteTimeToSec(9,18)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(9,43) && sec <= converteTimeToSec(9,48)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(10,13) && sec <= converteTimeToSec(10,18))){
        note = 19.40;
      }else if((age < 25 && sec >= converteTimeToSec(8,49) && sec <= converteTimeToSec(8,54)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(9,19) && sec <= converteTimeToSec(9,24)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(9,49) && sec <= converteTimeToSec(9,54)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(10,19) && sec <= converteTimeToSec(10,24))){
        note = 19.20;
      }else if((age < 25 && sec >= converteTimeToSec(8,55) && sec <= converteTimeToSec(9,5)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(9,25) && sec <= converteTimeToSec(9,35)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(9,55) && sec <= converteTimeToSec(10,5)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(10,25) && sec <= converteTimeToSec(10,35))){
        note = 19;
      }else if((age < 25 && sec >= converteTimeToSec(9,6) && sec <= converteTimeToSec(9,16)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(9,36) && sec <= converteTimeToSec(9,46)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(10,6) && sec <= converteTimeToSec(10,16)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(10,36) && sec <= converteTimeToSec(10,46))){
        note = 18.80;
      }else if((age < 25 && sec >= converteTimeToSec(9,17) && sec <= converteTimeToSec(9,27)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(9,47) && sec <= converteTimeToSec(9,57)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(10,117) && sec <= converteTimeToSec(11,27)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(10,47) && sec <= converteTimeToSec(10,57))){
        note = 18.60;
      }else if((age < 25 && sec >= converteTimeToSec(9,28) && sec <= converteTimeToSec(9,38)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(9,58) && sec <= converteTimeToSec(10,8)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(10,28) && sec <= converteTimeToSec(10,38)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(10,58) && sec <= converteTimeToSec(11,8))){
        note = 18.40;
      }else if((age < 25 && sec >= converteTimeToSec(9,39) && sec <= converteTimeToSec(9,49)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(10,9) && sec <= converteTimeToSec(10,19)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(10,39) && sec <= converteTimeToSec(10,49)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(11,9) && sec <= converteTimeToSec(11,19))){
        note = 18.20;
      }else if((age < 25 && sec >= converteTimeToSec(9,50) && sec <= converteTimeToSec(10,0)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(10,20) && sec <= converteTimeToSec(10,30)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(10,50) && sec <= converteTimeToSec(11,0))  || (age >= 35 && age < 40 && sec >= converteTimeToSec(11,20) && sec <= converteTimeToSec(11,30))){
        note = 18;
      }else if((age < 25 && sec >= converteTimeToSec(10,1) && sec <= converteTimeToSec(10,6)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(10,31) && sec <= converteTimeToSec(10,36)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(11,1) && sec <= converteTimeToSec(11,6)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(11,31) && sec <= converteTimeToSec(11,36))){
        note = 17.80;
      }else if((age < 25 && sec >= converteTimeToSec(10,7) && sec <= converteTimeToSec(10,12)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(10,37) && sec <= converteTimeToSec(10,42)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(11,7) && sec <= converteTimeToSec(11,12)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(11,37) && sec <= converteTimeToSec(11,42))){
        note = 17.60;
      }else if((age < 25 && sec >= converteTimeToSec(10,13) && sec <= converteTimeToSec(10,18)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(10,43) && sec <= converteTimeToSec(10,48)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(11,13) && sec <= converteTimeToSec(11,18)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(11,43) && sec <= converteTimeToSec(11,48))){
        note = 17.40;
      }else if((age < 25 && sec >= converteTimeToSec(10,19) && sec <= converteTimeToSec(10,24)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(10,49) && sec <= converteTimeToSec(10,54)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(11,19) && sec <= converteTimeToSec(11,24)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(11,49) && sec <= converteTimeToSec(11,54))){
        note = 17.20;
      }else if((age < 25 && sec >= converteTimeToSec(10,25) && sec <= converteTimeToSec(10,30)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(10,55) && sec <= converteTimeToSec(11,0)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(11,25) && sec <= converteTimeToSec(11,30)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(11,55) && sec <= converteTimeToSec(12,0))){
        note = 17;
      }else if((age < 25 && sec >= converteTimeToSec(10,31) && sec <= converteTimeToSec(10,36)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(11,1) && sec <= converteTimeToSec(10,6)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(11,31) && sec <= converteTimeToSec(11,36)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(12,1) && sec <= converteTimeToSec(12,6))){
        note = 16.80;
      }else if((age < 25 && sec >= converteTimeToSec(10,37) && sec <= converteTimeToSec(10,42)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(11,7) && sec <= converteTimeToSec(11,12)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(11,37) && sec <= converteTimeToSec(11,42)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(12,7) && sec <= converteTimeToSec(12,12))){
        note = 16.60;
      }else if((age < 25 && sec >= converteTimeToSec(10,43) && sec <= converteTimeToSec(10,48)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(11,3) && sec <= converteTimeToSec(11,18)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(11,43) && sec <= converteTimeToSec(11,48)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(12,13) && sec <= converteTimeToSec(12,18))){
        note = 16.40;
      }else if((age < 25 && sec >= converteTimeToSec(10,49) && sec <= converteTimeToSec(10,54)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(11,19) && sec <= converteTimeToSec(11,24)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(11,49) && sec <= converteTimeToSec(11,54)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(12,19) && sec <= converteTimeToSec(12,24))){
        note = 16.20;
      }else if((age < 25 && sec >= converteTimeToSec(10,55) && sec <= converteTimeToSec(11,0)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(11,25) && sec <= converteTimeToSec(11,30)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(11,55) && sec <= converteTimeToSec(12,0))  || (age >= 35 && age < 40 && sec >= converteTimeToSec(12,25) && sec <= converteTimeToSec(12,30))){
        note = 16;
      }else if((age < 25 && sec >= converteTimeToSec(11,1) && sec <= converteTimeToSec(11,6)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(11,31) && sec <= converteTimeToSec(11,36)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(12,1) && sec <= converteTimeToSec(12,6)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(12,31) && sec <= converteTimeToSec(12,36))){
        note = 15.80;
      }else if((age < 25 && sec >= converteTimeToSec(11,7) && sec <= converteTimeToSec(11,12)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(11,37) && sec <= converteTimeToSec(11,42)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(12,7) && sec <= converteTimeToSec(12,12)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(12,37) && sec <= converteTimeToSec(12,42))){
        note = 15.60;
      }else if((age < 25 && sec >= converteTimeToSec(11,13) && sec <= converteTimeToSec(11,18)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(11,43) && sec <= converteTimeToSec(11,48)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(12,13) && sec <= converteTimeToSec(12,18)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(12,43) && sec <= converteTimeToSec(12,48))){
        note = 15.40;
      }else if((age < 25 && sec >= converteTimeToSec(11,19) && sec <= converteTimeToSec(11,24)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(11,49) && sec <= converteTimeToSec(11,54)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(12,19) && sec <= converteTimeToSec(12,24)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(12,49) && sec <= converteTimeToSec(12,54))){
        note = 15.20;
      }else if((age < 25 && sec >= converteTimeToSec(11,25) && sec <= converteTimeToSec(11,30)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(11,55) && sec <= converteTimeToSec(12,0)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(12,25) && sec <= converteTimeToSec(12,30)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(12,55) && sec <= converteTimeToSec(13,0))){
        note = 15;
      }else if((age < 25 && sec >= converteTimeToSec(11,31) && sec <= converteTimeToSec(11,36)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(12,1) && sec <= converteTimeToSec(12,6)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(12,31) && sec <= converteTimeToSec(12,36)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(13,1) && sec <= converteTimeToSec(13,6))){
        note = 14.80;
      }else if((age < 25 && sec >= converteTimeToSec(11,37) && sec <= converteTimeToSec(11,42)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(12,7) && sec <= converteTimeToSec(12,12)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(12,37) && sec <= converteTimeToSec(12,42)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(13,7) && sec <= converteTimeToSec(13,12))){
        note = 14.60;
      }else if((age < 25 && sec >= converteTimeToSec(11,43) && sec <= converteTimeToSec(11,48)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(12,13) && sec <= converteTimeToSec(12,18)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(12,43) && sec <= converteTimeToSec(12,48))  || (age >= 35 && age < 40 && sec >= converteTimeToSec(13,13) && sec <= converteTimeToSec(13,18))){
        note = 14.40;
      }else if((age < 25 && sec >= converteTimeToSec(11,49) && sec <= converteTimeToSec(11,54)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(12,19) && sec <= converteTimeToSec(12,24)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(12,49) && sec <= converteTimeToSec(12,54)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(13,19) && sec <= converteTimeToSec(13,24))){
        note = 14.20;
      }else if((age < 25 && sec >= converteTimeToSec(11,55) && sec <= converteTimeToSec(12,0)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(12,25) && sec <= converteTimeToSec(12,30)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(12,55) && sec <= converteTimeToSec(13,0)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(13,25) && sec <= converteTimeToSec(13,30))){
        note = 14;
      }else if((age < 25 && sec >= converteTimeToSec(12,1) && sec <= converteTimeToSec(12,6)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(12,31) && sec <= converteTimeToSec(12,36)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(13,1) && sec <= converteTimeToSec(13,6)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(13,31) && sec <= converteTimeToSec(13,36))){
        note = 13.80;
      }else if((age < 25 && sec >= converteTimeToSec(12,7) && sec <= converteTimeToSec(12,12)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(12,37) && sec <= converteTimeToSec(12,42)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(13,7) && sec <= converteTimeToSec(13,12)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(13,37) && sec <= converteTimeToSec(13,42))){
        note = 13.60;
      }else if((age < 25 && sec >= converteTimeToSec(12,13) && sec <= converteTimeToSec(12,18)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(12,43) && sec <= converteTimeToSec(12,48)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(13,13) && sec <= converteTimeToSec(13,18)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(13,43) && sec <= converteTimeToSec(13,48))){
        note = 13.40;
      }else if((age < 25 && sec >= converteTimeToSec(12,19) && sec <= converteTimeToSec(12,24)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(12,49) && sec <= converteTimeToSec(12,54)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(13,19) && sec <= converteTimeToSec(13,24)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(13,49) && sec <= converteTimeToSec(13,54))){
        note = 13.20;
      }else if((age < 25 && sec >= converteTimeToSec(12,25) && sec <= converteTimeToSec(12,30)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(12,55) && sec <= converteTimeToSec(13,0)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(13,25) && sec <= converteTimeToSec(13,30)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(13,55) && sec <= converteTimeToSec(14,0))){
        note = 13;
      }else{
        note = 0;
      }
      
    }else{

      if((age! < 25 && sec <= converteTimeToSec(10,0)) || (age >= 25 && age < 30 && sec <= converteTimeToSec(10,30)) || (age >= 30 && age < 35 && sec <= converteTimeToSec(11,0)) || (age >= 35 && age < 40 && sec <= converteTimeToSec(11,30))){
        note = 20;
      }else if((age < 25 && sec >= converteTimeToSec(10,1) && sec <= converteTimeToSec(10,6)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(10,31) && sec <= converteTimeToSec(10,36)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(11,1) && sec <= converteTimeToSec(11,6)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(11,31) && sec <= converteTimeToSec(11,36))){
        note = 19.80;
      }else if((age < 25 && sec >= converteTimeToSec(10,7) && sec <= converteTimeToSec(10,12)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(10,37) && sec <= converteTimeToSec(10,42)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(11,7) && sec <= converteTimeToSec(11,12)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(11,37) && sec <= converteTimeToSec(11,42))){
        note = 19.60;
      }else if((age < 25 && sec >= converteTimeToSec(10,13) && sec <= converteTimeToSec(10,18)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(10,43) && sec <= converteTimeToSec(10,48)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(11,13) && sec <= converteTimeToSec(11,18)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(11,43) && sec <= converteTimeToSec(11,48))){
        note = 19.40;
      }else if((age < 25 && sec >= converteTimeToSec(10,19) && sec <= converteTimeToSec(10,24)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(10,49) && sec <= converteTimeToSec(10,54)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(11,19) && sec <= converteTimeToSec(11,24)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(11,49) && sec <= converteTimeToSec(11,54))){
        note = 19.20;
      }else if((age < 25 && sec >= converteTimeToSec(10,25) && sec <= converteTimeToSec(10,35)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(10,55) && sec <= converteTimeToSec(11,5)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(11,25) && sec <= converteTimeToSec(11,35)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(11,55) && sec <= converteTimeToSec(12,5))){
        note = 19;
      }else if((age < 25 && sec >= converteTimeToSec(10,36) && sec <= converteTimeToSec(10,46)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(11,6) && sec <= converteTimeToSec(11,16)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(11,36) && sec <= converteTimeToSec(11,46)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(12,6) && sec <= converteTimeToSec(12,16))){
        note = 18.80;
      }else if((age < 25 && sec >= converteTimeToSec(10,47) && sec <= converteTimeToSec(10,57)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(11,17) && sec <= converteTimeToSec(11,27)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(11,47) && sec <= converteTimeToSec(11,57)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(12,17) && sec <= converteTimeToSec(12,27))){
        note = 18.60;
      }else if((age < 25 && sec >= converteTimeToSec(10,58) && sec <= converteTimeToSec(11,8)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(11,28) && sec <= converteTimeToSec(11,38)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(11,58) && sec <= converteTimeToSec(12,8)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(12,28) && sec <= converteTimeToSec(12,38))){
        note = 18.40;
      }else if((age < 25 && sec >= converteTimeToSec(11,9) && sec <= converteTimeToSec(11,19)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(11,39) && sec <= converteTimeToSec(11,49)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(12,9) && sec <= converteTimeToSec(12,19)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(12,39) && sec <= converteTimeToSec(12,49))){
        note = 18.20;
      }else if((age < 25 && sec >= converteTimeToSec(11,20) && sec <= converteTimeToSec(11,30)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(11,50) && sec <= converteTimeToSec(12,0)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(12,20) && sec <= converteTimeToSec(12,30)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(12,50) && sec <= converteTimeToSec(13,0))){
        note = 18;
      }else if((age < 25 && sec >= converteTimeToSec(11,31) && sec <= converteTimeToSec(11,36)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(12,1) && sec <= converteTimeToSec(12,6)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(12,31) && sec <= converteTimeToSec(12,36)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(13,1) && sec <= converteTimeToSec(13,6))){
        note = 17.80;
      }else if((age < 25 && sec >= converteTimeToSec(11,37) && sec <= converteTimeToSec(11,42)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(12,7) && sec <= converteTimeToSec(12,12)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(12,37) && sec <= converteTimeToSec(12,42)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(13,7) && sec <= converteTimeToSec(13,12))){
        note = 17.60;
      }else if((age < 25 && sec >= converteTimeToSec(11,43) && sec <= converteTimeToSec(11,48)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(12,13) && sec <= converteTimeToSec(12,18)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(12,43) && sec <= converteTimeToSec(12,48)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(13,13) && sec <= converteTimeToSec(13,18))){
        note = 17.40;
      }else if((age < 25 && sec >= converteTimeToSec(11,49) && sec <= converteTimeToSec(11,54)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(12,19) && sec <= converteTimeToSec(12,24)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(12,49) && sec <= converteTimeToSec(12,54)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(13,19) && sec <= converteTimeToSec(13,24))){
        note = 17.20;
      }else if((age < 25 && sec >= converteTimeToSec(11,55) && sec <= converteTimeToSec(12,0)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(12,25) && sec <= converteTimeToSec(12,30)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(12,55) && sec <= converteTimeToSec(13,0)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(13,25) && sec <= converteTimeToSec(13,30))){
        note = 17;
      }else if((age < 25 && sec >= converteTimeToSec(12,1) && sec <= converteTimeToSec(12,6)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(12,31) && sec <= converteTimeToSec(12,36)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(13,1) && sec <= converteTimeToSec(13,6)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(13,31) && sec <= converteTimeToSec(13,36))){
        note = 16.80;
      }else if((age < 25 && sec >= converteTimeToSec(12,7) && sec <= converteTimeToSec(12,12)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(12,37) && sec <= converteTimeToSec(12,42)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(13,7) && sec <= converteTimeToSec(13,12)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(13,37) && sec <= converteTimeToSec(13,42))){
        note = 16.60;
      }else if((age < 25 && sec >= converteTimeToSec(12,13) && sec <= converteTimeToSec(12,18)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(12,43) && sec <= converteTimeToSec(12,48)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(13,13) && sec <= converteTimeToSec(13,18)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(13,43) && sec <= converteTimeToSec(13,48))){
        note = 16.40;
      }else if((age < 25 && sec >= converteTimeToSec(12,19) && sec <= converteTimeToSec(12,24)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(12,49) && sec <= converteTimeToSec(12,54)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(13,19) && sec <= converteTimeToSec(13,24)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(13,49) && sec <= converteTimeToSec(13,54))){
        note = 16.20;
      }else if((age < 25 && sec >= converteTimeToSec(12,25) && sec <= converteTimeToSec(12,30)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(12,55) && sec <= converteTimeToSec(13,0)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(13,25) && sec <= converteTimeToSec(13,30)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(13,55) && sec <= converteTimeToSec(14,0))){
        note = 16;
      }else if((age < 25 && sec >= converteTimeToSec(12,31) && sec <= converteTimeToSec(12,36)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(13,1) && sec <= converteTimeToSec(13,6)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(13,31) && sec <= converteTimeToSec(13,36)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(14,1) && sec <= converteTimeToSec(14,6))){
        note = 15.80;
      }else if((age < 25 && sec >= converteTimeToSec(12,37) && sec <= converteTimeToSec(12,42)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(13,7) && sec <= converteTimeToSec(13,12)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(13,37) && sec <= converteTimeToSec(13,42)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(14,7) && sec <= converteTimeToSec(14,12))){
        note = 15.60;
      }else if((age < 25 && sec >= converteTimeToSec(12,43) && sec <= converteTimeToSec(12,48)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(13,13) && sec <= converteTimeToSec(13,18)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(13,43) && sec <= converteTimeToSec(13,48)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(14,13) && sec <= converteTimeToSec(14,18))){
        note = 15.40;
      }else if((age < 25 && sec >= converteTimeToSec(12,49) && sec <= converteTimeToSec(12,54)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(13,19) && sec <= converteTimeToSec(13,24)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(13,49) && sec <= converteTimeToSec(13,54)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(14,19) && sec <= converteTimeToSec(14,24))){
        note = 15.20;
      }else if((age < 25 && sec >= converteTimeToSec(12,55) && sec <= converteTimeToSec(13,0)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(13,25) && sec <= converteTimeToSec(13,30)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(13,55) && sec <= converteTimeToSec(14,0)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(14,25) && sec <= converteTimeToSec(14,30))){
        note = 15;
      }else if((age < 25 && sec >= converteTimeToSec(13,1) && sec <= converteTimeToSec(13,6)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(13,31) && sec <= converteTimeToSec(13,36)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(14,1) && sec <= converteTimeToSec(14,6)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(14,31) && sec <= converteTimeToSec(12,36))){
        note = 14.80;
      }else if((age < 25 && sec >= converteTimeToSec(13,7) && sec <= converteTimeToSec(13,12)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(13,37) && sec <= converteTimeToSec(13,42)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(14,7) && sec <= converteTimeToSec(14,12)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(14,37) && sec <= converteTimeToSec(12,42))){
        note = 14.60;
      }else if((age < 25 && sec >= converteTimeToSec(13,13) && sec <= converteTimeToSec(13,18)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(13,43) && sec <= converteTimeToSec(13,48)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(14,13) && sec <= converteTimeToSec(14,18)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(14,43) && sec <= converteTimeToSec(12,48))){
        note = 14.40;
      }else if((age < 25 && sec >= converteTimeToSec(13,19) && sec <= converteTimeToSec(13,24)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(13,49) && sec <= converteTimeToSec(13,54)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(14,19) && sec <= converteTimeToSec(14,24)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(14,49) && sec <= converteTimeToSec(12,54))){
        note = 14.20;
      }else if((age < 25 && sec >= converteTimeToSec(13,25) && sec <= converteTimeToSec(13,30)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(13,55) && sec <= converteTimeToSec(14,0)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(14,25) && sec <= converteTimeToSec(14,30)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(14,55) && sec <= converteTimeToSec(15,0))){
        note = 14;
      }else if((age < 25 && sec >= converteTimeToSec(13,31) && sec <= converteTimeToSec(13,36)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(14,1) && sec <= converteTimeToSec(14,6)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(14,31) && sec <= converteTimeToSec(12,36)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(15,1) && sec <= converteTimeToSec(15,6))){
        note = 13.80;
      }else if((age < 25 && sec >= converteTimeToSec(13,37) && sec <= converteTimeToSec(13,42)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(14,7) && sec <= converteTimeToSec(14,12)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(14,37) && sec <= converteTimeToSec(12,42)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(15,7) && sec <= converteTimeToSec(15,12))){
        note = 13.60;
      }else if((age < 25 && sec >= converteTimeToSec(13,43) && sec <= converteTimeToSec(13,48)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(14,13) && sec <= converteTimeToSec(14,18)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(14,43) && sec <= converteTimeToSec(12,48)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(15,13) && sec <= converteTimeToSec(15,18))){
        note = 13.40;
      }else if((age < 25 && sec >= converteTimeToSec(13,49) && sec <= converteTimeToSec(13,54)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(14,19) && sec <= converteTimeToSec(14,24)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(14,49) && sec <= converteTimeToSec(12,54)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(15,19) && sec <= converteTimeToSec(15,24))){
        note = 13.20;
      }else if((age < 25 && sec >= converteTimeToSec(13,55) && sec <= converteTimeToSec(14,0)) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(14,25) && sec <= converteTimeToSec(14,30)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(14,55) && sec <= converteTimeToSec(15,0)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(15,25) && sec <= converteTimeToSec(15,30))){
        note = 13;
      }else{
        note = 0;
      }

    }

    ptos = note *1;
    dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].note = double.parse(note.toStringAsFixed(2));
    dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].pts = double.parse(ptos.toStringAsFixed(2));
  }


   /* pista de combate */
  combatTrack(indexList, indexColumn){
    var gender = dataTableController.datas[indexList].gender;
    var age = dataTableController.datas[indexList].age;
    var varRepTiemp = dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].repTiemp!;
    int min = 0, sec = 0;
    double note = 0, ptos = 0;

    var arr = varRepTiemp.split("'");
    min = int.parse(arr[0]);
    sec = int.parse(arr[1]);

    sec = sec + (min * 60);
    
    if (gender == 0){

      if((age! < 25 && sec <= converteTimeToSec(3,45)) || (age >= 25 && age < 30 && sec <= converteTimeToSec(4,0)) || (age >= 30 && age < 35 && sec <= converteTimeToSec(4,15)) || (age >= 35 && age < 40 && sec <= converteTimeToSec(4,30))){
        note = 20;
      }else if((age < 25 && sec >= converteTimeToSec(3,46) && sec <= converteTimeToSec(3,49) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,1) && sec <= converteTimeToSec(4,4)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(4,16) && sec <= converteTimeToSec(4,19)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(4,31) && sec <= converteTimeToSec(4,37))){
        note = 19.8;
      }else if((age < 25 && sec >= converteTimeToSec(3,50) && sec <= converteTimeToSec(3,52) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,5) && sec <= converteTimeToSec(5,7)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(4,20) && sec <= converteTimeToSec(4,22)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(4,38) && sec <= converteTimeToSec(4,40))){
        note = 19.6;
      }else if((age < 25 && sec >= converteTimeToSec(3,53) && sec <= converteTimeToSec(3,55) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,8) && sec <= converteTimeToSec(5,10)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(4,23) && sec <= converteTimeToSec(4,25)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(4,41) && sec <= converteTimeToSec(4,43))){
        note = 19.4;
      }else if((age < 25 && sec >= converteTimeToSec(3,56) && sec <= converteTimeToSec(3,58) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,11) && sec <= converteTimeToSec(5,13)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,26) && sec <= converteTimeToSec(5,28)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(4,44) && sec <= converteTimeToSec(4,46))){
        note = 19.2;
      }else if((age < 25 && sec >= converteTimeToSec(3,59) && sec <= converteTimeToSec(4,1) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,14) && sec <= converteTimeToSec(4,16)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(4,29) && sec <= converteTimeToSec(4,31)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(4,47) && sec <= converteTimeToSec(4,49))){
        note = 19;
      }else if((age < 25 && sec >= converteTimeToSec(4,2) && sec <= converteTimeToSec(4,4) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,17) && sec <= converteTimeToSec(4,19)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(4,32) && sec <= converteTimeToSec(4,34)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(4,50) && sec <= converteTimeToSec(4,52))){
        note = 18.8;
      }else if((age < 25 && sec >= converteTimeToSec(4,5) && sec <= converteTimeToSec(4,7) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,20) && sec <= converteTimeToSec(4,22)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(4,35) && sec <= converteTimeToSec(4,37)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(4,53) && sec <= converteTimeToSec(4,55))){
        note = 18.6;
      }else if((age < 25 && sec >= converteTimeToSec(4,8) && sec <= converteTimeToSec(4,10) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,23) && sec <= converteTimeToSec(4,25)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(4,38) && sec <= converteTimeToSec(4,40)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(4,56) && sec <= converteTimeToSec(4,58))){
        note = 18.4;
      }else if((age < 25 && sec >= converteTimeToSec(4,11) && sec <= converteTimeToSec(4,13) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,26) && sec <= converteTimeToSec(4,28)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(4,41) && sec <= converteTimeToSec(4,43)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(4,59) && sec <= converteTimeToSec(5,1))){
        note = 18.2;
      }else if((age < 25 && sec >= converteTimeToSec(4,14) && sec <= converteTimeToSec(4,16) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,29) && sec <= converteTimeToSec(4,31)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(4,44) && sec <= converteTimeToSec(4,46)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(5,2) && sec <= converteTimeToSec(5,4))){
        note = 18;
      }else if((age < 25 && sec >= converteTimeToSec(4,17) && sec <= converteTimeToSec(4,19) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,32) && sec <= converteTimeToSec(4,34)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(4,47) && sec <= converteTimeToSec(4,49)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(5,5) && sec <= converteTimeToSec(5,7))){
        note = 17.8;
      }else if((age < 25 && sec >= converteTimeToSec(4,20) && sec <= converteTimeToSec(4,22) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,35) && sec <= converteTimeToSec(4,37)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(4,50) && sec <= converteTimeToSec(4,52)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(5,8) && sec <= converteTimeToSec(5,10))){
        note = 17.6;
      }else if((age < 25 && sec >= converteTimeToSec(4,23) && sec <= converteTimeToSec(4,25) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,38) && sec <= converteTimeToSec(4,40)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(4,53) && sec <= converteTimeToSec(4,55)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(5,11) && sec <= converteTimeToSec(5,13))){
        note = 17.4;
      }else if((age < 25 && sec >= converteTimeToSec(4,26) && sec <= converteTimeToSec(4,28) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,41) && sec <= converteTimeToSec(4,43)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(4,56) && sec <= converteTimeToSec(4,58)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(5,14) && sec <= converteTimeToSec(5,16))){
        note = 17.2;
      }else if((age < 25 && sec >= converteTimeToSec(4,29) && sec <= converteTimeToSec(4,31) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,44) && sec <= converteTimeToSec(4,46)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(4,59) && sec <= converteTimeToSec(5,1)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(5,17) && sec <= converteTimeToSec(5,19))){
        note = 17;
      }else if((age < 25 && sec >= converteTimeToSec(4,32) && sec <= converteTimeToSec(4,34) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,47) && sec <= converteTimeToSec(4,49)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,2) && sec <= converteTimeToSec(5,4)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(5,20) && sec <= converteTimeToSec(5,22))){
        note = 16.8;
      }else if((age < 25 && sec >= converteTimeToSec(4,35) && sec <= converteTimeToSec(4,37) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,50) && sec <= converteTimeToSec(4,52)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,5) && sec <= converteTimeToSec(5,7)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(5,23) && sec <= converteTimeToSec(5,25))){
        note = 16.6;
      }else if((age < 25 && sec >= converteTimeToSec(4,38) && sec <= converteTimeToSec(4,40) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,53) && sec <= converteTimeToSec(4,55)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,8) && sec <= converteTimeToSec(5,10)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(5,26) && sec <= converteTimeToSec(5,28))){
        note = 16.4;
      }else if((age < 25 && sec >= converteTimeToSec(4,41) && sec <= converteTimeToSec(4,43) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,56) && sec <= converteTimeToSec(4,58)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,11) && sec <= converteTimeToSec(5,13)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(5,29) && sec <= converteTimeToSec(5,31))){
        note = 16.2;
      }else if((age < 25 && sec >= converteTimeToSec(4,44) && sec <= converteTimeToSec(4,46) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,59) && sec <= converteTimeToSec(5,1)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,14) && sec <= converteTimeToSec(5,16)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(5,32) && sec <= converteTimeToSec(5,34))){
        note = 16;
      }else if((age < 25 && sec >= converteTimeToSec(4,47) && sec <= converteTimeToSec(4,49) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,2) && sec <= converteTimeToSec(5,4)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,17) && sec <= converteTimeToSec(5,19)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(5,35) && sec <= converteTimeToSec(5,37))){
        note = 15.8;
      }else if((age < 25 && sec >= converteTimeToSec(4,50) && sec <= converteTimeToSec(4,52) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,5) && sec <= converteTimeToSec(5,7)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,20) && sec <= converteTimeToSec(5,22)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(5,38) && sec <= converteTimeToSec(5,40))){
        note = 15.6;
      }else if((age < 25 && sec >= converteTimeToSec(4,53) && sec <= converteTimeToSec(4,55) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,8) && sec <= converteTimeToSec(5,10)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,23) && sec <= converteTimeToSec(5,25)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(5,41) && sec <= converteTimeToSec(5,43))){
        note = 15.4;
      }else if((age < 25 && sec >= converteTimeToSec(4,56) && sec <= converteTimeToSec(4,58) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,11) && sec <= converteTimeToSec(5,13)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,26) && sec <= converteTimeToSec(5,28)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(5,44) && sec <= converteTimeToSec(5,46))){
        note = 15.2;
      }else if((age < 25 && sec >= converteTimeToSec(4,59) && sec <= converteTimeToSec(5,1) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,14) && sec <= converteTimeToSec(5,16)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,29) && sec <= converteTimeToSec(5,31)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(5,47) && sec <= converteTimeToSec(5,49))){
        note = 15;
      }else if((age < 25 && sec >= converteTimeToSec(5,2) && sec <= converteTimeToSec(5,4) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,17) && sec <= converteTimeToSec(5,19)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,32) && sec <= converteTimeToSec(5,34)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(5,50) && sec <= converteTimeToSec(5,52))){
        note = 14.8;
      }else if((age < 25 && sec >= converteTimeToSec(5,5) && sec <= converteTimeToSec(5,7) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,20) && sec <= converteTimeToSec(5,22)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,35) && sec <= converteTimeToSec(5,37)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(5,53) && sec <= converteTimeToSec(5,55))){
        note = 14.6;
      }else if((age < 25 && sec >= converteTimeToSec(5,8) && sec <= converteTimeToSec(5,10) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,23) && sec <= converteTimeToSec(5,25)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,38) && sec <= converteTimeToSec(5,40)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(5,56) && sec <= converteTimeToSec(5,58))){
        note = 14.4;
      }else if((age < 25 && sec >= converteTimeToSec(5,11) && sec <= converteTimeToSec(5,13) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,26) && sec <= converteTimeToSec(5,28)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,41) && sec <= converteTimeToSec(5,43)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(5,59) && sec <= converteTimeToSec(6,1))){
        note = 14.2;
      }else if((age < 25 && sec >= converteTimeToSec(5,14) && sec <= converteTimeToSec(5,16) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,29) && sec <= converteTimeToSec(5,31)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,44) && sec <= converteTimeToSec(5,46)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(6,2) && sec <= converteTimeToSec(6,4))){
        note = 14;
      }else if((age < 25 && sec >= converteTimeToSec(5,17) && sec <= converteTimeToSec(5,19) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,32) && sec <= converteTimeToSec(5,34)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,47) && sec <= converteTimeToSec(5,49)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(6,5) && sec <= converteTimeToSec(6,7))){
        note = 13.8;
      }else if((age < 25 && sec >= converteTimeToSec(5,20) && sec <= converteTimeToSec(5,22) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,35) && sec <= converteTimeToSec(5,37)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,50) && sec <= converteTimeToSec(5,52)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(6,8) && sec <= converteTimeToSec(6,9))){
        note = 13.6;
      }else if((age < 25 && sec >= converteTimeToSec(5,23) && sec <= converteTimeToSec(5,25) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,38) && sec <= converteTimeToSec(5,40)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,53) && sec <= converteTimeToSec(5,55)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(6,10) && sec <= converteTimeToSec(6,11))){
        note = 13.4;
      }else if((age < 25 && sec >= converteTimeToSec(5,26) && sec <= converteTimeToSec(5,28) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,41) && sec <= converteTimeToSec(5,43)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,56) && sec <= converteTimeToSec(5,58)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(6,12) && sec <= converteTimeToSec(6,13))){
        note = 13.2;
      }else if((age < 25 && sec >= converteTimeToSec(5,29) && sec <= converteTimeToSec(5,30) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,44) && sec <= converteTimeToSec(5,45)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,59) && sec <= converteTimeToSec(6,0)) || (age >= 35 && age < 40 && sec >= converteTimeToSec(6,14) && sec <= converteTimeToSec(6,15))){
        note = 13;
      }else{
        note = 0;
      }
      
    }else{

      if((age! < 25 && sec <= converteTimeToSec(4,0)) || (age >= 25 && age < 30 && sec <= converteTimeToSec(4,20)) || (age >= 30 && age < 35 && sec <= converteTimeToSec(4,40))){
        note = 20;
      }else if((age < 25 && sec >= converteTimeToSec(4,1) && sec <= converteTimeToSec(4,3) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,21) && sec <= converteTimeToSec(4,23)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(4,41) && sec <= converteTimeToSec(4,43))){
        note = 19.8;
      }else if((age < 25 && sec >= converteTimeToSec(4,4) && sec <= converteTimeToSec(4,7) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,24) && sec <= converteTimeToSec(4,28)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(4,44) && sec <= converteTimeToSec(4,48))){
        note = 19.6;
      }else if((age < 25 && sec >= converteTimeToSec(4,8) && sec <= converteTimeToSec(4,10) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,29) && sec <= converteTimeToSec(4,31)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(4,49) && sec <= converteTimeToSec(4,51))){
        note = 19.4;
      }else if((age < 25 && sec >= converteTimeToSec(4,11) && sec <= converteTimeToSec(4,13) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,32) && sec <= converteTimeToSec(4,34)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(4,52) && sec <= converteTimeToSec(4,54))){
        note = 19.2;
      }else if((age < 25 && sec >= converteTimeToSec(4,14) && sec <= converteTimeToSec(4,16) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,35) && sec <= converteTimeToSec(4,37)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(4,55) && sec <= converteTimeToSec(4,58))){
        note = 19;
      }else if((age < 25 && sec >= converteTimeToSec(4,17) && sec <= converteTimeToSec(4,19) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,38) && sec <= converteTimeToSec(4,40)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(4,59) && sec <= converteTimeToSec(5,1))){
        note = 18.8;
      }else if((age < 25 && sec >= converteTimeToSec(4,20) && sec <= converteTimeToSec(4,22) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,41) && sec <= converteTimeToSec(4,43)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,2) && sec <= converteTimeToSec(5,4))){
        note = 18.6;
      }else if((age < 25 && sec >= converteTimeToSec(4,23) && sec <= converteTimeToSec(4,25) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,44) && sec <= converteTimeToSec(4,46)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,5) && sec <= converteTimeToSec(5,7))){
        note = 18.4;
      }else if((age < 25 && sec >= converteTimeToSec(4,26) && sec <= converteTimeToSec(4,28) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,47) && sec <= converteTimeToSec(4,49)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,8) && sec <= converteTimeToSec(5,10))){
        note = 18.2;
      }else if((age < 25 && sec >= converteTimeToSec(4,29) && sec <= converteTimeToSec(4,31) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,50) && sec <= converteTimeToSec(4,52)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,11) && sec <= converteTimeToSec(5,13))){
        note = 18;
      }else if((age < 25 && sec >= converteTimeToSec(4,32) && sec <= converteTimeToSec(4,34) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,53) && sec <= converteTimeToSec(4,55)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,14) && sec <= converteTimeToSec(5,16))){
        note = 17.8;
      }else if((age < 25 && sec >= converteTimeToSec(4,35) && sec <= converteTimeToSec(4,37) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,56) && sec <= converteTimeToSec(4,58)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,17) && sec <= converteTimeToSec(5,19))){
        note = 17.6;
      }else if((age < 25 && sec >= converteTimeToSec(4,38) && sec <= converteTimeToSec(4,40) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(4,59) && sec <= converteTimeToSec(5,1)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,20) && sec <= converteTimeToSec(5,22))){
        note = 17.4;
      }else if((age < 25 && sec >= converteTimeToSec(4,41) && sec <= converteTimeToSec(4,43) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,2) && sec <= converteTimeToSec(5,4)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,23) && sec <= converteTimeToSec(5,25))){
        note = 17.2;
      }else if((age < 25 && sec >= converteTimeToSec(4,44) && sec <= converteTimeToSec(4,46) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,5) && sec <= converteTimeToSec(5,7)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,26) && sec <= converteTimeToSec(5,28))){
        note = 17;
      }else if((age < 25 && sec >= converteTimeToSec(4,47) && sec <= converteTimeToSec(4,49) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,8) && sec <= converteTimeToSec(5,10)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,29) && sec <= converteTimeToSec(5,31))){
        note = 16.8;
      }else if((age < 25 && sec >= converteTimeToSec(4,50) && sec <= converteTimeToSec(4,52) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,11) && sec <= converteTimeToSec(5,13)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,32) && sec <= converteTimeToSec(5,34))){
        note = 16.6;
      }else if((age < 25 && sec >= converteTimeToSec(4,53) && sec <= converteTimeToSec(4,55) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,14) && sec <= converteTimeToSec(5,16)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,35) && sec <= converteTimeToSec(5,37))){
        note = 16.4;
      }else if((age < 25 && sec >= converteTimeToSec(4,56) && sec <= converteTimeToSec(4,58) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,17) && sec <= converteTimeToSec(5,19)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,38) && sec <= converteTimeToSec(5,40))){
        note = 16.2;
      }else if((age < 25 && sec >= converteTimeToSec(4,59) && sec <= converteTimeToSec(5,1) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,20) && sec <= converteTimeToSec(5,22)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,41) && sec <= converteTimeToSec(5,43))){
        note = 16;
      }else if((age < 25 && sec >= converteTimeToSec(5,2) && sec <= converteTimeToSec(5,4) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,23) && sec <= converteTimeToSec(5,25)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,44) && sec <= converteTimeToSec(5,46))){
        note = 15.8;
      }else if((age < 25 && sec >= converteTimeToSec(5,5) && sec <= converteTimeToSec(5,7) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,26) && sec <= converteTimeToSec(5,28)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,47) && sec <= converteTimeToSec(5,49))){
        note = 15.6;
      }else if((age < 25 && sec >= converteTimeToSec(5,8) && sec <= converteTimeToSec(5,10) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,29) && sec <= converteTimeToSec(5,31)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,50) && sec <= converteTimeToSec(5,52))){
        note = 15.4;
      }else if((age < 25 && sec >= converteTimeToSec(5,11) && sec <= converteTimeToSec(5,13) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,32) && sec <= converteTimeToSec(5,34)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,53) && sec <= converteTimeToSec(5,55))){
        note = 15.2;
      }else if((age < 25 && sec >= converteTimeToSec(5,14) && sec <= converteTimeToSec(5,16) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,35) && sec <= converteTimeToSec(5,37)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,56) && sec <= converteTimeToSec(5,58))){
        note = 15;
      }else if((age < 25 && sec >= converteTimeToSec(5,17) && sec <= converteTimeToSec(5,19) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,38) && sec <= converteTimeToSec(5,40)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(5,59) && sec <= converteTimeToSec(6,1))){
        note = 14.8;
      }else if((age < 25 && sec >= converteTimeToSec(5,20) && sec <= converteTimeToSec(5,22) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,41) && sec <= converteTimeToSec(5,43)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(6,2) && sec <= converteTimeToSec(6,4))){
        note = 14.6;
      }else if((age < 25 && sec >= converteTimeToSec(5,23) && sec <= converteTimeToSec(5,25) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,44) && sec <= converteTimeToSec(5,46)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(6,5) && sec <= converteTimeToSec(6,7))){
        note = 14.4;
      }else if((age < 25 && sec >= converteTimeToSec(5,26) && sec <= converteTimeToSec(5,28) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,47) && sec <= converteTimeToSec(5,49)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(6,8) && sec <= converteTimeToSec(6,10))){
        note = 14.2;
      }else if((age < 25 && sec >= converteTimeToSec(5,29) && sec <= converteTimeToSec(5,31) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,50) && sec <= converteTimeToSec(5,52)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(6,11) && sec <= converteTimeToSec(6,13))){
        note = 14;
      }else if((age < 25 && sec >= converteTimeToSec(5,32) && sec <= converteTimeToSec(5,34) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,53) && sec <= converteTimeToSec(5,55)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(6,14) && sec <= converteTimeToSec(6,16))){
        note = 13.8;
      }else if((age < 25 && sec >= converteTimeToSec(5,35) && sec <= converteTimeToSec(5,37) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,56) && sec <= converteTimeToSec(5,58)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(6,17) && sec <= converteTimeToSec(6,18))){
        note = 13.6;
      }else if((age < 25 && sec >= converteTimeToSec(5,38) && sec <= converteTimeToSec(5,40) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(5,59) && sec <= converteTimeToSec(6,0)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(6,19) && sec <= converteTimeToSec(6,20))){
        note = 13.4;
      }else if((age < 25 && sec >= converteTimeToSec(5,41) && sec <= converteTimeToSec(5,43) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(6,1) && sec <= converteTimeToSec(6,3)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(6,21) && sec <= converteTimeToSec(6,23))){
        note = 13.2;
      }else if((age < 25 && sec >= converteTimeToSec(5,44) && sec <= converteTimeToSec(5,45) ) || (age >= 25 && age <= 30 && sec >= converteTimeToSec(6,4) && sec <= converteTimeToSec(6,5)) || (age >= 30 && age < 35 && sec >= converteTimeToSec(6,24) && sec <= converteTimeToSec(6,25))){
        note = 13;
      }else{
        note = 0;
      }

    }

    ptos = note *3;
    dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].note = double.parse(note.toStringAsFixed(2));
    dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].pts = double.parse(ptos.toStringAsFixed(2));

  }

  /* Natacion */
  swim(indexList, indexColumn){
    var gender = dataTableController.datas[indexList].gender;
    var age = dataTableController.datas[indexList].age;
    var varRepTiemp = dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].repTiemp!;
    int min = 0, sec = 0;
    double note = 0, ptos = 0;

    var arr = varRepTiemp.split("'");
    min = int.parse(arr[0]);
    sec = int.parse(arr[1]);

    if (gender == 0){

      if((age! < 25 && min == 0 && sec <= 30) || (age >= 25 && age < 30 && min == 0 && sec <= 35) || (age >= 30 && age < 35 && min == 0 && sec <= 40) || (age >= 35 && age < 40 && min == 0 && sec <= 45)){
        note = 20;
      }else if((age < 25 && min == 0 && sec == 31) || (age >= 25 && age < 30 && min == 0 && sec == 36) || (age >= 30 && age < 35 && min == 0 && sec == 41) || (age >= 35 && age < 40 && min == 0 && sec == 46)){
        note = 19.8;
      }else if((age < 25 && min == 0 && sec == 32) || (age >= 25 && age < 30 && min == 0 && sec == 37) || (age >= 30 && age < 35 && min == 0 && sec == 42) || (age >= 35 && age < 40 && min == 0 && sec == 47)){
        note = 19.6;
      }else if((age < 25 && min == 0 && sec == 33) || (age >= 25 && age < 30 && min == 0 && sec == 38) || (age >= 30 && age < 35 && min == 0 && sec == 43) || (age >= 35 && age < 40 && min == 0 && sec == 48)){
        note = 19.4;
      }else if((age < 25 && min == 0 && sec == 34) || (age >= 25 && age < 30 && min == 0 && sec == 39) || (age >= 30 && age < 35 && min == 0 && sec == 44) || (age >= 35 && age < 40 && min == 0 && sec == 49)){
        note = 19.2;
      }else if((age < 25 && min == 0 && sec == 35) || (age >= 25 && age < 30 && min == 0 && sec == 40) || (age >= 30 && age < 35 && min == 0 && sec == 45) || (age >= 35 && age < 40 && min == 0 && sec == 50)){
        note = 19;
      }else if((age < 25 && min == 0 && sec == 36) || (age >= 25 && age < 30 && min == 0 && sec == 41) || (age >= 30 && age < 35 && min == 0 && sec == 46) || (age >= 35 && age < 40 && min == 0 && sec == 51)){
        note = 18.8;
      }else if((age < 25 && min == 0 && sec == 37) || (age >= 25 && age < 30 && min == 0 && sec == 42) || (age >= 30 && age < 35 && min == 0 && sec == 47) || (age >= 35 && age < 40 && min == 0 && sec == 52)){
        note = 18.6;
      }else if((age < 25 && min == 0 && sec == 38) || (age >= 25 && age < 30 && min == 0 && sec == 43) || (age >= 30 && age < 35 && min == 0 && sec == 48) || (age >= 35 && age < 40 && min == 0 && sec == 53)){
        note = 18.4;
      }else if((age < 25 && min == 0 && sec == 39) || (age >= 25 && age < 30 && min == 0 && sec == 44) || (age >= 30 && age < 35 && min == 0 && sec == 49) || (age >= 35 && age < 40 && min == 0 && sec == 54)){
        note = 18.2;
      }else if((age < 25 && min == 0 && sec == 40) || (age >= 25 && age < 30 && min == 0 && sec == 45) || (age >= 30 && age < 35 && min == 0 && sec == 50) || (age >= 35 && age < 40 && min == 0 && sec == 55)){
        note = 18;
      }else if((age < 25 && min == 0 && sec == 41) || (age >= 25 && age < 30 && min == 0 && sec == 46) || (age >= 30 && age < 35 && min == 0 && sec == 51) || (age >= 35 && age < 40 && min == 0 && sec == 56)){
        note = 17.8;
      }else if((age < 25 && min == 0 && sec == 42) || (age >= 25 && age < 30 && min == 0 && sec == 47) || (age >= 30 && age < 35 && min == 0 && sec == 52) || (age >= 35 && age < 40 && min == 0 && sec == 57)){
        note = 17.6;
      }else if((age < 25 && min == 0 && sec == 43) || (age >= 25 && age < 30 && min == 0 && sec == 48) || (age >= 30 && age < 35 && min == 0 && sec == 53) || (age >= 35 && age < 40 && min == 0 && sec == 58)){
        note = 17.4;
      }else if((age < 25 && min == 0 && sec == 44) || (age >= 25 && age < 30 && min == 0 && sec == 49) || (age >= 30 && age < 35 && min == 0 && sec == 54) || (age >= 35 && age < 40 && min == 0 && sec == 59)){
        note = 17.2;
      }else if((age < 25 && min == 0 && sec == 45) || (age >= 25 && age < 30 && min == 0 && sec == 50) || (age >= 30 && age < 35 && min == 0 && sec == 55) || (age >= 35 && age < 40 && min == 1 && sec == 0)){
        note = 17;
      }else if((age < 25 && min == 0 && sec == 46) || (age >= 25 && age < 30 && min == 0 && sec == 51) || (age >= 30 && age < 35 && min == 0 && sec == 56) || (age >= 35 && age < 40 && min == 1 && sec == 1)){
        note = 16.8;
      }else if((age < 25 && min == 0 && sec == 47) || (age >= 25 && age < 30 && min == 0 && sec == 52) || (age >= 30 && age < 35 && min == 0 && sec == 57) || (age >= 35 && age < 40 && min == 1 && sec == 2)){
        note = 16.6;
      }else if((age < 25 && min == 0 && sec == 48) || (age >= 25 && age < 30 && min == 0 && sec == 53) || (age >= 30 && age < 35 && min == 0 && sec == 58) || (age >= 35 && age < 40 && min == 1 && sec == 3)){
        note = 16.4;
      }else if((age < 25 && min == 0 && sec == 49) || (age >= 25 && age < 30 && min == 0 && sec == 54) || (age >= 30 && age < 35 && min == 0 && sec == 59) || (age >= 35 && age < 40 && min == 1 && sec == 4)){
        note = 16.2;
      }else if((age < 25 && min == 0 && sec == 50) || (age >= 25 && age < 30 && min == 0 && sec == 55) || (age >= 30 && age < 35 && min == 1 && sec == 0) || (age >= 35 && age < 40 && min == 1 && sec == 5)){
        note = 16;
      }else if((age < 25 && min == 0 && sec == 51) || (age >= 25 && age < 30 && min == 0 && sec == 56) || (age >= 30 && age < 35 && min == 1 && sec == 1) || (age >= 35 && age < 40 && min == 1 && sec == 6)){
        note = 15.8;
      }else if((age < 25 && min == 0 && sec == 52) || (age >= 25 && age < 30 && min == 0 && sec == 57) || (age >= 30 && age < 35 && min == 1 && sec == 2) || (age >= 35 && age < 40 && min == 1 && sec == 7)){
        note = 15.6;
      }else if((age < 25 && min == 0 && sec == 53) || (age >= 25 && age < 30 && min == 0 && sec == 58) || (age >= 30 && age < 35 && min == 1 && sec == 3) || (age >= 35 && age < 40 && min == 1 && sec == 8)){
        note = 15.4;
      }else if((age < 25 && min == 0 && sec == 54) || (age >= 25 && age < 30 && min == 0 && sec == 59) || (age >= 30 && age < 35 && min == 1 && sec == 4) || (age >= 35 && age < 40 && min == 1 && sec == 9)){
        note = 15.2;
      }else if((age < 25 && min == 0 && sec == 55) || (age >= 25 && age < 30 && min == 1 && sec == 0) || (age >= 30 && age < 35 && min == 1 && sec == 5) || (age >= 35 && age < 40 && min == 1 && sec == 10)){
        note = 15;
      }else if((age < 25 && min == 0 && sec == 56) || (age >= 25 && age < 30 && min == 1 && sec == 1) || (age >= 30 && age < 35 && min == 1 && sec == 6) || (age >= 35 && age < 40 && min == 1 && sec == 11)){
        note = 14.8;
      }else if((age < 25 && min == 0 && sec == 57) || (age >= 25 && age < 30 && min == 1 && sec == 2) || (age >= 30 && age < 35 && min == 1 && sec == 7) || (age >= 35 && age < 40 && min == 1 && sec == 12)){
        note = 14.6;
      }else if((age < 25 && min == 0 && sec == 58) || (age >= 25 && age < 30 && min == 1 && sec == 3) || (age >= 30 && age < 35 && min == 1 && sec == 8) || (age >= 35 && age < 40 && min == 1 && sec == 13)){
        note = 14.4;
      }else if((age < 25 && min == 0 && sec == 59) || (age >= 25 && age < 30 && min == 1 && sec == 4) || (age >= 30 && age < 35 && min == 1 && sec == 9) || (age >= 35 && age < 40 && min == 1 && sec == 14)){
        note = 14.2;
      }else if((age < 25 && min == 1 && sec == 0) || (age >= 25 && age < 30 && min == 1 && sec == 5) || (age >= 30 && age < 35 && min == 1 && sec == 10) || (age >= 35 && age < 40 && min == 1 && sec == 15)){
        note = 14;
      }else if((age < 25 && min == 1 && sec == 1) || (age >= 25 && age < 30 && min == 1 && sec == 6) || (age >= 30 && age < 35 && min == 1 && sec == 11) || (age >= 35 && age < 40 && min == 1 && sec == 16)){
        note = 13.8;
      }else if((age < 25 && min == 1 && sec == 2) || (age >= 25 && age < 30 && min == 1 && sec == 7) || (age >= 30 && age < 35 && min == 1 && sec == 12) || (age >= 35 && age < 40 && min == 1 && sec == 17)){
        note = 13.6;
      }else if((age < 25 && min == 1 && sec == 3) || (age >= 25 && age < 30 && min == 1 && sec == 8) || (age >= 30 && age < 35 && min == 1 && sec == 13) || (age >= 35 && age < 40 && min == 1 && sec == 18)){
        note = 13.4;
      }else if((age < 25 && min == 1 && sec == 4) || (age >= 25 && age < 30 && min == 1 && sec == 9) || (age >= 30 && age < 35 && min == 1 && sec == 14) || (age >= 35 && age < 40 && min == 1 && sec == 19)){
        note = 13.2;
      }else if((age < 25 && min == 1 && sec == 5) || (age >= 25 && age < 30 && min == 1 && sec == 10) || (age >= 30 && age < 35 && min == 1 && sec == 15) || (age >= 35 && age < 40 && min == 1 && sec == 20)){
        note = 13;
      }else{
        note = 0;
      }
      
    }else{

      if((age! < 25 && min == 0 && sec <= 40) || (age >= 25 && age < 30 && min == 0 && sec <= 45) || (age >= 30 && age < 35 && min == 0 && sec <= 50) || (age >= 35 && age < 40 && min == 0 && sec <= 27)){
        note = 20;
      }else if((age < 25 && min == 0 && sec == 41) || (age >= 25 && age < 30 && min == 0 && sec == 46) || (age >= 30 && age < 35 && min == 0 && sec == 51)){
        note = 19.8;
      }else if((age < 25 && min == 0 && sec == 42) || (age >= 25 && age < 30 && min == 0 && sec == 47) || (age >= 30 && age < 35 && min == 0 && sec == 52) || (age >= 35 && age < 40 && min == 0 && sec == 28)){
        note = 19.6;
      }else if((age < 25 && min == 0 && sec == 43) || (age >= 25 && age < 30 && min == 0 && sec == 48) || (age >= 30 && age < 35 && min == 0 && sec == 53)){
        note = 19.4;
      }else if((age < 25 && min == 0 && sec == 44) || (age >= 25 && age < 30 && min == 0 && sec == 49) || (age >= 30 && age < 35 && min == 0 && sec == 54) || (age >= 35 && age < 40 && min == 0 && sec == 29)){
        note = 19.2;
      }else if((age < 25 && min == 0 && sec == 45) || (age >= 25 && age < 30 && min == 0 && sec == 50) || (age >= 30 && age < 35 && min == 0 && sec == 55)){
        note = 19;
      }else if((age < 25 && min == 0 && sec == 46) || (age >= 25 && age < 30 && min == 0 && sec == 51) || (age >= 30 && age < 35 && min == 0 && sec == 56) || (age >= 35 && age < 40 && min == 0 && sec == 30)){
        note = 18.8;
      }else if((age < 25 && min == 0 && sec == 47) || (age >= 25 && age < 30 && min == 0 && sec == 52) || (age >= 30 && age < 35 && min == 0 && sec == 57)){
        note = 18.6;
      }else if((age < 25 && min == 0 && sec == 48) || (age >= 25 && age < 30 && min == 0 && sec == 53) || (age >= 30 && age < 35 && min == 0 && sec == 58) || (age >= 35 && age < 40 && min == 0 && sec == 31)){
        note = 18.4;
      }else if((age < 25 && min == 0 && sec == 49) || (age >= 25 && age < 30 && min == 0 && sec == 54) || (age >= 30 && age < 35 && min == 0 && sec == 59)){
        note = 18.2;
      }else if((age < 25 && min == 0 && sec == 50) || (age >= 25 && age < 30 && min == 0 && sec == 55) || (age >= 30 && age < 35 && min == 1 && sec == 0) || (age >= 35 && age < 40 && min == 0 && sec == 32)){
        note = 18;
      }else if((age < 25 && min == 0 && sec == 51) || (age >= 25 && age < 30 && min == 0 && sec == 56) || (age >= 30 && age < 35 && min == 1 && sec == 1)){
        note = 17.8;
      }else if((age < 25 && min == 0 && sec == 52) || (age >= 25 && age < 30 && min == 0 && sec == 57) || (age >= 30 && age < 35 && min == 1 && sec == 2) || (age >= 35 && age < 40 && min == 0 && sec == 33)){
        note = 17.6;
      }else if((age < 25 && min == 0 && sec == 53) || (age >= 25 && age < 30 && min == 0 && sec == 58) || (age >= 30 && age < 35 && min == 1 && sec == 3)){
        note = 17.4;
      }else if((age < 25 && min == 0 && sec == 54) || (age >= 25 && age < 30 && min == 0 && sec == 59) || (age >= 30 && age < 35 && min == 1 && sec == 4) || (age >= 35 && age < 40 && min == 0 && sec == 34)){
        note = 17.2;
      }else if((age < 25 && min == 0 && sec == 55) || (age >= 25 && age < 30 && min == 1 && sec == 0) || (age >= 30 && age < 35 && min == 1 && sec == 5) ){
        note = 17;
      }else if((age < 25 && min == 0 && sec == 56) || (age >= 25 && age < 30 && min == 1 && sec == 1) || (age >= 30 && age < 35 && min == 1 && sec == 6) || (age >= 35 && age < 40 && min == 0 && sec == 35)){
        note = 16.8;
      }else if((age < 25 && min == 0 && sec == 57) || (age >= 25 && age < 30 && min == 1 && sec == 2) || (age >= 30 && age < 35 && min == 1 && sec == 7)){
        note = 16.6;
      }else if((age < 25 && min == 0 && sec == 58) || (age >= 25 && age < 30 && min == 1 && sec == 3) || (age >= 30 && age < 35 && min == 1 && sec == 8) || (age >= 35 && age < 40 && min == 0 && sec == 36)){
        note = 16.4;
      }else if((age < 25 && min == 0 && sec == 59) || (age >= 25 && age < 30 && min == 1 && sec == 4) || (age >= 30 && age < 35 && min == 1 && sec == 9)){
        note = 16.2;
      }else if((age < 25 && min == 1 && sec == 0) || (age >= 25 && age < 30 && min == 1 && sec == 5) || (age >= 30 && age < 35 && min == 1 && sec == 10) || (age >= 35 && age < 40 && min == 0 && sec == 37)){
        note = 16;
      }else if((age < 25 && min == 1 && sec == 1) || (age >= 25 && age < 30 && min == 1 && sec == 6) || (age >= 30 && age < 35 && min == 1 && sec == 11)){
        note = 15.8;
      }else if((age < 25 && min == 1 && sec == 2) || (age >= 25 && age < 30 && min == 1 && sec == 7) || (age >= 30 && age < 35 && min == 1 && sec == 12) || (age >= 35 && age < 40 && min == 0 && sec == 38)){
        note = 15.6;
      }else if((age < 25 && min == 1 && sec == 3) || (age >= 25 && age < 30 && min == 1 && sec == 8) || (age >= 30 && age < 35 && min == 1 && sec == 13)){
        note = 15.4;
      }else if((age < 25 && min == 1 && sec == 4) || (age >= 25 && age < 30 && min == 1 && sec == 9) || (age >= 30 && age < 35 && min == 1 && sec == 14) || (age >= 35 && age < 40 && min == 0 && sec == 39)){
        note = 15.2;
      }else if((age < 25 && min == 1 && sec == 5) || (age >= 25 && age < 30 && min == 1 && sec == 10) || (age >= 30 && age < 35 && min == 1 && sec == 15)){
        note = 15;
      }else if((age < 25 && min == 1 && sec == 6) || (age >= 25 && age < 30 && min == 1 && sec == 11) || (age >= 30 && age < 35 && min == 1 && sec == 16) || (age >= 35 && age < 40 && min == 0 && sec == 40)){
        note = 14.8;
      }else if((age < 25 && min == 1 && sec == 7) || (age >= 25 && age < 30 && min == 1 && sec == 12) || (age >= 30 && age < 35 && min == 1 && sec == 17)){
        note = 14.6;
      }else if((age < 25 && min == 1 && sec == 8) || (age >= 25 && age < 30 && min == 1 && sec == 13) || (age >= 30 && age < 35 && min == 1 && sec == 18) || (age >= 35 && age < 40 && min == 0 && sec == 41)){
        note = 14.4;
      }else if((age < 25 && min == 1 && sec == 9) || (age >= 25 && age < 30 && min == 1 && sec == 14) || (age >= 30 && age < 35 && min == 1 && sec == 19)){
        note = 14.2;
      }else if((age < 25 && min == 1 && sec == 10) || (age >= 25 && age < 30 && min == 1 && sec == 15) || (age >= 30 && age < 35 && min == 1 && sec == 20) || (age >= 35 && age < 40 && min == 0 && sec == 42)){
        note = 14;
      }else if((age < 25 && min == 1 && sec == 11) || (age >= 25 && age < 30 && min == 1 && sec == 16) || (age >= 30 && age < 35 && min == 1 && sec == 21)){
        note = 13.8;
      }else if((age < 25 && min == 1 && sec == 12) || (age >= 25 && age < 30 && min == 1 && sec == 17) || (age >= 30 && age < 35 && min == 1 && sec == 22) || (age >= 35 && age < 40 && min == 0 && sec == 43)){
        note = 13.6;
      }else if((age < 25 && min == 1 && sec == 13) || (age >= 25 && age < 30 && min == 1 && sec == 18) || (age >= 30 && age < 35 && min == 1 && sec == 23)){
        note = 13.4;
      }else if((age < 25 && min == 1 && sec == 14) || (age >= 25 && age < 30 && min == 1 && sec == 19) || (age >= 30 && age < 35 && min == 1 && sec == 24) || (age >= 35 && age < 40 && min == 0 && sec == 44)){
        note = 13.2;
      }else if((age < 25 && min == 1 && sec == 15) || (age >= 25 && age < 30 && min == 1 && sec == 20) || (age >= 30 && age < 35 && min == 1 && sec == 25) || (age >= 35 && age < 40 && min == 0 && sec == 45)){
        note = 13;
      }else{
        note = 0;
      }

    }

    ptos = note *2;
    dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].note = double.parse(note.toStringAsFixed(2));
    dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].pts = double.parse(ptos.toStringAsFixed(2));

  }
}