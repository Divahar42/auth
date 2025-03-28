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
    apiKey: 'AIzaSyDMX1AIDmmceXMTETQ-6xuUNdbkEyqFWgw',
    appId: '1:247675729135:web:41eae40825982b49e7571a',
    messagingSenderId: '247675729135',
    projectId: 'gooo-2082a',
    authDomain: 'gooo-2082a.firebaseapp.com',
    storageBucket: 'gooo-2082a.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2FwedfC5c0dZxgFS22MpQiJs4sRLfkVw',
    appId: '1:247675729135:android:57bba4403e729a2fe7571a',
    messagingSenderId: '247675729135',
    projectId: 'gooo-2082a',
    storageBucket: 'gooo-2082a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCrwkReCPtLNRMiPmadkkpps1GU1Dgq1Zc',
    appId: '1:247675729135:ios:858913dba45b8fcae7571a',
    messagingSenderId: '247675729135',
    projectId: 'gooo-2082a',
    storageBucket: 'gooo-2082a.firebasestorage.app',
    iosClientId: '247675729135-8ovovhgf04hiefcg8k4k3lb6gu031uni.apps.googleusercontent.com',
    iosBundleId: 'com.example.gooo',
  );
}
