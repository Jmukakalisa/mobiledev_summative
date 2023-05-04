import 'package:navigation/update.dart';
import 'package:navigation/login.dart';
import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:navigation/auth.dart';
import 'package:navigation/SignUp.dart';
import 'package:navigation/splash.dart';
import 'package:flutter/material.dart';
import 'package:navigation/meet_helper.dart';
import 'package:navigation/utils.dart';

class Clean extends StatefulWidget {
  const Clean({Key? key}) : super(key: key);

  @override
  State<Clean> createState() => _CleanScreen();
}

class _CleanScreen extends State<Clean> {
  final _tasksController = TextEditingController();
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance.collection('clean');

  @override
  void dispose() {
    _tasksController.dispose();
  }

  Future addUserDetails(String tasks) async {
    await FirebaseFirestore.instance.collection('clean').add({
      'tasks': tasks,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("House Keeping"),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                // <-- SEE HERE
                decoration: BoxDecoration(color: const Color(0xffF1C40F)),
                accountName: Text(
                  "",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                ),
                title: const Text('Personal Information'),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Update()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.notification_add,
                ),
                title: const Text('Notifications'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.security,
                ),
                title: const Text('Privacy and Security'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.book,
                ),
                title: const Text('Terms and Conditions'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                ),
                title: const Text('LogOut'),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Login()));
                },
              ),
            ],
          ),
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
              'Clean your House',
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
              'Describe your task',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              width: 350,
              height: 300,
              child: Stack(children: <Widget>[
                Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                        width: 340,
                        height: 250,
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
                  left: 15,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Signup()));
                      },
                      child: Text(
                        'Where are you cleaning?',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Poppins',
                            fontSize: 26,
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
                      'Describe in details where\nyou want to clean',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xff292828),
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
                Positioned(
                  top: 120,
                  left: 20,
                  child: Container(
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Color(0xffe7e4e4),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: TextFormField(
                      controller: _tasksController,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: '2 rooms...'),
                    ),
                  ),
                ),
              ])),
          Container(
            padding: EdgeInsets.all(5), //You can use EdgeInsets like above
            margin: EdgeInsets.all(5),
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Color(0xffF1C40F),
                borderRadius: BorderRadius.circular(10)),
            child: TextButton(
              onPressed: () async {
                String id = DateTime.now().millisecondsSinceEpoch.toString();
                fireStore.doc(id).set({
                  'tasks': _tasksController.text.toString(),
                  'id': id
                }).then((value) {
                  setState(() {
                    loading = false;
                  });
                  Utils().toastMessage('activity added');
                }).onError((error, stackTrace) {
                  setState(() {
                    loading = false;
                  });
                  Utils().toastMessage(error.toString());
                });
                if (FirebaseFirestore.instance != null) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => meet_helper()));
                } else {
                  Navigator.of(context).pushNamed('/signin');
                }

                // Navigator.push(
                //     context, MaterialPageRoute(builder: (_) => meet_helper()));
              },
              child: Text(
                'Find a Helper',
                style: TextStyle(color: Color(0xff000000), fontSize: 24),
              ),
            ),
          ),
        ])));
  }
}
