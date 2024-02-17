import 'common/constents/common_imports.dart';

class Injector {
  Injector._internal();

  factory Injector() {
    return _singleton;
  }

  static final Injector _singleton = Injector._internal();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
