import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:key_stroke_wfh/common/widgets/header_widgets.dart';
import 'package:key_stroke_wfh/features/dashboard/widgets/automatic_scroll_widget.dart';

import '../../../common/constents/common_imports.dart';
import '../controller/dashboard_controller.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final PaymentController assessmentControllerObs =
      Get.put(PaymentController());
  final dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorData.corporateWhite,
      appBar: AppBar(
          centerTitle: true,
          title: const HeaderWidget(
            title: "Home",
          )),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(2.w),
          child: Column(children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorData.corporateThemeColor,
                    ),
                    // height: MediaQuery.of(context).size.height * .22,
                    child: Padding(
                      padding: EdgeInsets.all(2.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              MazzardTextWidget(
                                text: "Account Balance",
                                fontWeight: FontWeight.w300,
                                fontSize: 13.5.sp,
                                color: ColorData.corporateWhite,
                              ),
                              const Spacer(),
                              MazzardTextWidget(
                                text: assessmentControllerObs.phoneNumber,
                                color: ColorData.whiteF0,
                                fontWeight: FontWeight.w100,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(children: [
                            Icon(Icons.currency_rupee,
                                color: ColorData.corporateWhite),
                            Obx(
                              () => MazzardTextWidget(
                                text: Get.put(DashboardController())
                                    .lastName
                                    .value,
                                // text: dashboardController.lastName.value ?? "",
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w800,
                                color: ColorData.whiteF0,
                              ),
                            ),
                            const Spacer(),
                            PayButton(
                              onPressed: () {
                                assessmentControllerObs.openCheckout();
                              },
                            )
                          ]),
                          SizedBox(
                            height: 1.h,
                          ),
                          MazzardTextWidget(
                            text:
                                "(This is the overall balance in your wallet. recharge your wallet to add money)",
                            fontWeight: FontWeight.w100,
                            color: ColorData.whiteF0,
                            fontStyle: FontStyle.italic,
                            fontSize: 9.5.sp,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MazzardTextWidget(
                                text: "Today earnings",
                                color: ColorData.whiteF0,
                              ),
                              MazzardTextWidget(
                                text: "${AppStrings.rupeesSign} 0",
                                color: ColorData.whiteF0,
                                fontWeight: FontWeight.w100,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: SizedBox(
                height: 2.5.h,
                // color: ColorData.,
                width: 100.w,
                child: Row(
                  children: [
                    Container(
                      width: 1.w,
                      height: double.infinity,
                      color: ColorData.corporateThemeColor,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    MazzardTextWidget(
                      text: "Our Recent Income Recipients",
                      color: ColorData.corporateBlack,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                    )
                  ],
                ),
              ),
            ),
            Expanded(child: MyListView())
          ]),
        ),
      ),
    );
  }
}

class PayButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PayButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: ColorData.forestgreenColor,
        padding: EdgeInsets.symmetric(horizontal: 2.6.w, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: MazzardTextWidget(
        text: 'Recharge',
        fontWeight: FontWeight.w400,
        fontSize: 12.5.sp,
        color: ColorData.corporateWhite,
      ),
    );
  }
}
