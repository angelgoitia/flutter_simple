import 'package:flutter_simple/controller/dataTableController.dart';

import 'package:get/get.dart';

class CalculateController extends GetxController {

  DataTableController dataTableController = Get.put(DataTableController()); 

  /* Barras y Suspensión */
  barsSuspension(indexList, indexColumn){
    var gender = dataTableController.datas[indexList].gender;
    var age = dataTableController.datas[indexList].age;
    var varRepTiemp;
    int min = 0;
    double note = 0, ptos = 0;

    if(gender == 0)
      varRepTiemp = double.parse(dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].repTiemp!);
    else{
      varRepTiemp = dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].repTiemp;
      var arr = varRepTiemp.split("'");
      min = int.parse(arr[0]);
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
    dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].note = note;
    dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].pts = ptos;
  }

  abs(indexList, indexColumn){
    var gender = dataTableController.datas[indexList].gender;
    var age = dataTableController.datas[indexList].age;
    var varRepTiemp;
    double note = 0, ptos = 0;

    if (gender == 0){

      if((age! < 25 && varRepTiemp == 64) || (age >= 25 && age < 30 && varRepTiemp == 62) || (age >= 30 && age < 35 && varRepTiemp == 60) || (age >= 35 && age < 40 && varRepTiemp == 58)){
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

      if((age! < 25 && varRepTiemp == 56) || (age >= 25 && age < 30 && varRepTiemp == 54) || (age >= 30 && age < 35 && varRepTiemp == 52) || (age >= 35 && age < 40 && varRepTiemp == 50)){
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
    dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].note = note;
    dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].pts = ptos;
  }


  /* Carrera */
  career(indexList, indexColumn){
    var gender = dataTableController.datas[indexList].gender;
    var age = dataTableController.datas[indexList].age;
    var varRepTiemp;
    int min = 0, sec=0;
    double note = 0, ptos = 0;

    if(gender == 0)
      varRepTiemp = double.parse(dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].repTiemp!);
    else{
      varRepTiemp = dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].repTiemp;
      var arr = varRepTiemp.split("'");
      min = int.parse(arr[0]);
      sec = int.parse(arr[1]);
    }

    if (gender == 0){

      if((age! < 25 && min <= 8 && sec <= 30) || (age >= 25 && age < 30 && min <= 9 && sec <= 0) || (age >= 30 && age < 35 && min <= 9 && sec <= 30) || (age >= 35 && age < 40 && min <= 10 && sec <= 0)){
        note = 20;
      }else if((age < 25 && min >= 8 && sec >= 31 && min <= 8 && sec <= 36 ) || (age >= 25 && age <= 30 && min >= 9 && sec >= 1 && min <= 9 && sec <= 6) || (age >= 30 && age < 35 && min >= 9 && sec >= 31 && min <= 9 && sec <= 36) || (age >= 35 && age < 40 && min >= 10 && sec >= 1 && min <= 10 && sec <= 6)){
        note = 19.80;
      }else if((age < 25 && min >= 8 && sec >= 37 && min <= 8 && sec <= 42 ) || (age >= 25 && age <= 30 && min >= 9 && sec >= 7 && min <= 9 && sec <= 12) || (age >= 30 && age < 35 && min >= 9 && sec >= 37 && min <= 9 && sec <= 42) || (age >= 35 && age < 40 && min >= 10 && sec >= 7 && min <= 10 && sec <= 12)){
        note = 19.60;
      }else if((age < 25 && min >= 8 && sec >= 43 && min <= 8 && sec <= 48 ) || (age >= 25 && age <= 30 && min >= 9 && sec >= 13 && min <= 9 && sec <= 18) || (age >= 30 && age < 35 && min >= 9 && sec >= 43 && min <= 9 && sec <= 48) || (age >= 35 && age < 40 && min >= 10 && sec >= 13 && min <= 10 && sec <= 18)){
        note = 19.40;
      }else if((age < 25 && min >= 8 && sec >= 49 && min <= 8 && sec <= 54 ) || (age >= 25 && age <= 30 && min >= 9 && sec >= 19 && min <= 9 && sec <= 24) || (age >= 30 && age < 35 && min >= 9 && sec >= 49 && min <= 9 && sec <= 54) || (age >= 35 && age < 40 && min >= 10 && sec >= 19 && min <= 10 && sec <= 24)){
        note = 19.20;
      }else if((age < 25 && min >= 8 && sec >= 55 && min <= 9 && sec <= 5 ) || (age >= 25 && age <= 30 && min >= 9 && sec >= 25 && min <= 9 && sec <= 35) || (age >= 30 && age < 35 && min >= 9 && sec >= 55 && min <= 10 && sec <= 5) || (age >= 35 && age < 40 && min >= 10 && sec >= 25 && min <= 10 && sec <= 35)){
        note = 19;
      }else if((age < 25 && min >= 9 && sec >= 6 && min <= 9 && sec <= 16 ) || (age >= 25 && age <= 30 && min >= 9 && sec >= 36 && min <= 9 && sec <= 46) || (age >= 30 && age < 35 && min >= 10 && sec >= 6 && min <= 10 && sec <= 16) || (age >= 35 && age < 40 && min >= 10 && sec >= 36 && min <= 10 && sec <= 46)){
        note = 18.80;
      }else if((age < 25 && min >= 9 && sec >= 17 && min <= 9 && sec <= 27 ) || (age >= 25 && age <= 30 && min >= 9 && sec >= 47 && min <= 9 && sec <= 57) || (age >= 30 && age < 35 && min >= 10 && sec >= 17 && min <= 11 && sec <= 27) || (age >= 35 && age < 40 && min >= 10 && sec >= 47 && min <= 10 && sec <= 57)){
        note = 18.60;
      }else if((age < 25 && min >= 9 && sec >= 28 && min <= 9 && sec <= 38 ) || (age >= 25 && age <= 30 && min >= 9 && sec >= 58 && min <= 10 && sec <= 8) || (age >= 30 && age < 35 && min >= 10 && sec >= 28 && min <= 10 && sec <= 38) || (age >= 35 && age < 40 && min >= 10 && sec >= 58 && min <= 11 && sec <= 8)){
        note = 18.40;
      }else if((age < 25 && min >= 9 && sec >= 39 && min <= 9 && sec <= 49 ) || (age >= 25 && age <= 30 && min >= 10 && sec >= 9 && min <= 10 && sec <= 19) || (age >= 30 && age < 35 && min >= 10 && sec >= 39 && min <= 10 && sec <= 49) || (age >= 35 && age < 40 && min >= 11 && sec >= 9 && min <= 11 && sec <= 19)){
        note = 18.20;
      }else if((age < 25 && min >= 9 && sec >= 50 && min <= 10 && sec <= 0 ) || (age >= 25 && age <= 30 && min >= 10 && sec >= 20 && min <= 10 && sec <= 30) || (age >= 30 && age < 35 && min >= 10 && sec >= 50 && min <= 11 && sec <= 0) || (age >= 35 && age < 40 && min >= 11 && sec >= 20 && min <= 11 && sec <= 30)){
        note = 18;
      }else if((age < 25 && min >= 10 && sec >= 1 && min <= 10 && sec <= 6 ) || (age >= 25 && age <= 30 && min >= 10 && sec >= 31 && min <= 10 && sec <= 36) || (age >= 30 && age < 35 && min >= 11 && sec >= 1 && min <= 11 && sec <= 6) || (age >= 35 && age < 40 && min >= 11 && sec >= 31 && min <= 11 && sec <= 36)){
        note = 17.80;
      }else if((age < 25 && min >= 10 && sec >= 7 && min <= 9 && sec <= 12 ) || (age >= 25 && age <= 30 && min >= 10 && sec >= 37 && min <= 10 && sec <= 42) || (age >= 30 && age < 35 && min >= 11 && sec >= 7 && min <= 11 && sec <= 12) || (age >= 35 && age < 40 && min >= 11 && sec >= 37 && min <= 11 && sec <= 42)){
        note = 17.60;
      }else if((age < 25 && min >= 10 && sec >= 13 && min <= 10 && sec <= 18 ) || (age >= 25 && age <= 30 && min >= 10 && sec >= 43 && min <= 10 && sec <= 48) || (age >= 30 && age < 35 && min >= 11 && sec >= 13 && min <= 11 && sec <= 18) || (age >= 35 && age < 40 && min >= 11 && sec >= 43 && min <= 11 && sec <= 48)){
        note = 17.40;
      }else if((age < 25 && min >= 10 && sec >= 19 && min <= 10 && sec <= 24 ) || (age >= 25 && age <= 30 && min >= 10 && sec >= 49 && min <= 10 && sec <= 54) || (age >= 30 && age < 35 && min >= 11 && sec >= 19 && min <= 11 && sec <= 24) || (age >= 35 && age < 40 && min >= 11 && sec >= 49 && min <= 11 && sec <= 54)){
        note = 17.20;
      }else if((age < 25 && min >= 10 && sec >= 25 && min <= 10 && sec <= 30 ) || (age >= 25 && age <= 30 && min >= 10 && sec >= 55 && min <= 11 && sec <= 0) || (age >= 30 && age < 35 && min >= 11 && sec >= 25 && min <= 11 && sec <= 30) || (age >= 35 && age < 40 && min >= 11 && sec >= 55 && min <= 12 && sec <= 0)){
        note = 17;
      }else if((age < 25 && min >= 10 && sec >= 31 && min <= 10 && sec <= 36 ) || (age >= 25 && age <= 30 && min >= 11 && sec >= 1 && min <= 11 && sec <= 6) || (age >= 30 && age < 35 && min >= 11 && sec >= 31 && min <= 11 && sec <= 36) || (age >= 35 && age < 40 && min >= 12 && sec >= 1 && min <= 11 && sec <= 6)){
        note = 16.80;
      }else if((age < 25 && min >= 10 && sec >= 37 && min <= 10 && sec <= 42 ) || (age >= 25 && age <= 30 && min >= 11 && sec >= 7 && min <= 11 && sec <= 12) || (age >= 30 && age < 35 && min >= 11 && sec >= 37 && min <= 11 && sec <= 42) || (age >= 35 && age < 40 && min >= 12 && sec >= 7 && min <= 11 && sec <= 12)){
        note = 16.60;
      }else if((age < 25 && min >= 10 && sec >= 43 && min <= 10 && sec <= 48 ) || (age >= 25 && age <= 30 && min >= 11 && sec >= 13 && min <= 11 && sec <= 18) || (age >= 30 && age < 35 && min >= 11 && sec >= 43 && min <= 11 && sec <= 48) || (age >= 35 && age < 40 && min >= 12 && sec >= 13 && min <= 11 && sec <= 18)){
        note = 16.40;
      }else if((age < 25 && min >= 10 && sec >= 49 && min <= 10 && sec <= 54 ) || (age >= 25 && age <= 30 && min >= 11 && sec >= 19 && min <= 11 && sec <= 24) || (age >= 30 && age < 35 && min >= 11 && sec >= 49 && min <= 11 && sec <= 54) || (age >= 35 && age < 40 && min >= 12 && sec >= 19 && min <= 11 && sec <= 24)){
        note = 16.20;
      }else if((age < 25 && min >= 10 && sec >= 55 && min <= 10 && sec <= 0 ) || (age >= 25 && age <= 30 && min >= 11 && sec >= 25 && min <= 11 && sec <= 30) || (age >= 30 && age < 35 && min >= 11 && sec >= 55 && min <= 12 && sec <= 0) || (age >= 35 && age < 40 && min >= 12 && sec >= 25 && min <= 12 && sec <= 30)){
        note = 16;
      }else if((age < 25 && min >= 11 && sec >= 1 && min <= 11 && sec <= 6 ) || (age >= 25 && age <= 30 && min >= 11 && sec >= 31 && min <= 11 && sec <= 36) || (age >= 30 && age < 35 && min >= 12 && sec >= 1 && min <= 12 && sec <= 6) || (age >= 35 && age < 40 && min >= 12 && sec >= 31 && min <= 12 && sec <= 36)){
        note = 15.80;
      }else if((age < 25 && min >= 11 && sec >= 7 && min <= 11 && sec <= 12 ) || (age >= 25 && age <= 30 && min >= 11 && sec >= 37 && min <= 11 && sec <= 42) || (age >= 30 && age < 35 && min >= 12 && sec >= 7 && min <= 12 && sec <= 12) || (age >= 35 && age < 40 && min >= 12 && sec >= 37 && min <= 12 && sec <= 42)){
        note = 15.60;
      }else if((age < 25 && min >= 11 && sec >= 13 && min <= 11 && sec <= 18 ) || (age >= 25 && age <= 30 && min >= 11 && sec >= 43 && min <= 11 && sec <= 48) || (age >= 30 && age < 35 && min >= 12 && sec >= 13 && min <= 12 && sec <= 18) || (age >= 35 && age < 40 && min >= 12 && sec >= 43 && min <= 12 && sec <= 48)){
        note = 15.40;
      }else if((age < 25 && min >= 11 && sec >= 19 && min <= 11 && sec <= 24 ) || (age >= 25 && age <= 30 && min >= 11 && sec >= 49 && min <= 11 && sec <= 54) || (age >= 30 && age < 35 && min >= 12 && sec >= 19 && min <= 12 && sec <= 24) || (age >= 35 && age < 40 && min >= 12 && sec >= 49 && min <= 12 && sec <= 54)){
        note = 15.20;
      }else if((age < 25 && min >= 11 && sec >= 25 && min <= 11 && sec <= 30 ) || (age >= 25 && age <= 30 && min >= 11 && sec >= 55 && min <= 12 && sec <= 0) || (age >= 30 && age < 35 && min >= 12 && sec >= 25 && min <= 12 && sec <= 30) || (age >= 35 && age < 40 && min >= 12 && sec >= 55 && min <= 13 && sec <= 0)){
        note = 15;
      }else if((age < 25 && min >= 11 && sec >= 31 && min <= 11 && sec <= 36 ) || (age >= 25 && age <= 30 && min >= 12 && sec >= 1 && min <= 12 && sec <= 6) || (age >= 30 && age < 35 && min >= 12 && sec >= 31 && min <= 12 && sec <= 36) || (age >= 35 && age < 40 && min >= 13 && sec >= 1 && min <= 13 && sec <= 6)){
        note = 14.80;
      }else if((age < 25 && min >= 11 && sec >= 37 && min <= 11 && sec <= 42 ) || (age >= 25 && age <= 30 && min >= 12 && sec >= 7 && min <= 12 && sec <= 12) || (age >= 30 && age < 35 && min >= 12 && sec >= 37 && min <= 12 && sec <= 42) || (age >= 35 && age < 40 && min >= 13 && sec >= 7 && min <= 13 && sec <= 12)){
        note = 14.60;
      }else if((age < 25 && min >= 11 && sec >= 43 && min <= 11 && sec <= 48 ) || (age >= 25 && age <= 30 && min >= 12 && sec >= 13 && min <= 12 && sec <= 18) || (age >= 30 && age < 35 && min >= 12 && sec >= 43 && min <= 12 && sec <= 48) || (age >= 35 && age < 40 && min >= 13 && sec >= 13 && min <= 13 && sec <= 18)){
        note = 14.40;
      }else if((age < 25 && min >= 11 && sec >= 49 && min <= 11 && sec <= 54 ) || (age >= 25 && age <= 30 && min >= 12 && sec >= 19 && min <= 12 && sec <= 24) || (age >= 30 && age < 35 && min >= 12 && sec >= 49 && min <= 12 && sec <= 54) || (age >= 35 && age < 40 && min >= 13 && sec >= 19 && min <= 13 && sec <= 24)){
        note = 14.20;
      }else if((age < 25 && min >= 11 && sec >= 55 && min <= 12 && sec <= 0 ) || (age >= 25 && age <= 30 && min >= 12 && sec >= 25 && min <= 12 && sec <= 30) || (age >= 30 && age < 35 && min >= 12 && sec >= 55 && min <= 13 && sec <= 0) || (age >= 35 && age < 40 && min >= 13 && sec >= 25 && min <= 13 && sec <= 30)){
        note = 14;
      }else if((age < 25 && min >= 12 && sec >= 1 && min <= 12 && sec <= 6 ) || (age >= 25 && age <= 30 && min >= 12 && sec >= 31 && min <= 12 && sec <= 36) || (age >= 30 && age < 35 && min >= 13 && sec >= 1 && min <= 13 && sec <= 6) || (age >= 35 && age < 40 && min >= 13 && sec >= 31 && min <= 13 && sec <= 36)){
        note = 13.80;
      }else if((age < 25 && min >= 12 && sec >= 7 && min <= 12 && sec <= 12 ) || (age >= 25 && age <= 30 && min >= 12 && sec >= 37 && min <= 12 && sec <= 42) || (age >= 30 && age < 35 && min >= 13 && sec >= 7 && min <= 13 && sec <= 12) || (age >= 35 && age < 40 && min >= 13 && sec >= 37 && min <= 13 && sec <= 42)){
        note = 13.60;
      }else if((age < 25 && min >= 12 && sec >= 13 && min <= 12 && sec <= 18 ) || (age >= 25 && age <= 30 && min >= 12 && sec >= 43 && min <= 12 && sec <= 48) || (age >= 30 && age < 35 && min >= 13 && sec >= 13 && min <= 13 && sec <= 18) || (age >= 35 && age < 40 && min >= 13 && sec >= 43 && min <= 13 && sec <= 48)){
        note = 13.40;
      }else if((age < 25 && min >= 12 && sec >= 19 && min <= 12 && sec <= 24 ) || (age >= 25 && age <= 30 && min >= 12 && sec >= 49 && min <= 12 && sec <= 54) || (age >= 30 && age < 35 && min >= 13 && sec >= 19 && min <= 13 && sec <= 24) || (age >= 35 && age < 40 && min >= 13 && sec >= 49 && min <= 13 && sec <= 54)){
        note = 13.20;
      }else if((age < 25 && min >= 12 && sec >= 25 && min <= 12 && sec <= 30 ) || (age >= 25 && age <= 30 && min >= 12 && sec >= 55 && min <= 13 && sec <= 0) || (age >= 30 && age < 35 && min >= 13 && sec >= 25 && min <= 13 && sec <= 30) || (age >= 35 && age < 40 && min >= 13 && sec >= 55 && min <= 14 && sec <= 0)){
        note = 13;
      }else{
        note = 0;
      }
      
    }else{

      if((age! < 25 && min <= 10 && sec <= 30) || (age >= 25 && age < 30 && min <= 10 && sec <= 30) || (age >= 30 && age < 35 && min <= 11 && sec <= 30) || (age >= 35 && age < 40 && min <= 12 && sec <= 30)){
        note = 20;
      }else if((age < 25 && min >= 10 && sec >= 1 && min <= 10 && sec <= 6 ) || (age >= 25 && age <= 30 && min >= 10 && sec >= 31 && min <= 10 && sec <= 36) || (age >= 30 && age < 35 && min >= 11 && sec >= 1 && min <= 11 && sec <= 6) || (age >= 35 && age < 40 && min >= 11 && sec >= 31 && min <= 11 && sec <= 36)){
        note = 19.80;
      }else if((age < 25 && min >= 10 && sec >= 7 && min <= 10 && sec <= 12 ) || (age >= 25 && age <= 30 && min >= 10 && sec >= 37 && min <= 10 && sec <= 42) || (age >= 30 && age < 35 && min >= 11 && sec >= 7 && min <= 11 && sec <= 12) || (age >= 35 && age < 40 && min >= 11 && sec >= 37 && min <= 11 && sec <= 42)){
        note = 19.60;
      }else if((age < 25 && min >= 10 && sec >= 13 && min <= 10 && sec <= 18 ) || (age >= 25 && age <= 30 && min >= 10 && sec >= 43 && min <= 10 && sec <= 48) || (age >= 30 && age < 35 && min >= 11 && sec >= 13 && min <= 11 && sec <= 18) || (age >= 35 && age < 40 && min >= 11 && sec >= 43 && min <= 11 && sec <= 48)){
        note = 19.40;
      }else if((age < 25 && min >= 10 && sec >= 19 && min <= 10 && sec <= 24 ) || (age >= 25 && age <= 30 && min >= 10 && sec >= 49 && min <= 10 && sec <= 54) || (age >= 30 && age < 35 && min >= 11 && sec >= 19 && min <= 11 && sec <= 24) || (age >= 35 && age < 40 && min >= 11 && sec >= 49 && min <= 11 && sec <= 54)){
        note = 19.20;
      }else if((age < 25 && min >= 10 && sec >= 25 && min <= 10 && sec <= 35 ) || (age >= 25 && age <= 30 && min >= 10 && sec >= 55 && min <= 11 && sec <= 5) || (age >= 30 && age < 35 && min >= 11 && sec >= 25 && min <= 11 && sec <= 35) || (age >= 35 && age < 40 && min >= 11 && sec >= 55 && min <= 12 && sec <= 5)){
        note = 19;
      }else if((age < 25 && min >= 10 && sec >= 36 && min <= 10 && sec <= 46 ) || (age >= 25 && age <= 30 && min >= 11 && sec >= 6 && min <= 11 && sec <= 16) || (age >= 30 && age < 35 && min >= 11 && sec >= 36 && min <= 11 && sec <= 46) || (age >= 35 && age < 40 && min >= 12 && sec >= 6 && min <= 12 && sec <= 16)){
        note = 18.80;
      }else if((age < 25 && min >= 10 && sec >= 47 && min <= 10 && sec <= 57 ) || (age >= 25 && age <= 30 && min >= 11 && sec >= 17 && min <= 11 && sec <= 27) || (age >= 30 && age < 35 && min >= 11 && sec >= 47 && min <= 11 && sec <= 57) || (age >= 35 && age < 40 && min >= 12 && sec >= 17 && min <= 12 && sec <= 27)){
        note = 18.60;
      }else if((age < 25 && min >= 10 && sec >= 58 && min <= 11 && sec <= 8 ) || (age >= 25 && age <= 30 && min >= 11 && sec >= 28 && min <= 11 && sec <= 38) || (age >= 30 && age < 35 && min >= 11 && sec >= 58 && min <= 12 && sec <= 8) || (age >= 35 && age < 40 && min >= 12 && sec >= 28 && min <= 12 && sec <= 38)){
        note = 18.40;
      }else if((age < 25 && min >= 11 && sec >= 9 && min <= 11 && sec <= 19 ) || (age >= 25 && age <= 30 && min >= 11 && sec >= 39 && min <= 11 && sec <= 49) || (age >= 30 && age < 35 && min >= 12 && sec >= 9 && min <= 12 && sec <= 19) || (age >= 35 && age < 40 && min >= 12 && sec >= 39 && min <= 12 && sec <= 49)){
        note = 18.20;
      }else if((age < 25 && min >= 11 && sec >= 20 && min <= 11 && sec <= 30 ) || (age >= 25 && age <= 30 && min >= 11 && sec >= 50 && min <= 12 && sec <= 0) || (age >= 30 && age < 35 && min >= 12 && sec >= 20 && min <= 12 && sec <= 30) || (age >= 35 && age < 40 && min >= 12 && sec >= 50 && min <= 13 && sec <= 0)){
        note = 18;
      }else if((age < 25 && min >= 11 && sec >= 31 && min <= 11 && sec <= 36 ) || (age >= 25 && age <= 30 && min >= 12 && sec >= 1 && min <= 12 && sec <= 6) || (age >= 30 && age < 35 && min >= 12 && sec >= 31 && min <= 12 && sec <= 36) || (age >= 35 && age < 40 && min >= 13 && sec >= 1 && min <= 13 && sec <= 6)){
        note = 17.80;
      }else if((age < 25 && min >= 11 && sec >= 37 && min <= 11 && sec <= 42 ) || (age >= 25 && age <= 30 && min >= 12 && sec >= 7 && min <= 12 && sec <= 12) || (age >= 30 && age < 35 && min >= 12 && sec >= 37 && min <= 12 && sec <= 42) || (age >= 35 && age < 40 && min >= 13 && sec >= 7 && min <= 13 && sec <= 12)){
        note = 17.60;
      }else if((age < 25 && min >= 11 && sec >= 43 && min <= 11 && sec <= 48 ) || (age >= 25 && age <= 30 && min >= 12 && sec >= 13 && min <= 12 && sec <= 18) || (age >= 30 && age < 35 && min >= 12 && sec >= 43 && min <= 12 && sec <= 48) || (age >= 35 && age < 40 && min >= 13 && sec >= 13 && min <= 13 && sec <= 18)){
        note = 17.40;
      }else if((age < 25 && min >= 11 && sec >= 49 && min <= 11 && sec <= 54 ) || (age >= 25 && age <= 30 && min >= 12 && sec >= 19 && min <= 12 && sec <= 24) || (age >= 30 && age < 35 && min >= 12 && sec >= 49 && min <= 12 && sec <= 54) || (age >= 35 && age < 40 && min >= 13 && sec >= 19 && min <= 13 && sec <= 24)){
        note = 17.20;
      }else if((age < 25 && min >= 11 && sec >= 55 && min <= 12 && sec <= 0 ) || (age >= 25 && age <= 30 && min >= 12 && sec >= 25 && min <= 12 && sec <= 30) || (age >= 30 && age < 35 && min >= 12 && sec >= 55 && min <= 13 && sec <= 0) || (age >= 35 && age < 40 && min >= 13 && sec >= 25 && min <= 13 && sec <= 30)){
        note = 17;
      }else if((age < 25 && min >= 12 && sec >= 1 && min <= 12 && sec <= 6 ) || (age >= 25 && age <= 30 && min >= 12 && sec >= 31 && min <= 12 && sec <= 36) || (age >= 30 && age < 35 && min >= 13 && sec >= 1 && min <= 13 && sec <= 6) || (age >= 35 && age < 40 && min >= 13 && sec >= 31 && min <= 13 && sec <= 36)){
        note = 16.80;
      }else if((age < 25 && min >= 12 && sec >= 7 && min <= 12 && sec <= 12 ) || (age >= 25 && age <= 30 && min >= 12 && sec >= 37 && min <= 12 && sec <= 42) || (age >= 30 && age < 35 && min >= 13 && sec >= 7 && min <= 13 && sec <= 12) || (age >= 35 && age < 40 && min >= 13 && sec >= 37 && min <= 13 && sec <= 42)){
        note = 16.60;
      }else if((age < 25 && min >= 12 && sec >= 13 && min <= 12 && sec <= 18 ) || (age >= 25 && age <= 30 && min >= 12 && sec >= 43 && min <= 12 && sec <= 48) || (age >= 30 && age < 35 && min >= 13 && sec >= 13 && min <= 13 && sec <= 18) || (age >= 35 && age < 40 && min >= 13 && sec >= 43 && min <= 13 && sec <= 48)){
        note = 16.40;
      }else if((age < 25 && min >= 12 && sec >= 19 && min <= 12 && sec <= 24 ) || (age >= 25 && age <= 30 && min >= 12 && sec >= 49 && min <= 12 && sec <= 54) || (age >= 30 && age < 35 && min >= 13 && sec >= 19 && min <= 13 && sec <= 24) || (age >= 35 && age < 40 && min >= 13 && sec >= 49 && min <= 13 && sec <= 54)){
        note = 16.20;
      }else if((age < 25 && min >= 12 && sec >= 25 && min <= 12 && sec <= 30 ) || (age >= 25 && age <= 30 && min >= 12 && sec >= 55 && min <= 13 && sec <= 00) || (age >= 30 && age < 35 && min >= 13 && sec >= 25 && min <= 13 && sec <= 30) || (age >= 35 && age < 40 && min >= 13 && sec >= 55 && min <= 14 && sec <= 0)){
        note = 16;
      }else if((age < 25 && min >= 12 && sec >= 31 && min <= 12 && sec <= 36 ) || (age >= 25 && age <= 30 && min >= 13 && sec >= 1 && min <= 13 && sec <= 6) || (age >= 30 && age < 35 && min >= 13 && sec >= 31 && min <= 13 && sec <= 36) || (age >= 35 && age < 40 && min >= 14 && sec >= 1 && min <= 14 && sec <= 6)){
        note = 15.80;
      }else if((age < 25 && min >= 12 && sec >= 37 && min <= 12 && sec <= 42 ) || (age >= 25 && age <= 30 && min >= 13 && sec >= 7 && min <= 13 && sec <= 12) || (age >= 30 && age < 35 && min >= 13 && sec >= 37 && min <= 13 && sec <= 42) || (age >= 35 && age < 40 && min >= 14 && sec >= 7 && min <= 14 && sec <= 12)){
        note = 15.60;
      }else if((age < 25 && min >= 12 && sec >= 43 && min <= 12 && sec <= 48 ) || (age >= 25 && age <= 30 && min >= 13 && sec >= 13 && min <= 13 && sec <= 18) || (age >= 30 && age < 35 && min >= 13 && sec >= 43 && min <= 13 && sec <= 48) || (age >= 35 && age < 40 && min >= 14 && sec >= 13 && min <= 14 && sec <= 18)){
        note = 15.40;
      }else if((age < 25 && min >= 12 && sec >= 49 && min <= 12 && sec <= 54 ) || (age >= 25 && age <= 30 && min >= 13 && sec >= 19 && min <= 13 && sec <= 24) || (age >= 30 && age < 35 && min >= 13 && sec >= 49 && min <= 13 && sec <= 54) || (age >= 35 && age < 40 && min >= 14 && sec >= 19 && min <= 14 && sec <= 24)){
        note = 15.20;
      }else if((age < 25 && min >= 12 && sec >= 55 && min <= 13 && sec <= 0 ) || (age >= 25 && age <= 30 && min >= 13 && sec >= 25 && min <= 13 && sec <= 30) || (age >= 30 && age < 35 && min >= 13 && sec >= 55 && min <= 14 && sec <= 0) || (age >= 35 && age < 40 && min >= 14 && sec >= 25 && min <= 14 && sec <= 30)){
        note = 15;
      }else if((age < 25 && min >= 13 && sec >= 1 && min <= 13 && sec <= 6 ) || (age >= 25 && age <= 30 && min >= 13 && sec >= 31 && min <= 13 && sec <= 36) || (age >= 30 && age < 35 && min >= 14 && sec >= 1 && min <= 14 && sec <= 6) || (age >= 35 && age < 40 && min >= 14 && sec >= 31 && min <= 14 && sec <= 36)){
        note = 14.80;
      }else if((age < 25 && min >= 13 && sec >= 7 && min <= 13 && sec <= 12 ) || (age >= 25 && age <= 30 && min >= 13 && sec >= 37 && min <= 13 && sec <= 42) || (age >= 30 && age < 35 && min >= 14 && sec >= 7 && min <= 14 && sec <= 12) || (age >= 35 && age < 40 && min >= 14 && sec >= 37 && min <= 14 && sec <= 42)){
        note = 14.60;
      }else if((age < 25 && min >= 13 && sec >= 13 && min <= 13 && sec <= 18 ) || (age >= 25 && age <= 30 && min >= 13 && sec >= 43 && min <= 13 && sec <= 48) || (age >= 30 && age < 35 && min >= 14 && sec >= 13 && min <= 14 && sec <= 18) || (age >= 35 && age < 40 && min >= 14 && sec >= 43 && min <= 14 && sec <= 48)){
        note = 14.40;
      }else if((age < 25 && min >= 13 && sec >= 19 && min <= 13 && sec <= 24 ) || (age >= 25 && age <= 30 && min >= 13 && sec >= 49 && min <= 13 && sec <= 54) || (age >= 30 && age < 35 && min >= 14 && sec >= 19 && min <= 14 && sec <= 24) || (age >= 35 && age < 40 && min >= 14 && sec >= 49 && min <= 14 && sec <= 54)){
        note = 14.20;
      }else if((age < 25 && min >= 13 && sec >= 25 && min <= 13 && sec <= 30 ) || (age >= 25 && age <= 30 && min >= 13 && sec >= 55 && min <= 14 && sec <= 0) || (age >= 30 && age < 35 && min >= 14 && sec >= 25 && min <= 14 && sec <= 30) || (age >= 35 && age < 40 && min >= 14 && sec >= 55 && min <= 15 && sec <= 0)){
        note = 14;
      }else if((age < 25 && min >= 13 && sec >= 31 && min <= 13 && sec <= 36 ) || (age >= 25 && age <= 30 && min >= 14 && sec >= 1 && min <= 14 && sec <= 6) || (age >= 30 && age < 35 && min >= 14 && sec >= 31 && min <= 14 && sec <= 36) || (age >= 35 && age < 40 && min >= 15 && sec >= 1 && min <= 15 && sec <= 6)){
        note = 13.80;
      }else if((age < 25 && min >= 13 && sec >= 37 && min <= 13 && sec <= 42 ) || (age >= 25 && age <= 30 && min >= 14 && sec >= 7 && min <= 14 && sec <= 12) || (age >= 30 && age < 35 && min >= 14 && sec >= 37 && min <= 14 && sec <= 32) || (age >= 35 && age < 40 && min >= 15 && sec >= 7 && min <= 15 && sec <= 12)){
        note = 13.60;
      }else if((age < 25 && min >= 13 && sec >= 43 && min <= 13 && sec <= 48 ) || (age >= 25 && age <= 30 && min >= 14 && sec >= 13 && min <= 14 && sec <= 18) || (age >= 30 && age < 35 && min >= 14 && sec >= 43 && min <= 14 && sec <= 48) || (age >= 35 && age < 40 && min >= 15 && sec >= 13 && min <= 15 && sec <= 18)){
        note = 13.40;
      }else if((age < 25 && min >= 13 && sec >= 49 && min <= 13 && sec <= 54 ) || (age >= 25 && age <= 30 && min >= 14 && sec >= 19 && min <= 14 && sec <= 24) || (age >= 30 && age < 35 && min >= 14 && sec >= 49 && min <= 14 && sec <= 54) || (age >= 35 && age < 40 && min >= 15 && sec >= 19 && min <= 15 && sec <= 24)){
        note = 13.20;
      }else if((age < 25 && min >= 13 && sec >= 55 && min <= 14 && sec <= 0 ) || (age >= 25 && age <= 30 && min >= 14 && sec >= 25 && min <= 14 && sec <= 30) || (age >= 30 && age < 35 && min >= 14 && sec >= 55 && min <= 15 && sec <= 0) || (age >= 35 && age < 40 && min >= 15 && sec >= 25 && min <= 15 && sec <= 30)){
        note = 13;
      }else{
        note = 0;
      }

    }

    ptos = note *2;
    dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].note = note;
    dataTableController.datas[indexList].listEvaluate![dataTableController.showIndex(indexColumn)].pts = ptos;
  }
}