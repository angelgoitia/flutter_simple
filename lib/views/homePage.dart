import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter_simple/controller/authController.dart';
import 'package:flutter_simple/controller/dataTableController.dart';
import 'package:flutter_simple/controller/globalController.dart';
import 'package:flutter_simple/views/widget_home/dataTable.dart';

import 'package:flutter/material.dart';
import 'package:flutter_simple/views/widget_home/show_picture.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  static Widget create(BuildContext context) => HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controllerDate = TextEditingController();
  DateFormat formatter = DateFormat('dd/MM/yyyy');

  GlobalController globalController = Get.put(GlobalController());
  AuthController authController = Get.put(AuthController());   
  DataTableController dataTableController = Get.put(DataTableController());

  @override
  void initState(){
    super.initState();
    controllerDate.text = formatter.format(authController.user.value.dateSelect!);
    /* SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
    ]); */
  }

  @override
  dispose(){
    /* SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]); */
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async =>false,
      child: Scaffold(
        appBar: AppBar(
          title: MediaQuery.of(context).orientation == Orientation.landscape ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Bienvenido'),
              textBox(context),
            ],
          ) : textBox(context),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              onPressed: () => dataTableController.getData(),
            ),
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () => authController.signOut(),
            )
          ],
        ),
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 100,
                child: const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: AutoSizeText(
                    'Tabla de Calificaciones',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white
                    ),
                    maxFontSize: 15,
                    minFontSize: 15,
                  ),
                )
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: globalController.listTable.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(globalController.listTable[index]['title']),
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(() => ShowPicture(globalController.listTable[index]['title'], globalController.listTable[index]['url']), transition: Transition.zoom);
                    },
                  );
                }
              ) 
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: DataTableWidget(),
        ),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          foregroundColor: Colors.white,
          overlayOpacity: 0.2,
          children: [
            SpeedDialChild(
                child: Icon(Icons.add, color: Colors.white,),
                label: "Agregar nuevo registro",
                backgroundColor: Colors.purple,
                onTap: () => dataTableController.addData(),
            ),
            SpeedDialChild(
                child: Icon(Icons.delete, color: Colors.white,),
                label: "Eliminar registro",
                backgroundColor: Colors.red,
                onTap: () => dataTableController.removeData(),
            ),
            SpeedDialChild(
                child: Icon(Icons.delete, color: Colors.white,),
                label: "Eliminar todos los registros",
                backgroundColor: Colors.black,
                onTap: () => dataTableController.removeAllData(),
            ),
            SpeedDialChild(
                child: Icon(Icons.save, color: Colors.white,),
                label: "Guardar Registros",
                backgroundColor: Colors.green,
                onTap: () => dataTableController.saveData(),
            ),
            SpeedDialChild(
                child: Icon(Icons.download, color: Colors.white,),
                label: "Descargar Registros",
                backgroundColor: Colors.cyan,
                onTap: () async => await launch("http:://${globalController.url}/getPDF?name=${authController.user.value.name}&date=${authController.user.value.dateSelect}"),
            ),
          ],
        ),
      ),
    );
  }

  Widget textBox(context){
    return new Theme(
      data: new ThemeData(
        primaryColor: Colors.blueAccent,
        primaryColorDark: Colors.blue,
      ),
      child: Container(
        width: 150,
        child: TextFormField(
          readOnly: true,
          controller: controllerDate,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            fillColor: Colors.white,
            labelText: "Fecha",
            labelStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'MontserratSemiBold',
              fontSize: 14,
            ),
          ),
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'MontserratSemiBold',
            color: Colors.white,
          ),
          onTap: () {
            _selectDate(context);
          }
        )
      )
    );
  }

  Future<Null> _selectDate(BuildContext context) async {

    final DateTime? picked = await showDatePicker(
      context: context,
      builder: (BuildContext context, Widget? child) {
        return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.blue,
                primaryColorDark: Colors.blue,
                accentColor: Colors.blue,
              ),
            dialogBackgroundColor:Colors.white,
          ),
          child: child!,
        );
      },
      locale : const Locale("es","ES"),
      initialDate: authController.user.value.dateSelect!,
      firstDate:  DateTime.parse("2021-09-01"),
      lastDate: DateTime.now(),
      helpText: "Seleccionar la Fecha:",
    );

    if (picked != null){
      DateTime dateUser = authController.user.value.dateSelect!;
      if(dateUser.day != picked.day || dateUser.month != picked.month || dateUser.year != picked.year){
        controllerDate.text = formatter.format(picked);
        authController.user.value.dateSelect = picked;
        dataTableController.getData();
      }
    } 
    
  }

}
