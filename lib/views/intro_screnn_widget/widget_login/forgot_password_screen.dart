import 'package:flutter_simple/controller/authController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  static Widget create(BuildContext context) => ForgotPassword();

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  
  String? emptyValidator(String? value) {
    return (value == null || value.isEmpty) ? 'Este es un campo obligatorio' : null;
  }

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    return Scaffold(
        appBar: AppBar(title: Text('Olvido de contraseña')),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFC2EBAC),
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
              image: AssetImage("assets/Fondo_Militar.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    validator: emptyValidator,
                    cursorColor: Colors.black,
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: ElevatedButton(
                      child: const Text('Recuperar cuenta'),
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          authController.forgotPassword(
                                _emailController.text,
                              );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        )
    );
  }
}
