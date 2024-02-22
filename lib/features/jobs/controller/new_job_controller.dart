import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:key_stroke_wfh/features/authenticaion/data/service/firebase_service.dart';

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

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      title: json['title'],
      company: json['company'],
      salary: json['salary'],
      balance: json['balance'],
    );
  }

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

  List<Job> onGoingjobList = [];

  Future<void> getAllActiveJobs() async {
    try {
      var _data =
          await FirebaseService().getActiveJobs(phonenumber: '9745108733');
      print("getAllActiveJobs data - $_data");
      String _va = json.decode(_data);
      String jsonList = json.decode(_data);
      List<Map<String, dynamic>> dataList =
          List<Map<String, dynamic>>.from(jsonDecode(jsonList));

      for (var data in dataList) {
        Job job = Job(
          title: data['title'],
          company: data['company'],
          salary: (data['salary']),
          balance: (data['balance']),
        );
        onGoingjobList.add(job);
      }

      print("json list - and dataList - ${onGoingjobList.length} ");
      print("json list - and dataList - ${onGoingjobList.length} ");

      // List<Map<String, dynamic>> jobsList = List<Map<String, dynamic>>.from(json.decode(_data));

      // List<Map<String, dynamic>> jobsList = (json.decode(_data) as List)
      //     .map((item) => item as Map<String, dynamic>)
      //     .toList();
      // print("jobsList - ${dataList.length}");
      update();
    } catch (error) {
      print("Error in getAllActiveJobs: $error");
      // Handle error as needed
    }
  }

  addNewJobOnGoing({String? title, company, salary, balance}) async {
    await FirebaseService().addJobFun(job: [
      Job(
          title: title ?? "",
          company: company ?? "",
          salary: salary,
          balance: balance)
    ], currentJobCost: int.parse(balance));
  }
}
