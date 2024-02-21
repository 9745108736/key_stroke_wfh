import 'package:key_stroke_wfh/features/add_job/add_job_page.dart';
import 'package:key_stroke_wfh/features/authenticaion/pages/login_screen.dart';
import 'package:key_stroke_wfh/features/authenticaion/pages/user_form_screen.dart';
import 'package:key_stroke_wfh/features/dashboard/pages/navigation_tab_pages.dart';

import '../common/constents/common_imports.dart';

final goRouter = GoRouter(navigatorKey: Injector().navigatorKey, routes: [
  GoRoute(
    path: '/',
    name: 'login',
    // builder: (context, state) =>  UserRegistrationScreen(),
    // builder: (context, state) =>  UserFormScreen(),
    // builder: (context, state) => const DashboardPage(),
    // builder: (context, state) =>  AddNewJobScree(),
    builder: (context, state) =>  NavigationTabPages(),
  ),
  GoRoute(
    path: '/adduser',
    name: 'adduser',
    builder: (context, state) =>  UserRegistrationScreen(),
  ),
]);
