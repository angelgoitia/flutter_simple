import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple/views/widget_home/showList.dart';

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 160,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: [
                      table("N/O", false),
                      table("Grado \n Especialidad", false),
                      table("Apellido y Nombre", false),
                      table("EDAD", true),
                      table("TALLA Mts", true),
                      table("PESO Kg", true),
                      Column(
                        children: [
                          tableRow("Primer dia", "Evaluate"),
                          Row(
                            children: [
                              Column(
                                children: [
                                  tableRow("Adominales", "Exercise"),
                                  tableRow("COEF1", "Code"),
                                  Row(
                                    children: [
                                      tableRow("Rep", "typeEvaluate"),
                                      tableRow("Nota", "typeEvaluate"),
                                      tableRow("Ptos", "typeEvaluate"),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  tableRow("Planchas (M) o \n Semiplanchas (F)", "Exercise"),
                                  tableRow("COEF2", "Code"),
                                  Row(
                                    children: [
                                      tableRow("Rep", "typeEvaluate"),
                                      tableRow("Nota", "typeEvaluate"),
                                      tableRow("Ptos", "typeEvaluate"),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  tableRow("Carrera 2,400 mts ó \n Carrera 4,800 mts", "Exercise"),
                                  tableRow("COEF1", "Code"),
                                  Row(
                                    children: [
                                      tableRow("Tiemp", "typeEvaluate"),
                                      tableRow("Nota", "typeEvaluate"),
                                      tableRow("Ptos", "typeEvaluate"),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          tableRow("Segundo dia", "Evaluate 2"),
                          Row(
                            children: [
                              Column(
                                children: [
                                  tableRow("Natacion: 25 mts", "Exercise"),
                                  tableRow("COEF2", "Code"),
                                  Row(
                                    children: [
                                      tableRow("Tiemp", "typeEvaluate"),
                                      tableRow("Nota", "typeEvaluate"),
                                      tableRow("Ptos", "typeEvaluate"),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: tableRow("PUNTUAJE", "Score"),
                          ),
                          Row(
                            children: [
                              tableRow("Total", "typeEvaluate 2"),
                              tableRow("PROM \n (#)", "typeEvaluate 2"),
                            ],
                          ),
                        ],
                      ),
                      table("Resultado \n de \n Control", false),
                    ],
                  )
                )
              ]
            )
          ),
          Container(
            width: 1332,
            height: size.height - 244,
            child: ShowList()
          )
        ],
      )
    );
  }

  Widget table(String text, status){
    var arr = text.split(" ");
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        )
      ),
      child: status? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            runSpacing: 30,
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            children: arr[0].split("").map((string) => AutoSizeText(
              string,
              textAlign: TextAlign.left,
              maxFontSize: 12,
              minFontSize: 12,
            )).toList(),
          ),
          if(arr.length >1) AutoSizeText(
            "\n ${arr[1]}",
            textAlign: TextAlign.center,
            maxFontSize: 12,
            minFontSize: 12,
          ),
        ],
        )
      :
      AutoSizeText(
        text,
        textAlign: TextAlign.center,
        maxFontSize: 12,
        minFontSize: 12,
      ),
    );
  }

  Widget tableRow(String text, String type){
    return Container(
      width: type == 'Evaluate'? 546 : type == 'Evaluate 2'? 182 : type== "Score"? 152 : type == "typeEvaluate"? 60.7 : type == "typeEvaluate 2"? 76 : 182,
      height: type == 'Exercise' || type == 'Evaluate' || type == 'Evaluate 2' ? 40 : type != 'Code'? 40 : 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        )
      ),
      child: Container(
        child: AutoSizeText(
          text,
          textAlign: TextAlign.center,
          maxFontSize: 12,
          minFontSize: 12,
        )
      ),
    );
  }
}