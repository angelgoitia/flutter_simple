import 'package:flutter_simple/controller/globalController.dart';
import 'package:flutter_simple/model/user.dart';
import 'package:flutter_simple/views/homePage.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_simple/views/intro_screen.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user = MyUser().obs;
  final stateAuth = false.obs;

  GlobalController globalController = Get.put(GlobalController());  

  void _userFromFirebase(dataUser, type) async{
    print("user $user");
    SharedPreferences prefs = await SharedPreferences.getInstance();

    user.value = MyUser(
      uid:dataUser.uid,
      email: dataUser.email,
      type: type,
    );

    prefs.setString('uid', dataUser.uid);
    prefs.setInt('type', type);
    await Future.delayed(Duration(seconds: 1));
    Get.back();
    Get.off(() => HomePage(), transition: Transition.zoom);
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
    else
      signOut();
  }

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
      showError(error);
    }
  }

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

  showError(error){
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
        errorMessage = "Wrong email or password combination.";
        break;
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        errorMessage = "No user found with this email.";
        break;
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        errorMessage = "User disabled.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        errorMessage = "Too many requests to log into this account.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        errorMessage = "Server error, please try again later.";
        break;
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        errorMessage = "Email address is invalid.";
        break;
      default:
        errorMessage = "Login failed. Please try again.";
        break;
    }

    if (errorMessage != null) {    
      globalController.showMessage(errorMessage, false);
    }
  }

}