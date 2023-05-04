// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:navigation/firebase_options.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAhuSsAVtnqbhGi_ly4mPQMArqsH6sySk0',
    appId: '1:672597479717:web:495d8ae66ed710d0d54acc',
    messagingSenderId: '672597479717',
    projectId: 'house-keeping-efa97',
    authDomain: 'house-keeping-efa97.firebaseapp.com',
    storageBucket: 'house-keeping-efa97.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBMoRLMY3Au-vLzoeBmCgz_pUzV4hizDD4',
    appId: '1:672597479717:android:276e605d5a78d0b1d54acc',
    messagingSenderId: '672597479717',
    projectId: 'house-keeping-efa97',
    storageBucket: 'house-keeping-efa97.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHAafGlHwRukqhlgbizj822PnCg7LPXUY',
    appId: '1:672597479717:ios:99a8147848016ba4d54acc',
    messagingSenderId: '672597479717',
    projectId: 'house-keeping-efa97',
    storageBucket: 'house-keeping-efa97.appspot.com',
    iosClientId:
        '672597479717-j9or2k17442iqsagk5vlvhn9i3so8q18.apps.googleusercontent.com',
    iosBundleId: 'com.example.clickCounter',
  );
}
