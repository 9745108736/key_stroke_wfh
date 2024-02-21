import 'dart:math';

import 'package:flutter/material.dart';
import 'package:key_stroke_wfh/common/constents/common_imports.dart';

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  final ScrollController _controller = ScrollController();

  // Single data item to be repeated
  final String data = "Your data here";

  @override
  void initState() {
    super.initState();
    _startScrolling();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startScrolling() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
      double currentOffset = _controller.offset;
      double maxOffset = _controller.position.maxScrollExtent;

      // Calculate scroll amount based on a percentage of the list height
      double scrollAmount = maxOffset * 0.1; // Adjust percentage as needed

      // Check if reaching the end
      if (currentOffset >= maxOffset) {
        // Reset scroll position to beginning
        _controller.jumpTo(0);
      } else {
        // Scroll as usual

        if (_controller.hasClients) {
          _controller.animateTo(
            _controller.position.maxScrollExtent,
            duration: Duration(seconds: 3),
            curve: Curves.ease,
          );
        }

        // _controller.animateTo(
        //   currentOffset + scrollAmount,
        //   duration: const Duration(milliseconds: 500),
        //   curve: Curves.ease,
        // );
      }
    }
  }

  String generateRandomPhoneNumber() {
    Random random = Random();

    // Generate the first digit (6 to 9)
    int firstDigit = random.nextInt(4) + 6;

    // Generate the remaining 5 digits
    int remainingDigits = random.nextInt(100000);

    // Concatenate the first digit with the remaining digits
    String phoneNumber =
        '$firstDigit${remainingDigits.toString().padLeft(5, '0')}';

    return phoneNumber;
  }

  double generateRandomAmount() {
    Random random = Random();

    // Generate a random number between 1000 and 100000
    double amount = (random.nextInt(99001) + 1000).toDouble();

    // Round the amount to the nearest 100
    amount = (amount / 100).round() * 100;

    return amount;
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: false,
      trackVisibility: false,
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          height: .3.h,
        ),
        controller: _controller,
        itemCount: 100,
        // Large number to create continuous loop
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: .5.h),
            child: ListTile(
              hoverColor: ColorData.black27,
              iconColor: ColorData.adminRedStatusColor,
              leading: Icon(
                Icons.work,
                size: 12.5.sp,
              ),
              title: MazzardTextWidget(
                text: "${generateRandomPhoneNumber()}******",
                fontWeight: FontWeight.w400,
                fontSize: 13.5.sp,
                color: ColorData.corporateBlack,
              ),
              trailing: MazzardTextWidget(
                text: "₹ ${generateRandomAmount()}",
                fontWeight: FontWeight.w300,
                fontSize: 13.5.sp,
                color: ColorData.corporateThemeColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
