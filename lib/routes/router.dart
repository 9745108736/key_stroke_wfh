import '../common/constents/common_imports.dart';

final goRouter = GoRouter(navigatorKey: Injector().navigatorKey, routes: [
  GoRoute(
    path: '/',
    name: 'login',
    builder: (context, state) => const DashboardPage(),
  ),
]);
