import 'package:flutter_simple/controller/authController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailCreate extends StatefulWidget {
  static Widget create(BuildContext context) => EmailCreate();

  @override
  _EmailCreateState createState() => _EmailCreateState();
}

class _EmailCreateState extends State<EmailCreate> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  String? emailValidator(String? value) {
    return (value == null || value.isEmpty) ? 'Este es un campo obligatorio' : null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'Este es un campo obligatorio';
    if (value.length < 6) return 'La contraseña debe tener minimo 6 letras';
    if (_passwordController.text != _repeatPasswordController.text) return 'La contraseña no coincide';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(title: Text('Crear Cuenta')),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
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
                  cursorColor: Colors.black,
                  validator: emailValidator,
                ),
                SizedBox(height: 8),
                Obx(
                  () => new TextFormField(
                    controller: _passwordController,
                    maxLines: 1,
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    obscureText: authController.passwordVisibleCreate.value,
                    decoration: new InputDecoration(
                      labelText: "Contraseña",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          authController.passwordVisibleCreate.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                          color: Colors.black,
                          ),
                        onPressed: () =>authController.passwordVisibleCreate.value = !authController.passwordVisibleCreate.value,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    cursorColor: Colors.black,
                    validator: passwordValidator,
                  ),
                ),
                SizedBox(height: 8),
                Obx(
                  () => new TextFormField(
                    controller: _repeatPasswordController,
                    maxLines: 1,
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    obscureText: authController.passwordVisibleCreateConfirm.value,
                    decoration: new InputDecoration(
                      labelText: "Repetir Contraseña",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          authController.passwordVisibleCreateConfirm.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                          color: Colors.black,
                          ),
                        onPressed: () =>authController.passwordVisibleCreateConfirm.value = !authController.passwordVisibleCreateConfirm.value,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    cursorColor: Colors.black,
                    validator: passwordValidator,
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    child: const Text('Crear Cuenta'),
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        authController.createUserWithEmailAndPassword(
                              _emailController.text,
                              _passwordController.text,
                            );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    ); 
  }
}
