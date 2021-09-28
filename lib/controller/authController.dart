import 'package:flutter_simple/controller/dataTableController.dart';
import 'package:flutter_simple/controller/globalController.dart';
import 'package:flutter_simple/model/user.dart';
import 'package:flutter_simple/views/homePage.dart';
import 'package:flutter_simple/views/intro_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';


//Sincronizacion con Firebase 
//
class AuthController extends GetxController {
  final googleSignIn = GoogleSignIn(); 
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user = MyUser().obs;
  final stateAuth = false.obs;

  GlobalController globalController = Get.put(GlobalController()); 
  DataTableController dataTableController = Get.put(DataTableController()); 

// Usuario obtenido de Firebase
  _userFromFirebase(dataUser, type) async{
    print("user $dataUser");
    SharedPreferences prefs = await SharedPreferences.getInstance();

    user.value = MyUser(
      uid:dataUser.uid,
      email: dataUser.email,
      name: dataUser.isAnonymous? "Anónimo": dataUser.displayName,
      type: type,
      dateSelect: DateTime.now(),
    );

    prefs.setString('uid', dataUser.uid);
    prefs.setInt('type', type);
    
    Get.back();
    Get.off(() => HomePage(), transition: Transition.zoom);
    await Future.delayed(Duration(seconds: 1));
    dataTableController.getData();
  }

  Future<MyUser?> getMyUser(type) async {
    globalController.loading();
    if(type == 0){
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);

      var result = (await _auth.signInWithCredential(credential));
      print("result getyser ${result.user}");
      _userFromFirebase(result.user, type);
    }
    else if(type == 1 || type == 2)
      _userFromFirebase(_auth.currentUser, type);
    else{
      Get.back();
      signOut();
    }
  }
//Permisos para poder concectarnos con cuenta de Google
  signInWithGoogle() async{
    globalController.loading();
    try{
      final googleAccount = await googleSignIn.signIn().catchError((e) {
        print(e);
      });
      if(googleAccount!=null){
        final googleAuth=await googleAccount.authentication;
        if(googleAuth.accessToken!=null && googleAuth.idToken!=null){
          final authResult = await _auth.signInWithCredential(
            GoogleAuthProvider.credential(
              idToken: googleAuth.idToken,
              accessToken: googleAuth.accessToken
            )
          );
          return _userFromFirebase(authResult.user!, 0);
        }
      }
    }catch(error) {
      Get.back();
      showError(error);
    }
  }

// Creacion de Usuario con Email y Contraseña
  createUserWithEmailAndPassword(String email, String password) async {
    globalController.loading();
    try{
      final authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print("result $authResult");
      return _userFromFirebase(authResult.user, 1);
    } catch (error) {
      showError(error);
    }
  }

// Ingresar con Email y Contraseña
  signInWithEmailAndPassword(String email, String password) async{
    globalController.loading();
    try{
      final authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      print("result $authResult");
      return _userFromFirebase(authResult.user, 1);
    } catch (error) {
      showError(error);
    }
  }

// Ingresar Anonimamente 
  signInAnonymously() async {
    globalController.loading();
    try{
      final user = await _auth.signInAnonymously();
      print("result $user");
      return _userFromFirebase(user.user,2);
    } catch (error) {
      showError(error);
    }
  }
// Para cerrar sesion del aplicativo
  Future<void> signOut() async {
    globalController.loading();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _auth.signOut();
    Future.delayed(Duration(seconds:2), (){
      Get.back();
      Get.off(() => IntroScreen(), transition: Transition.zoom);
    });
  }

// Mensajes de Errores generales del Logeo
  showError(error) async {
    var errorMessage;
    print(error.code);
    switch (error.code) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        errorMessage = "Email already used. Go to login page.";
        break;
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        errorMessage = "Contraseña Invalida.";
        break;
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        errorMessage = "Usuario con Encontrado con este Email.";
        break;
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        errorMessage = "Usuario deshabilitado.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        errorMessage = "Demasiadas solicitudes para ingresar a esta cuenta.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        errorMessage = "Error de servidor, porfavor intentelo mas tarde.";
        break;
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        errorMessage = "Email Invalido.";
        break;
      default:
        errorMessage = "Error de Inicio de Sesion.";
        break;
    }

    if (errorMessage != null) {    
      Get.back();
      globalController.showMessage(errorMessage, false);
      await Future.delayed(Duration(seconds: 1));
      Get.back();
    }
  }

}