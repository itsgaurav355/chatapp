// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
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
    apiKey: 'AIzaSyDCBs1SKLCSvS1Q9_pIzARVosvWyOQWYpw',
    appId: '1:145177440607:web:84ba8ee299cf9ac3fac6ea',
    messagingSenderId: '145177440607',
    projectId: 'chatapp-bf616',
    authDomain: 'chatapp-bf616.firebaseapp.com',
    storageBucket: 'chatapp-bf616.appspot.com',
    measurementId: 'G-PVQE4K7FFP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAnGvisnzn7lvk0iH01VO_E9_fe1T5YZ5Y',
    appId: '1:145177440607:android:2daf17b39a8e9a80fac6ea',
    messagingSenderId: '145177440607',
    projectId: 'chatapp-bf616',
    storageBucket: 'chatapp-bf616.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCKWZstWbGhtuYFjDH4NsQ6S3Tnrpvm0c',
    appId: '1:145177440607:ios:31914ae95f22fb7cfac6ea',
    messagingSenderId: '145177440607',
    projectId: 'chatapp-bf616',
    storageBucket: 'chatapp-bf616.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );
}