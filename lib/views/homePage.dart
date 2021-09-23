import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter_simple/controller/authController.dart';
import 'package:flutter_simple/controller/dataTableController.dart';
import 'package:flutter_simple/controller/globalController.dart';
import 'package:flutter_simple/views/widget_home/dataTable.dart';

import 'package:flutter/material.dart';
import 'package:flutter_simple/views/widget_home/show_picture.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  static Widget create(BuildContext context) => HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState(){
    super.initState();
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
    GlobalController globalController = Get.put(GlobalController());
    AuthController authController = Get.put(AuthController());   
    DataTableController dataTableController = Get.put(DataTableController());

    return WillPopScope(
      onWillPop: () async =>false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bienvenido'),
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
          ],
        ),
      ),
    );
  }



}
