// import 'dart:html';
//import 'dart:ffi';

import 'package:navigation/SignUp.dart';
import 'package:navigation/splash.dart';
import 'package:flutter/material.dart';
import 'package:navigation/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:navigation/auth.dart';

Auth _firebaseAuth = Auth();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _success = false;
  late String _userEmail;
  late bool _loading;
  late bool _passwordVisible;

  String _errorMessage = 'There was a problem, try again.';

  @override
  initState() {
    if (_firebaseAuth.currentUser != null) {
      Navigator.of(context).pushNamed('/');
    }
    // TODO: implement initState
    super.initState();
  }

  Future<void> _login() async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          _emailController.text.trim(), _passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message!;
      });
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/logo.png')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 10),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter secure password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 10),
              child: TextButton(
                onPressed: () {
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5), //You can use EdgeInsets like above
              margin: EdgeInsets.all(5),
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Color(0xffb5b50d),
                  borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () {
                  // It returns true if the form is valid, otherwise returns false
                  if (_formkey.currentState!.validate()) {
                    // If the form is valid, display a Snackbar.
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Color.fromARGB(255, 8, 206, 255),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        content: const Text(
                          'loading...',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                    _login().then((value) {
                      setState(() {
                        _success = true;
                      });
                      if (_firebaseAuth.currentUser != null) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomeScreen()));
                        // Navigator.of(context).pushNamed('/');
                      }
                    }).catchError((e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.red.shade400,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          content: Text(
                            _errorMessage,
                            style: const TextStyle(
                                fontSize: 24, color: Colors.white),
                          ),
                        ),
                      );
                    });
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Color.fromARGB(255, 252, 252, 252), fontSize: 24),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 15.0, top: 15, bottom: 10),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomeScreen()));
                },
                child: Text(
                  'I’m a new user. Sign Up',
                  style: TextStyle(color: Color(0xffb5b50d), fontSize: 15),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
