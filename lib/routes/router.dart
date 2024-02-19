import 'package:key_stroke_wfh/features/authenticaion/pages/login_screen.dart';
import 'package:key_stroke_wfh/features/authenticaion/pages/user_form_screen.dart';

import '../common/constents/common_imports.dart';

final goRouter = GoRouter(navigatorKey: Injector().navigatorKey, routes: [
  GoRoute(
    path: '/',
    name: 'login',
    // builder: (context, state) =>  UserRegistrationScreen(),
    // builder: (context, state) =>  UserFormScreen(),
    builder: (context, state) => const DashboardPage(),
  ),
]);
