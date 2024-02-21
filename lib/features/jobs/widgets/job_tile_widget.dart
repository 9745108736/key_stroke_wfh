import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../../../common/constents/common_imports.dart';

class JobListItem extends StatelessWidget {
  final String title;
  final String company;
  final String salary;
  final VoidCallback onApplyPressed;

  const JobListItem({
    required this.title,
    required this.company,
    required this.salary,
    required this.onApplyPressed,
  });

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
              ElevatedButton(
                onPressed: onApplyPressed,
                child: const Text('Apply'),
              ),
              SizedBox(height: 1.h,),
              MazzardTextWidget(
                text: "Minimum balance : 300",
                fontSize: 8.sp,
              )
            ],
          ),
        ],
      ),
    );
  }
}
