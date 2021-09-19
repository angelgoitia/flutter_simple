import 'package:flutter/services.dart';
import 'package:flutter_simple/controller/authController.dart';
import 'package:flutter_simple/views/widget_table/dataTable.dart';

import 'package:flutter/material.dart';
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
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    AuthController authController = Get.put(AuthController());   

    return WillPopScope(
      onWillPop: () async =>false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome'),
          automaticallyImplyLeading: false,
          actions: <Widget>[
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
        body: DataTableWidget(),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          foregroundColor: Colors.white,
          overlayOpacity: 0.2,
          children: [
            SpeedDialChild(
                child: Icon(Icons.add, color: Colors.white,),
                label: "Agregar nuevo registro",
                backgroundColor: Colors.purple,
                onTap: () => null,
            ),
            SpeedDialChild(
                child: Icon(Icons.delete, color: Colors.white,),
                label: "Eliminar registro",
                backgroundColor: Colors.red,
                onTap: () => null,
            ),
            SpeedDialChild(
                child: Icon(Icons.save, color: Colors.white,),
                label: "Guardar Registro",
                backgroundColor: Colors.green,
                onTap: () => null,
            ),
          ],
        ),
      ),
    );
  }



}
