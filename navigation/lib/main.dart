import 'package:flutter/material.dart';
import 'package:navigation/SignUp.dart';
import 'package:navigation/login.dart';
import 'package:navigation/splash.dart';

// Firebase part
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:navigation/widget_tree.dart';
import 'package:navigation/auth.dart';

import 'firebase_options.dart';

Future main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Application name
      title: 'House Keeping',
      theme: ThemeData(
        // Application theme data, you can set the colors for the application as
        // you want
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //final String title;
  //const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            //title: Text(widget.title),
            ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60.0, bottom: 15),
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
                left: 15.0, right: 15.0, top: 5, bottom: 20),
            child: Text(
              'House Keeping App',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5), //You can use EdgeInsets like above
            margin: EdgeInsets.all(5),
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Color(0xffF1C40F),
                borderRadius: BorderRadius.circular(10)),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Login()));
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5), //You can use EdgeInsets like above
            margin: EdgeInsets.all(5),
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Color(0xffF1C40F),
                borderRadius: BorderRadius.circular(10)),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Signup()));
              },
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ])));
  }
}
