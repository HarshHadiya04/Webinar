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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBFNYLnKiADzORVjLb6eJL9wEA0qTZcH4E',
    appId: '1:417438031438:web:487d59b14522c0f151ad1f',
    messagingSenderId: '417438031438',
    projectId: 'webinar-app-cef7f',
    authDomain: 'webinar-app-cef7f.firebaseapp.com',
    storageBucket: 'webinar-app-cef7f.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD-y_5cdhNJmGm7MRWSUuJSV9UPqmXOkVs',
    appId: '1:417438031438:android:05f5cdc1893dd33351ad1f',
    messagingSenderId: '417438031438',
    projectId: 'webinar-app-cef7f',
    storageBucket: 'webinar-app-cef7f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2LGHQNQd2X_XpvyYQE6425bfVa014jQo',
    appId: '1:417438031438:ios:d6078febad85037e51ad1f',
    messagingSenderId: '417438031438',
    projectId: 'webinar-app-cef7f',
    storageBucket: 'webinar-app-cef7f.firebasestorage.app',
    iosBundleId: 'com.example.modernlogintute',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD2LGHQNQd2X_XpvyYQE6425bfVa014jQo',
    appId: '1:417438031438:ios:d6078febad85037e51ad1f',
    messagingSenderId: '417438031438',
    projectId: 'webinar-app-cef7f',
    storageBucket: 'webinar-app-cef7f.firebasestorage.app',
    iosBundleId: 'com.example.modernlogintute',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBFNYLnKiADzORVjLb6eJL9wEA0qTZcH4E',
    appId: '1:417438031438:web:a2763273bba2d17651ad1f',
    messagingSenderId: '417438031438',
    projectId: 'webinar-app-cef7f',
    authDomain: 'webinar-app-cef7f.firebaseapp.com',
    storageBucket: 'webinar-app-cef7f.firebasestorage.app',
  );
}
