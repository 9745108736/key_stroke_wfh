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
                    height: 20.h,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: [
                            Icon(Icons.currency_rupee,
                                color: ColorData.corporateWhite),
                            MazzardTextWidget(
                              text: "100",
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w800,
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
                          )
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
        text: 'Pay',
        fontWeight: FontWeight.w400,
        fontSize: 12.5.sp,
        color: ColorData.corporateWhite,
      ),
    );
  }
}
