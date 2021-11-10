
import 'package:flutter_simple/controller/dataTableController.dart';
import 'package:flutter_simple/controller/globalController.dart';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ShowList extends StatefulWidget {
  const ShowList({Key? key}) : super(key: key);

  @override
  _ShowListState createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {
  final FocusNode _secFocus = FocusNode(); 
  TextEditingController controllerModal = TextEditingController();
  TextEditingController controllerModalMin = TextEditingController();
  TextEditingController controllerModalSec = TextEditingController();
  GlobalController globalController = Get.put(GlobalController());
  DataTableController dataTableController = Get.put(DataTableController());
  var min = 0, sec = 0, gender;
  late stt.SpeechToText _speech;

  @override
  void initState(){
    super.initState();
    _speech = stt.SpeechToText();
    dataTableController.isListening.value = false;
  }

  // Verificacion de Filas de la Tabla de Registro
  @override
  Widget build(BuildContext context) {
    
    return Obx(
      () => dataTableController.datas.length == 0 || dataTableController.statusVerify.value? Center(
        child: CircularProgressIndicator(),
      ) 
      :
      ListView.builder(
        padding: EdgeInsets.only(left: 10, right: 10),
        shrinkWrap: true,
        itemCount: dataTableController.datas.length,
        itemBuilder: (BuildContext context,int index){
          return Row(
            children: [
              row(0, index, "${index+1}", 1),
              row(1, index, dataTableController.datas[index].specialty == null? null :  dataTableController.datas[index].specialty.toString(), 2),
              row(2, index, dataTableController.datas[index].name == null? null : dataTableController.datas[index].name.toString(), 3),
              row(3, index, dataTableController.datas[index].age == null? null : dataTableController.datas[index].age.toString(), 4),
              row(4, index, dataTableController.datas[index].gender == null? null : dataTableController.datas[index].gender == 0? 'M' : 'F', 4),
              row(5, index, dataTableController.datas[index].size == null? null : dataTableController.datas[index].size.toString(), 5),
              row(6, index, dataTableController.datas[index].weight == null? null : dataTableController.datas[index].weight.toString(), 6),
              row(7, index, dataTableController.datas[index].listEvaluate == null || dataTableController.datas[index].listEvaluate!.length == 0 ? null : dataTableController.datas[index].listEvaluate![0].repTiemp == null? null : dataTableController.datas[index].listEvaluate![0].repTiemp.toString(), 7),
              row(8, index, dataTableController.datas[index].listEvaluate == null || dataTableController.datas[index].listEvaluate!.length == 0 ? null : dataTableController.datas[index].listEvaluate![0].note == null? null : dataTableController.datas[index].listEvaluate![0].note.toString(), 7),
              row(9, index, dataTableController.datas[index].listEvaluate == null || dataTableController.datas[index].listEvaluate!.length == 0 ? null : dataTableController.datas[index].listEvaluate![0].pts == null? null :  dataTableController.datas[index].listEvaluate![0].pts.toString(), 7),
              row(10, index, dataTableController.datas[index].listEvaluate == null || dataTableController.datas[index].listEvaluate!.length == 0 ? null : dataTableController.datas[index].listEvaluate![1].repTiemp == null? null : dataTableController.datas[index].listEvaluate![1].repTiemp.toString(), 7),
              row(11, index, dataTableController.datas[index].listEvaluate == null || dataTableController.datas[index].listEvaluate!.length == 0 ? null : dataTableController.datas[index].listEvaluate![1].note == null? null : dataTableController.datas[index].listEvaluate![1].note.toString(), 7),
              row(12, index, dataTableController.datas[index].listEvaluate == null || dataTableController.datas[index].listEvaluate!.length == 0 ? null : dataTableController.datas[index].listEvaluate![1].pts == null? null : dataTableController.datas[index].listEvaluate![1].pts.toString(), 7),
              row(13, index, dataTableController.datas[index].listEvaluate == null || dataTableController.datas[index].listEvaluate!.length == 0 ? null : dataTableController.datas[index].listEvaluate![2].repTiemp == null? null : dataTableController.datas[index].listEvaluate![2].repTiemp.toString(), 7),
              row(14, index, dataTableController.datas[index].listEvaluate == null || dataTableController.datas[index].listEvaluate!.length == 0 ? null : dataTableController.datas[index].listEvaluate![2].note == null? null : dataTableController.datas[index].listEvaluate![2].note.toString(), 7),
              row(15, index, dataTableController.datas[index].listEvaluate == null || dataTableController.datas[index].listEvaluate!.length == 0 ? null : dataTableController.datas[index].listEvaluate![2].pts == null? null : dataTableController.datas[index].listEvaluate![2].pts.toString(), 7),
              row(16, index, dataTableController.datas[index].listEvaluate == null || dataTableController.datas[index].listEvaluate!.length == 0 ? null : dataTableController.datas[index].listEvaluate![3].repTiemp == null? null : dataTableController.datas[index].listEvaluate![3].repTiemp.toString(), 7),
              row(17, index, dataTableController.datas[index].listEvaluate == null || dataTableController.datas[index].listEvaluate!.length == 0 ? null : dataTableController.datas[index].listEvaluate![3].note == null? null : dataTableController.datas[index].listEvaluate![3].note.toString(), 7),
              row(18, index, dataTableController.datas[index].listEvaluate == null || dataTableController.datas[index].listEvaluate!.length == 0 ? null : dataTableController.datas[index].listEvaluate![3].pts == null? null : dataTableController.datas[index].listEvaluate![3].pts.toString(), 7),
              row(19, index, dataTableController.datas[index].listEvaluate == null || dataTableController.datas[index].listEvaluate!.length == 0 ? null : dataTableController.datas[index].listEvaluate![4].repTiemp == null? null : dataTableController.datas[index].listEvaluate![4].repTiemp.toString(), 7),
              row(20, index, dataTableController.datas[index].listEvaluate == null || dataTableController.datas[index].listEvaluate!.length == 0 ? null : dataTableController.datas[index].listEvaluate![4].note == null? null : dataTableController.datas[index].listEvaluate![4].note.toString(), 7),
              row(21, index, dataTableController.datas[index].listEvaluate == null || dataTableController.datas[index].listEvaluate!.length == 0 ? null : dataTableController.datas[index].listEvaluate![4].pts == null? null : dataTableController.datas[index].listEvaluate![4].pts.toString(), 7),
              row(22, index, dataTableController.datas[index].total == null? null : dataTableController.datas[index].total.toString(), 8),
              row(23, index, dataTableController.datas[index].average == null? null : dataTableController.datas[index].average.toString(), 8),
              row(24, index, dataTableController.datas[index].result == null? null : dataTableController.datas[index].result.toString(), 9),
            ],
          );
        }
      )
    );
  }

  Widget row(indexColumn, indexList, text, index){
    return GestureDetector(
      onTap: () {
        if(indexColumn > 0 && indexColumn != 24 && indexColumn != 25) /* No se puede moficar las columnas 0, ni 24 ni 25  */
          passVariable(indexColumn, indexList, text);
      },

      /*Tamaño y separacion de recuadros*/
      child: Container(
        alignment: Alignment.center,
        width: index == 1 || index == 5? 47 : index == 2? 100 : index == 3? 130 : index == 4? 31 : index == 6? 42 : index == 7? 60.7 : index == 8? 76 : 84,
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
        showModal(text, indexList, indexColumn, 'Genero');
        break;
      case 5:
        showModal(text, indexList, indexColumn, 'Talla Mts');
        break;
      case 6:
        showModal(text, indexList, indexColumn, 'Peso Kg');
        break;
      case 7:
      case 10:
      case 13:
        showModal(text, indexList, indexColumn, 'Rep');
        break;
      case 16:
      case 19:
        showModal(text, indexList, indexColumn, 'Tiemp');
        break;
      case 24:
        showModal(text, indexList, indexColumn, 'Resultado de Control');
        break;
      default:
        break;
    }
  }

  showModal(text, indexList, indexColumn, title) async{
    gender = null;
    controllerModal.text = text== null? '' : text;
    Orientation orientation = MediaQuery.of(context).orientation;
    var statusOrientation = false;
    if (orientation == Orientation.landscape)
      statusOrientation = true;
    
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    
// Verficacion del Tiempo en las filas 7, 13, 16 y 19 , del Tipo Evaluacion(Pista de compate, Carrea y Natacion)
    if((indexColumn == 7 && dataTableController.datas[indexList].gender == 1) || indexColumn == 13 || indexColumn == 16 || indexColumn == 19){
      if(text == null){
        controllerModalMin.clear();
        controllerModalSec.clear();
      }else{
        var arr = text.split("'");
        controllerModalMin.text = arr[0];
        controllerModalSec.text = arr[1];
      }
    }

    if (indexColumn <7 || (indexColumn >= 7 && dataTableController.datas[indexList].specialty != null && dataTableController.datas[indexList].name != null && dataTableController.datas[indexList].age != null && dataTableController.datas[indexList].gender != null))
    
    return Get.defaultDialog(
      title: title,
      titlePadding: EdgeInsets.all(20),
      barrierDismissible: true,
      backgroundColor: Colors.white,
      content: Row(
        children: [
          Expanded(
            child: indexColumn == 4?
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GenderPickerWithImage(
                    showOtherGender: false,
                    verticalAlignedText: false,
                    selectedGender: dataTableController.datas[indexList].gender == null? Gender.Others : dataTableController.datas[indexList].gender == 0? Gender.Male : Gender.Female,
                    maleText: "Masculino ",
                    femaleText: "Femenino",
                    selectedGenderTextStyle: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                    unSelectedGenderTextStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                    onChanged: (Gender? result) {
                      if(result == Gender.Male )
                        gender = 0;
                      else 
                        gender = 1;
                    },
                    equallyAligned: true,
                    animationDuration: Duration(milliseconds: 300),
                    isCircular: true,
                    // default : true,
                    opacityOfGradient: 0.4,
                    padding: const EdgeInsets.all(3),
                    size: 100, //default : 40
                  )
                ],
              )
              : (indexColumn == 7 && dataTableController.datas[indexList].gender == 1) || indexColumn == 13 || indexColumn == 16 || indexColumn == 19? 
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: new TextFormField(
                      controller: controllerModalMin,
                      autofocus: false,
                      keyboardType: TextInputType.number,
                      inputFormatters: [  
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        labelText: "Min",
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                            ),
                          onPressed: () {
                            stopSpeech();
                            controllerModal.clear();
                          },
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => FocusScope.of(context).requestFocus(_secFocus),
                    )
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: new TextFormField(
                      controller: controllerModalSec,
                      focusNode: _secFocus,
                      keyboardType: TextInputType.number,
                      inputFormatters: [  
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        labelText: "Sec",
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                            ),
                          onPressed: () {
                            stopSpeech();
                            controllerModal.clear();
                          },
                        ),
                      ),
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (value) => validateForm(indexList, indexColumn, statusOrientation),
                    )
                  ),
                  Obx(
                    () => AvatarGlow(
                      animate: dataTableController.isListening.value,
                      glowColor: Colors.blueAccent,
                      endRadius: 75.0,
                      duration: const Duration(milliseconds: 2000),
                      repeatPauseDuration: const Duration(milliseconds: 100),
                      repeat: true,
                      child: FloatingActionButton(
                        onPressed: () =>_listen(indexList, indexColumn),
                        child: Icon(dataTableController.isListening.value? Icons.mic : Icons.mic_none),
                      )
                    ),
                  ),
                ],
              )
              : 
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  new TextFormField(
                    controller: controllerModal,
                    autofocus: false,
                    textCapitalization: TextCapitalization.words, 
                    keyboardType: indexColumn >= 1 && indexColumn <= 2? TextInputType.text : TextInputType.number,
                    decoration: InputDecoration(
                      hintText: (indexColumn >= 1 && indexColumn <= 2)? '' : '10.5 ó 10',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                          ),
                        onPressed: () {
                          stopSpeech();
                          controllerModal.clear();
                        },
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (value) => validateForm(indexList, indexColumn, statusOrientation),
                  ),
                  Obx(
                    () => AvatarGlow(
                      animate: dataTableController.isListening.value,
                      glowColor: Colors.blueAccent,
                      endRadius: 75.0,
                      duration: const Duration(milliseconds: 2000),
                      repeatPauseDuration: const Duration(milliseconds: 100),
                      repeat: true,
                      child: FloatingActionButton(
                        onPressed: () =>_listen(indexList, indexColumn),
                        child: Icon(dataTableController.isListening.value? Icons.mic : Icons.mic_none),
                      )
                    ),
                  ),
                ],
              )
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(Colors.blue)
          ),
          child: const Text('Guardar'),
          onPressed: () async {
            stopSpeech();
            validateForm(indexList, indexColumn, statusOrientation);
          },
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(Colors.red)
          ),
          child: const Text('Cancelar'),
          onPressed: () {
            stopSpeech();
            closeModal(statusOrientation);
          },
        ),
      ],
    );

    else{
      globalController.showMessage("Por Favor ingrese los datos personales, obligatiorio: Grado Especialidad, nombre, edad y género.", false);
      await Future.delayed(Duration(seconds: 2));
      Get.back();
    }
  }

  validateForm(indexList, indexColumn, statusOrientation)async{
    int min = 0, sec = 0;
    if((indexColumn == 7 && dataTableController.datas[indexList].gender == 1) || indexColumn == 13 || indexColumn == 16 || indexColumn == 19 ){
      min = controllerModalMin.text.isEmpty? 0 : int.parse(controllerModalMin.text);
      sec = controllerModalSec.text.isEmpty? 0 : int.parse(controllerModalSec.text);
      await dataTableController.validateModal("$min'$sec''", indexColumn);
    }
    else
      await dataTableController.validateModal(controllerModal.text, indexColumn);

    if(!dataTableController.statusError.value){
      if((indexColumn == 7 && dataTableController.datas[indexList].gender == 1) || indexColumn == 13 || indexColumn == 16 || indexColumn == 19 ){
        if(min == 0 && sec == 0)
          dataTableController.updateData(indexList, indexColumn, null);
        else
          dataTableController.updateData(indexList, indexColumn, "$min'$sec''");
      }else if(indexColumn == 4)
        dataTableController.updateData(indexList, indexColumn, gender);
      else
        dataTableController.updateData(indexList, indexColumn, controllerModal.text.trim().isEmpty? null : controllerModal.text);
      
      closeModal(statusOrientation); 
    }
  }

  closeModal(statusOrientation){
    FocusScope.of(context).requestFocus(new FocusNode());
    controllerModal.clear();
    controllerModalMin.clear();
    controllerModalSec.clear();
    if(statusOrientation)
      SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
      ]);

    Get.back();
  }

  void _listen(indexList, indexColumn) async {
    
    if (!dataTableController.isListening.value) {
      bool available = await _speech.initialize(
        onStatus: (val) {
          if(val == "done")
            stopSpeech();
        },
        onError: (val) => stopSpeech(),
      );
      if (available) {
        dataTableController.isListening.value = true;
        _speech.listen(
          onResult: (val) async {
            
            if(indexColumn >= 1 && indexColumn <= 2 || indexColumn == 26) //text nombre y especialidad
              controllerModal.text = val.recognizedWords.capitalizeFirstofEach;
            else if(indexColumn == 26)
              controllerModal.text = val.recognizedWords.inCaps;
            else if(indexColumn >= 3 && indexColumn <= 14 || indexColumn >= 16 && indexColumn <= 17 || indexColumn >= 19 && indexColumn <= 20 || indexColumn >= 22 && indexColumn <= 25 ){ //numero
              if(isNumeric(val.recognizedWords.toLowerCase()))
                controllerModal.text = val.recognizedWords;
              else
                controllerModal.text = globalController.getValueList(val.recognizedWords.toLowerCase());
            }
            else if(indexColumn == 15 || indexColumn == 18 || indexColumn == 21){// tiempo
              var textVoice = val.recognizedWords.toLowerCase();
              if(textVoice.contains('minutos') || textVoice.contains('minuto') || textVoice.contains('segundos') || textVoice.contains('segundo')){
                
                var arr = textVoice.split(' ');
                var dataTime = await globalController.getNumberTime(arr);

                if(isNumeric(dataTime.min))
                  controllerModalMin.text = dataTime.min;
                else
                  controllerModalMin.text = globalController.getValueList(dataTime.min);

                if(isNumeric(dataTime.sec))
                  controllerModalSec.text = dataTime.sec;
                else
                  controllerModalSec.text = globalController.getValueList(dataTime.sec);
              }
            }
          },
        );
      }
    } else {
      stopSpeech();
    }
  }

  bool isNumeric(String? text) {
    text = text!.replaceAll(',', '.');
    // ignore: unnecessary_null_comparison
    if(text == null) {
      return false;
    }
    return double.tryParse(text) != null;
  }
  
  stopSpeech(){
    dataTableController.isListening.value = false;
    _speech.stop();
  }
}

extension CapExtension on String {
  String get inCaps => this.length > 0 ?'${this[0].toUpperCase()}${this.substring(1)}':'';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach => this.replaceAll(RegExp(' +'), ' ').split(" ").map((str) => str.inCaps).join(" ");
}

// final helloWorld = 'hello world'.inCaps; // 'Hello world'
// final helloWorld = 'hello world'.allInCaps; // 'HELLO WORLD'
// final helloWorldCap = 'hello world'.capitalizeFirstofEach; // 'Hello World'