import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:key_stroke_wfh/features/dashboard/controller/dashboard_controller.dart';

import '../../../common/constents/common_imports.dart';

class JobListItem extends StatelessWidget {
  final String title;
  final String company;
  final String salary;
  final String balance;

  final VoidCallback onApplyPressed;

  JobListItem(
      {required this.title,
      required this.company,
      required this.salary,
      required this.onApplyPressed,
      required this.balance});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.rectangle,
            ),
            child: const Icon(Icons.work, color: Colors.white),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(company),
                Text("Salary : $salary"),
              ],
            ),
          ),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return (int.parse(balance) >
                            (int.parse(Get.put(DashboardController())
                                .accountBalance
                                .value))) ==
                        true
                    ? PayButton()
                    : ElevatedButton(
                        onPressed: onApplyPressed,
                        child: const Text('Apply'),
                      );
              }),
              SizedBox(
                height: 1.h,
              ),
              MazzardTextWidget(
                text: "Minimum balance : $balance",
                fontSize: 8.sp,
              )
            ],
          ),
        ],
      ),
    );
  }
}
