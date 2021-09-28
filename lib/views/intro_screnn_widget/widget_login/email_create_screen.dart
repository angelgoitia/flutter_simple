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
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: emailValidator,
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Contraseña'),
                validator: passwordValidator,
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _repeatPasswordController,
                decoration: InputDecoration(labelText: 'Repetir Contraseña'),
                validator: passwordValidator,
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
      ),
    ); 
  }
}
