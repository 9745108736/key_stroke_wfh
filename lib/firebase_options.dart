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
    apiKey: 'AIzaSyBflnpII3ahz8d6lkQ1m9KVddbAwy88QTg',
    appId: '1:3341695032:web:b2fd6bd08ef9de444fcecd',
    messagingSenderId: '3341695032',
    projectId: 'key-stroke-wfh',
    authDomain: 'key-stroke-wfh.firebaseapp.com',
    storageBucket: 'key-stroke-wfh.appspot.com',
    measurementId: 'G-NF6W3FKKXR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6Y7X2KcfowVxdtWc1FvHKDTCw87Wub8I',
    appId: '1:3341695032:android:786f265ed1dd66754fcecd',
    messagingSenderId: '3341695032',
    projectId: 'key-stroke-wfh',
    storageBucket: 'key-stroke-wfh.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBD16CY4R7KWA5wQy0aIE2YFALFjoti3Hs',
    appId: '1:3341695032:ios:e9997a92c11700784fcecd',
    messagingSenderId: '3341695032',
    projectId: 'key-stroke-wfh',
    storageBucket: 'key-stroke-wfh.appspot.com',
    iosBundleId: 'com.keystroke.wfh.keyStrokeWfh',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBD16CY4R7KWA5wQy0aIE2YFALFjoti3Hs',
    appId: '1:3341695032:ios:ace0a2cc4f88273a4fcecd',
    messagingSenderId: '3341695032',
    projectId: 'key-stroke-wfh',
    storageBucket: 'key-stroke-wfh.appspot.com',
    iosBundleId: 'com.keystroke.wfh.keyStrokeWfh.RunnerTests',
  );
}
