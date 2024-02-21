import 'package:flutter/material.dart';

import '../constents/common_imports.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return MazzardTextWidget(
      text: title ?? "Home",
      fontWeight: FontWeight.w600,
      fontSize: 15.5.sp,
      color: ColorData.corporateBlack,
    );
  }
}
