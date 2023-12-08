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
        return macos;
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
    apiKey: 'AIzaSyBein84gTXzl0RsYT38iqZuhneDvwr_6Jo',
    appId: '1:894212751126:web:173f1ac7443c63777fda37',
    messagingSenderId: '894212751126',
    projectId: 'flutter-bash',
    authDomain: 'flutter-bash.firebaseapp.com',
    storageBucket: 'flutter-bash.appspot.com',
    measurementId: 'G-VXH7NJMP1Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA5XrsqdlPY5OuzNcWsWrVSJx2Z7H7hXCE',
    appId: '1:894212751126:android:5e2cae69326bb0fd7fda37',
    messagingSenderId: '894212751126',
    projectId: 'flutter-bash',
    storageBucket: 'flutter-bash.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1CU7mbOQXx6lpHRpJi3vq2HnohpqH2eY',
    appId: '1:894212751126:ios:5b813acd50bd72d87fda37',
    messagingSenderId: '894212751126',
    projectId: 'flutter-bash',
    storageBucket: 'flutter-bash.appspot.com',
    iosBundleId: 'com.example.flutterBash',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB1CU7mbOQXx6lpHRpJi3vq2HnohpqH2eY',
    appId: '1:894212751126:ios:b3edd59bc81c70db7fda37',
    messagingSenderId: '894212751126',
    projectId: 'flutter-bash',
    storageBucket: 'flutter-bash.appspot.com',
    iosBundleId: 'com.example.flutterBash.RunnerTests',
  );
}