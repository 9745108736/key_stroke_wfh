import 'package:flutter/foundation.dart';

consolePrint({dynamic value}) {
  // return;
  if (kReleaseMode == true) {
    // Is Release Mode??

    return debugPrint(value.toString());
  }
}
