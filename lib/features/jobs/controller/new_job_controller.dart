import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../common/constents/common_imports.dart';

class Job {
  final String title;
  final String company;
  final String salary;
  final String balance;

  Job(
      {required this.title,
      required this.company,
      required this.salary,
      required this.balance});

  Map<String, dynamic> toJson() => {
        'title': title,
        'company': company,
        'salary': salary,
        'balance': balance
      };
}

class JobController extends GetxController {
  var jobs = <Job>[].obs;

  Future<void> fetchJobs() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('activejobs').get();

      jobs.assignAll(querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data()!;
        return Job(
            title: data['title'] ?? '',
            company: data['company'] ?? '',
            salary: data['salary'] ?? '',
            balance: data['balance'] ?? '');
      }).toList());
    } catch (error) {
      // Handle error as needed
      print('Error fetching jobs: $error');
    }
  }
}
