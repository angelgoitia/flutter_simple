
import 'package:photo_view/photo_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
//Clase de Visualizacion de Imagen de la Tabla de Calificaciones
class ShowPicture extends StatefulWidget {
  ShowPicture(this.name, this.url);
  final String name, url;

  @override
  _ShowPictureState createState() => _ShowPictureState(this.name, this.url);
}

class _ShowPictureState extends State<ShowPicture> {
  _ShowPictureState(this.name, this.url);
  final String name,url;

//Interfaz de Tabla de Calificaciones
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(name),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          ),
        ),
        body: Container(
          color: Colors.black,
          child: PhotoView(
            imageProvider: AssetImage(url),
            initialScale: PhotoViewComputedScale.contained * 0.8,
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.contained * 2.5, 
          )
        ),
      ),
    );
  }
}