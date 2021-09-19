
import 'package:flutter_simple/controller/dataTableController.dart';

import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class ShowList extends StatefulWidget {
  const ShowList({Key? key}) : super(key: key);

  @override
  _ShowListState createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {
  TextEditingController controllerModal = TextEditingController();
  DataTableController dataTableController = Get.put(DataTableController());

  @override
  Widget build(BuildContext context) {
    
    return Obx(
      () => ListView.builder(
        padding: EdgeInsets.only(left: 10, right: 10),
        shrinkWrap: true,
        itemCount: dataTableController.datas.length,
        itemBuilder: (BuildContext context,int index){
          return Row(
            children: [
              row(0, index, "${index+1}", 1),
              row(1, index, dataTableController.datas[index].specialty == null? null : dataTableController.datas[index].specialty.toString(), 2),
              row(2, index, dataTableController.datas[index].name == null? null :dataTableController.datas[index].name.toString(), 3),
              row(3, index, dataTableController.datas[index].age == null? null :dataTableController.datas[index].age.toString(), 4),
              row(4, index, dataTableController.datas[index].size == null? null :dataTableController.datas[index].size.toString(), 5),
              row(5, index, dataTableController.datas[index].weight == null? null :dataTableController.datas[index].weight.toString(), 6),
              row(6, index, dataTableController.datas[index].listEvaluate == null? null : dataTableController.datas[index].listEvaluate![0].repTiemp.toString(), 7),
              row(7, index, dataTableController.datas[index].listEvaluate == null? null : dataTableController.datas[index].listEvaluate![0].note.toString(), 7),
              row(8, index, dataTableController.datas[index].listEvaluate == null? null : dataTableController.datas[index].listEvaluate![0].pts.toString(), 7),
              row(9, index, dataTableController.datas[index].listEvaluate == null? null : dataTableController.datas[index].listEvaluate![1].repTiemp.toString(), 7),
              row(10, index, dataTableController.datas[index].listEvaluate == null? null : dataTableController.datas[index].listEvaluate![1].note.toString(), 7),
              row(11, index, dataTableController.datas[index].listEvaluate == null? null : dataTableController.datas[index].listEvaluate![1].pts.toString(), 7),
              row(12, index, dataTableController.datas[index].listEvaluate == null? null : dataTableController.datas[index].listEvaluate![2].repTiemp.toString(), 7),
              row(13, index, dataTableController.datas[index].listEvaluate == null? null : dataTableController.datas[index].listEvaluate![2].note.toString(), 7),
              row(14, index, dataTableController.datas[index].listEvaluate == null? null : dataTableController.datas[index].listEvaluate![2].pts.toString(), 7),
              row(15, index, dataTableController.datas[index].listEvaluate == null? null : dataTableController.datas[index].listEvaluate![3].repTiemp.toString(), 7),
              row(16, index, dataTableController.datas[index].listEvaluate == null? null : dataTableController.datas[index].listEvaluate![3].note.toString(), 7),
              row(17, index, dataTableController.datas[index].listEvaluate == null? null : dataTableController.datas[index].listEvaluate![3].pts.toString(), 7),
              row(18, index, dataTableController.datas[index].total == null? null : dataTableController.datas[index].total.toString(), 8),
              row(19, index, dataTableController.datas[index].average == null? null : dataTableController.datas[index].average.toString(), 8),
              row(20, index, dataTableController.datas[index].result == null? null : dataTableController.datas[index].result.toString(), 9),
            ],
          );
        }
      )
    );
  }

  Widget row(indexColumn, indexList, text, index){
    return GestureDetector(
      onTap: () {
        if(indexColumn > 0)
          passVariable(indexColumn, indexList, text);
      },
      child: Container(
        alignment: Alignment.center,
        width: index == 1 || index == 5? 44 : index == 2? 86 : index == 3? 114 : index == 4? 29 : index == 6? 38 : index == 7? 60.7 : index == 8? 76 : 74,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          )
        ),
        child: AutoSizeText(
          text == null? " - " : text,
          textAlign: TextAlign.center,
          maxFontSize: 12,
          minFontSize: 12,
        ),
      )
    );
  }

  passVariable(indexColumn, indexList, text){
    switch (indexColumn) {
      case 1:
        showModal(text, indexList, indexColumn, 'Grado Especialidad');
        break;
      case 2:
        showModal(text, indexList, indexColumn, 'Apellido y Nombre');
        break;
       case 3:
        showModal(text, indexList, indexColumn, 'Edad');
        break;
      case 4:
        showModal(text, indexList, indexColumn, 'Talla Mts');
        break;
      case 5:
        showModal(text, indexList, indexColumn, 'Peso Kg');
        break;
      case 6:
      case 9:
        showModal(text, indexList, indexColumn, 'Rep');
        break;
      case 7:
      case 10:
      case 13:
        showModal(text, indexList, indexColumn, 'Nota');
        break;
      case 8:
      case 11:
      case 14:
        showModal(text, indexList, indexColumn, 'Ptos');
        break;
      case 12:
      case 15:
        showModal(text, indexList, indexColumn, 'Tiemp');
        break;
      case 16:
        showModal(text, indexList, indexColumn, 'Total');
        break;
      case 17:
        showModal(text, indexList, indexColumn, 'Prom (#)');
        break;
      case 18:
        showModal(text, indexList, indexColumn, 'Resultado de Control');
        break;
      default:
        break;
    }
  }

  showModal(text, indexList, indexColumn, title) async{
    controllerModal.text = text;
    Orientation orientation = MediaQuery.of(context).orientation;
    var statusOrientation = false;
    if (orientation == Orientation.portrait)
    {
      statusOrientation = true;
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    return Get.defaultDialog(
      title: title,
      titlePadding: EdgeInsets.all(20),
      barrierDismissible: true,
      backgroundColor: Colors.white,
      content: new Row(
        children: <Widget>[
          new Expanded(
            child: new TextField(
              controller: controllerModal,
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
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
          child: const Text('Guardar'),
          onPressed: () {
            dataTableController.updateData(indexList, indexColumn, controllerModal.text);
            closeModal(statusOrientation);
          },
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(Colors.red)
          ),
          child: const Text('Cancelar'),
          onPressed: () => closeModal(statusOrientation),
        ),
      ],
    );
  }

  closeModal(statusOrientation){
    if(statusOrientation){}
      SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
      ]);

    Get.back();
  }

}