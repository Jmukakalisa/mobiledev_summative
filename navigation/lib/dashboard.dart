import 'dart:html';
import 'package:navigation/SignUp.dart';
import 'package:navigation/splash.dart';
import 'package:navigation/laundry.dart';
import 'package:flutter/material.dart';
import 'package:navigation/clean.dart';

class dashboard extends StatelessWidget {
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
                  color: Color(0xffF1C40F),
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 5, bottom: 35),
            child: Text(
              'Choose a Service',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              width: 300,
              height: 350,
              child: Stack(children: <Widget>[
                Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(241, 196, 15, 1),
                          border: Border.all(
                            color: Color.fromRGBO(241, 196, 15, 1),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ))),
                Positioned(
                  top: 32,
                  left: 12,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => FirestoreScreen()));
                      },
                      child: Text(
                        'Do your Laundry',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Poppins',
                            fontSize: 28,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      )),
                ),
                Positioned(
                    top: 65,
                    left: 20,
                    child: Text(
                      'Choose a helper to do your laundry ',
                      textAlign: TextAlign.left,
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
                  top: 110,
                  left: 3,
                  child: Container(
                      width: 300,
                      height: 170,
                      /*decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50.0)),*/
                      child: Image.asset('assets/images/Rectangle 45.png')),
                ),
              ])),
          Container(
              width: 300,
              height: 350,
              child: Stack(children: <Widget>[
                Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(241, 196, 15, 1),
                          border: Border.all(
                            color: Color.fromRGBO(241, 196, 15, 1),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ))),
                Positioned(
                  top: 32,
                  left: 12,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Clean()));
                      },
                      child: Text(
                        'Clean your House',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Poppins',
                            fontSize: 28,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      )),
                ),
                Positioned(
                    top: 65,
                    left: 20,
                    child: Text(
                      'Choose a helper to clean your house',
                      textAlign: TextAlign.left,
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
                  top: 110,
                  left: 3,
                  child: Container(
                      width: 300,
                      height: 170,
                      /*decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50.0)),*/
                      child: Image.asset('assets/images/Rectangle 48.png')),
                ),
              ])),
        ])));
  }
}
