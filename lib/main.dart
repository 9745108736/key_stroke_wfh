import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:key_stroke_wfh/app_root_config.dart';
import 'package:key_stroke_wfh/common/firebase_app/firebase_dev_config.dart';
import 'package:key_stroke_wfh/features/payment/pages/payment_screen.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  // Injector.configure(Flavor.DEV);
  await Firebase.initializeApp(
    options: FirebaseDevConfig.currentPlatform,
  );
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) {
        return const AppRootConfig();
      }));
}

