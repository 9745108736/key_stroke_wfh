import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:key_stroke_wfh/common/constents/common_imports.dart';
import 'package:key_stroke_wfh/common/widgets/mazzard_widget.dart';
import 'package:key_stroke_wfh/features/dashboard/controller/dashboard_controller.dart';

class CommonBalancHeaderWidget extends StatelessWidget {
  const CommonBalancHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MazzardTextWidget(
        text:
            "Balance : ₹${Get.put(DashboardController()).accountBalance.value}",
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        color: ColorData.corporateBlack,
      ),
    );
  }
}
