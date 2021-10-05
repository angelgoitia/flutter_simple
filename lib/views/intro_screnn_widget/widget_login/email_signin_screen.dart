import 'package:flutter_simple/controller/authController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailSignIn extends StatefulWidget {
  static Widget create(BuildContext context) => EmailSignIn();

  @override
  _EmailSignInState createState() => _EmailSignInState();
}

class _EmailSignInState extends State<EmailSignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? emptyValidator(String? value) {
    return (value == null || value.isEmpty) ? 'This is a required field' : null;
  }

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    return Scaffold(
        appBar: AppBar(title: Text('Login with Email')),
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
                  Obx(
                    () => new TextFormField(
                      controller: _passwordController,
                      maxLines: 1,
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      obscureText: authController.passwordVisible.value,
                      decoration: new InputDecoration(
                        labelText: "Contraseña",
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            authController.passwordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                            color: Colors.black,
                            ),
                          onPressed: () =>authController.passwordVisible.value = !authController.passwordVisible.value,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      cursorColor: Colors.black,
                      validator: emptyValidator,
                    ),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          authController.signInWithEmailAndPassword(
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
        )
    );
  }
}
