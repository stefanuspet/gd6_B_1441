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
    apiKey: 'AIzaSyDIFJ_iZaap0buJapPwVVhqIgSScRr7sP4',
    appId: '1:114303099348:web:a9647c703f0e93e6867641',
    messagingSenderId: '114303099348',
    projectId: 'flutter-firebase-2c1b7',
    authDomain: 'flutter-firebase-2c1b7.firebaseapp.com',
    storageBucket: 'flutter-firebase-2c1b7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAIroUklroXxPEK0EMjOo24ImtHA8jWH1g',
    appId: '1:114303099348:android:3a7c50413680db7a867641',
    messagingSenderId: '114303099348',
    projectId: 'flutter-firebase-2c1b7',
    storageBucket: 'flutter-firebase-2c1b7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA02EY05eXnY160sAR3VeyU3_JZHg7OzLY',
    appId: '1:114303099348:ios:f3e1d19aded59486867641',
    messagingSenderId: '114303099348',
    projectId: 'flutter-firebase-2c1b7',
    storageBucket: 'flutter-firebase-2c1b7.appspot.com',
    iosBundleId: 'com.example.gd6B1441',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA02EY05eXnY160sAR3VeyU3_JZHg7OzLY',
    appId: '1:114303099348:ios:a06187019080263b867641',
    messagingSenderId: '114303099348',
    projectId: 'flutter-firebase-2c1b7',
    storageBucket: 'flutter-firebase-2c1b7.appspot.com',
    iosBundleId: 'com.example.gd6B1441.RunnerTests',
  );
}
