
import 'package:flutter_simple/controller/authController.dart';
import 'package:flutter_simple/views/homePage.dart';
import 'package:flutter_simple/views/intro_screen.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController {
   
  @override
  void onReady() {
    super.onReady();
    verifySharedPReferences();
  }


  verifySharedPReferences()async{
    AuthController authController = Get.put(AuthController());
    
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.containsKey('uid')){
      await authController.getMyUser(prefs.getInt('type'));
      Future.delayed(Duration(seconds:2), (){
        Get.off(() => HomePage(), transition: Transition.zoom);
      }); 

    }else{

      Future.delayed(Duration(seconds:2), (){
        Get.off(() => IntroScreen(), transition: Transition.zoom);
      });
      
    }
  }

  
}