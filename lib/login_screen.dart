import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  var _isLogin = true;
  var _enteredEmail = '';
  var _enteredPassword = '';
  void _submit() {
    final _isvaild = _form.currentState!.validate();

    if (_isvaild) {
      _form.currentState!.save();
      print(_enteredEmail);
      print(_enteredPassword);
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
                                      : Icons.lock_open))),
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
                            _isLogin ? 'Login' : 'Signin',
                            style: GoogleFonts.poppins().copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Column(
                          children: [
                            Text('Dont have any account'),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => SignupScreen()));
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(100, 30),
                                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                                ),
                                child: Text(
                                  'Signup',
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


// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     bool _isLogin = false;
//     return Scaffold(
//             backgroundColor: Theme.of(context).colorScheme.primary,
//         body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(
//                   top: 30,
//                   bottom: 20,
//                   left: 20,
//                   right: 20,
//                 ),
//                 width: 200
//               ),
//               Card(
//                 margin: const EdgeInsets.all(20),
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: Form(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           TextFormField(
//                             decoration: const InputDecoration(
//                                 labelText: 'Email Address'),
//                             keyboardType: TextInputType.emailAddress,
//                             autocorrect: false,
//                             textCapitalization: TextCapitalization.none,
//                             validator: (value) {
//                               if (value == null || value.trim().isEmpty || !value.contains('@')){
//                                 return 'Please enter a valid email Id.';
//                               }
//                             },
//                           ),
//                           TextFormField(
//                             decoration:
//                                 const InputDecoration(labelText: 'Password'),
//                             obscureText: true,
//                             validator:(value) {
//                              if (value == null || value.trim().length < 6){
//                                 return 'Password should be atleast 6 digit';
//                               }
//                             },
//                           ),
//                           const SizedBox(height: 20),
//                           ElevatedButton(
//                             onPressed: () {},
//                             style: ElevatedButton.styleFrom(
//                               fixedSize: Size(500, 30),
//                               backgroundColor: Color.fromARGB(255, 0, 0, 0),
//                             ),
//                             child: Text(_isLogin ? 'Login' : 'Signin',style: GoogleFonts.poppins().copyWith(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                       ),
//                           ),
//                           Column(
//                             children: [
//                               Text('Dont have any account'),
//                             ElevatedButton(onPressed: (){}, child: Text('Signup',style: GoogleFonts.poppins().copyWith(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),))
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


