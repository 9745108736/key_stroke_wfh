import '../../../common/constents/common_imports.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final PaymentController assessmentControllerObs =
      Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: MazzardTextWidget(
            text: "WFH",
            fontWeight: FontWeight.w400,
            fontSize: 12.5.sp,
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
                    height: 22.h,
                    child: Padding(
                      padding: EdgeInsets.all(1.h),
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
                              Spacer(),
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
                            MazzardTextWidget(
                              text: "100",
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w800,
                              color: ColorData.whiteF0,
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
                                text: "100",
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
            )
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
