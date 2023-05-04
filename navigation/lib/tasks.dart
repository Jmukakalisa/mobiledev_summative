import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:navigation/auth.dart';
//import 'package:navigation/SignUp.dart';
import 'package:navigation/firebase_options.dart';
import 'package:navigation/main.dart';
//import 'package:navigation/splash.dart';
import 'package:flutter/material.dart';
//import 'package:navigation/meet_helper.dart';

Future main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});
  static const String _title = 'Activities';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CollectionReference _referenceShoppingList =
      FirebaseFirestore.instance.collection('clean');

  late Stream<QuerySnapshot> _StreamShoppingItems;

  @override
  void initState() {
    super.initState();
    _StreamShoppingItems = _referenceShoppingList.snapshots();
    _referenceShoppingList.get();
    _referenceShoppingList.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activities'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _StreamShoppingItems,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (snapshot.connectionState == ConnectionState.active) {
            QuerySnapshot querySnapshot = snapshot.data;
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
