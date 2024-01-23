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
    apiKey: 'AIzaSyBtClXQKFLpLqoWZ1JJzcKOkca6LVknDhM',
    appId: '1:839869056398:web:c4ccf15778831c3027d0df',
    messagingSenderId: '839869056398',
    projectId: 'learn-auth-7aee9',
    authDomain: 'learn-auth-7aee9.firebaseapp.com',
    storageBucket: 'learn-auth-7aee9.appspot.com',
    measurementId: 'G-5EGECP5FH9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEWJhFK_iKYqnI7ZBiTFNCxxOQK4Ll2p0',
    appId: '1:839869056398:android:85f4630baac9c24027d0df',
    messagingSenderId: '839869056398',
    projectId: 'learn-auth-7aee9',
    storageBucket: 'learn-auth-7aee9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA9jUnbvZydrRwZo9rvBTLncxM4HZnLMhU',
    appId: '1:839869056398:ios:c48f0d058d0c282d27d0df',
    messagingSenderId: '839869056398',
    projectId: 'learn-auth-7aee9',
    storageBucket: 'learn-auth-7aee9.appspot.com',
    iosBundleId: 'com.pdp.firebase.firebaseG9',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA9jUnbvZydrRwZo9rvBTLncxM4HZnLMhU',
    appId: '1:839869056398:ios:9f2e7a3ab130b4f927d0df',
    messagingSenderId: '839869056398',
    projectId: 'learn-auth-7aee9',
    storageBucket: 'learn-auth-7aee9.appspot.com',
    iosBundleId: 'com.pdp.firebase.firebaseG9.RunnerTests',
  );
}