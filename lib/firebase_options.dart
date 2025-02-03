// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyCjLQWMSc6o_kiytHBFKuC48l8NJ7ML1dk',
    appId: '1:1992337227:web:dbd0f41269dab4c58aeace',
    messagingSenderId: '1992337227',
    projectId: 'weatherauthapp',
    authDomain: 'weatherauthapp.firebaseapp.com',
    storageBucket: 'weatherauthapp.firebasestorage.app',
    measurementId: 'G-EG2VJC2H8C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCzt071JRnDDe_0g3f8ZPwCfncLLA_cc_w',
    appId: '1:1992337227:android:ea2636b9a4a861138aeace',
    messagingSenderId: '1992337227',
    projectId: 'weatherauthapp',
    storageBucket: 'weatherauthapp.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC03PHefyzNf-DC6blhCbulaBUQK87lvjo',
    appId: '1:1992337227:ios:8e56efd8ff7ff99f8aeace',
    messagingSenderId: '1992337227',
    projectId: 'weatherauthapp',
    storageBucket: 'weatherauthapp.firebasestorage.app',
    iosBundleId: 'com.example.weatherAuthApp',
  );
}
