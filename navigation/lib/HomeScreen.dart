import 'dart:html';
import 'package:navigation/SignUp.dart';
import 'package:navigation/splash.dart';
import 'package:flutter/material.dart';
import 'package:navigation/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:navigation/auth.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("House Keeping"),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
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
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 5, bottom: 10),
            child: Text(
              'Your Personal Help',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              width: 300,
              height: 400,
              child: Stack(children: <Widget>[
                Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                        width: 300,
                        height: 400,
                        decoration: BoxDecoration(
                          color:
                              Color.fromRGBO(241, 196, 15, 0.30000001192092896),
                          border: Border.all(
                            color: Color.fromRGBO(241, 196, 15, 1),
                            width: 1,
                          ),
                        ))),
                Positioned(
                    top: 32,
                    left: 32,
                    child: Text(
                      'Start a subscription',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.bold,
                          height: 1),
                    )),
                Positioned(
                    top: 93,
                    left: 21,
                    child: Text(
                      'Are you living a busy life wondering\nhow you will take care of your life,\nhouse and laundry? ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
                Positioned(
                    top: 200,
                    left: 31,
                    child: Text(
                      'Were here to help, so you never\nhave to be bothered about\ngetting things done.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
                Positioned(
                    top: 318,
                    left: 31,
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Color(0xffF1C40F),
                          border: Border.all(
                            color: Color.fromRGBO(241, 196, 15, 1),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => dashboard()));
                        },
                        child: Text(
                          'Start a subscription',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    )),
              ])),
        ])));
  }
}
