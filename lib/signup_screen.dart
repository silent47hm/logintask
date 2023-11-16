import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/login_screen.dart';
import 'package:login/user_image_picker.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() {
    return _SignupScreenState();
  }
}

class _SignupScreenState extends State<SignupScreen> {
  final _form = GlobalKey<FormState>();
  var isPasswordVisible = false;
  var _isLogin = true;
  var _enteredEmail = '';
  var _enteredPassword = '';
  File? _selectedImage;
  var _isAuthenticating = false;

  void _submit() async {
    final isVaild = _form.currentState!.validate();
    if (isVaild) {
      _form.currentState!.save();
    }
  }

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Colors.white,
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _form,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        UserImagePicker(
                          onPickImage: (pickedImage) {
                            _selectedImage = pickedImage;
                          },
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Full Name'),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            if (value == null || value.trim().length < 4) {
                              return 'Password should be atleast 4 digit';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredEmail = value!;
                          },
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Email Address'),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                !value.contains('@')) {
                              return 'Please enter a valid email Id.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredEmail = value!;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                onPressed: togglePasswordVisibility,
                                icon: Icon(isPasswordVisible
                                    ? Icons.lock
                                    : Icons.lock_open),
                              )),
                          obscureText: isPasswordVisible,
                          validator: (value) {
                            if (value == null || value.trim().length < 6) {
                              return 'Password should be atleast 6 digit';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredPassword = value!;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              suffixIcon: IconButton(
                                onPressed: togglePasswordVisibility,
                                icon: Icon(isPasswordVisible
                                    ? Icons.lock
                                    : Icons.lock_open),
                              )),
                          obscureText: isPasswordVisible,
                          validator: (value) {
                            if (value == null || value.trim().length < 6) {
                              return 'Password should be atleast 6 digit';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _enteredPassword = value!;
                          },
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _submit,
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(500, 30),
                            backgroundColor: Color.fromARGB(255, 0, 0, 0),
                          ),
                          child: Text(
                            _isLogin ? 'Signin' : 'Login',
                            style: GoogleFonts.poppins().copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Column(
                          children: [
                            const Text('Already Have a account'),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => const LoginScreen()));
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(100, 30),
                                  backgroundColor:
                                      const Color.fromARGB(255, 0, 0, 0),
                                ),
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.poppins().copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ))
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
