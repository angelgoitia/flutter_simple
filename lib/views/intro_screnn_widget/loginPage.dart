import 'package:flutter_simple/controller/authController.dart';
import 'package:flutter_simple/views/intro_screnn_widget/loginButton.dart';

import 'package:flutter/material.dart';
import 'package:flutter_simple/views/intro_screnn_widget/widget_login/email_create_screen.dart';
import 'package:flutter_simple/views/intro_screnn_widget/widget_login/email_signin_screen.dart';
import 'package:flutter_simple/views/intro_screnn_widget/widget_login/forgot_password_screen.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Fondo_Militar.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/Logo.png',
                  width: 200,
                  height: 200,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Inicio de Sesion',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
                    
                  ),
                ),
                //if (isSigningIn) CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    children: [
                      SizedBox(height: 8),
                      /* LoginButton(
                        text: 'Inicio con Google',
                        imagePath: 'assets/icon_google.png',
                        color: Colors.white,
                        textColor: Colors.grey,
                        onTap: () => authController.signInWithGoogle(),
                      ), */
                      SizedBox(height: 8),
                      /* LoginButton(
                        text: 'Sign in with Facebook',
                        imagePath: 'assets/icon_facebook.png',
                        color: Colors.blueAccent,
                        onTap: () => null,//authCubit.signInWithFacebook(),
                      ), */
                      SizedBox(height: 8),
                      LoginButton(
                        text: 'Inicio con Email',
                        imagePath: 'assets/icon_email.png',
                        color: Colors.red,
                        textColor: Colors.white,
                        onTap: () => Get.to(() => EmailSignIn(), transition: Transition.rightToLeft),
                      ),
                      SizedBox(height: 8),
                      LoginButton(
                        text: 'Inicio con Anonimo',
                        imagePath: 'assets/icon_question.png',
                        color: Colors.deepPurpleAccent,
                        textColor: Colors.white,
                        onTap: () => authController.signInAnonymously(),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        child: Text(
                          '??Olvidaste tu contrase??a?',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        onPressed: () => Get.to(() => ForgotPassword(), transition: Transition.rightToLeft),
                      ),
                      SizedBox(height: 38),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 1.0, color: Colors.white),
                        ),
                        child: Text(
                          'Crear Cuenta',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        onPressed: () => Get.to(() => EmailCreate(), transition: Transition.rightToLeft),
                      ),
                    ],
                  ),
                )
              ],
            )
          )
        ],
      )
    );
  }
}