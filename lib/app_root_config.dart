
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:key_stroke_wfh/common/utils/colors.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'common/constents/common_imports.dart';

class AppRootConfig extends StatefulWidget {
  const AppRootConfig({super.key});

  @override
  State<AppRootConfig> createState() => _AppRootConfigState();
}

class _AppRootConfigState extends State<AppRootConfig> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        routerConfig: goRouter,
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(primary: ColorData.corporateThemeOrangeColor),
          primarySwatch: Colors.brown,
        ),
        builder: (context, child) {
          child = ResponsiveBreakpoints.builder(child: child!, breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            const Breakpoint(start: 0, end: 1245, name: "Res")
          ]);
          child = EasyLoading.init()(context, child);
          return child;
        },
      );
    });
  }
}
