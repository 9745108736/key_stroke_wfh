import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:key_stroke_wfh/common/constents/common_imports.dart';
import 'package:key_stroke_wfh/common/widgets/header_widgets.dart';
import 'package:key_stroke_wfh/features/jobs/controller/new_job_controller.dart';
import 'package:key_stroke_wfh/features/jobs/pages/active_jobs_page.dart';
import 'package:key_stroke_wfh/features/jobs/widgets/job_tile_widget.dart';

import '../../dashboard/controller/dashboard_controller.dart';
import '../widgets/common_balance_header_widget.dart';

class JobsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTabs(),
    );
  }
}

class MyTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CommonBalancHeaderWidget(),
            )
          ],
          centerTitle: false,
          title: const HeaderWidget(
            title: "Jobs",
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'New Jobs'),
              Tab(text: 'Ongoing  Jobs'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ActiveJobsPage(),
            CompletedJobsPage(),
          ],
        ),
      ),
    );
  }
}

class CompletedJobsPage extends StatefulWidget {
  @override
  State<CompletedJobsPage> createState() => _CompletedJobsPageState();
}

class _CompletedJobsPageState extends State<CompletedJobsPage> {
  final JobController jobController = Get.put(JobController());

  @override
  void initState() {
    super.initState();
    jobController.getAllActiveJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<JobController>(
        builder: (controller) {
          // Wrap the entire widget tree that depends on observable variables with Obx
          return controller.onGoingjobList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    height: .3.h,
                  ),
                  itemCount: controller.onGoingjobList.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Each item in the list is wrapped with Obx
                    return Container(
                      child: JobListItem(
                        balance: controller.onGoingjobList[index].balance,
                        title: controller.onGoingjobList[index].title,
                        company: controller.onGoingjobList[index].company,
                        onApplyPressed: () async {
                          controller.addNewJobOnGoing(
                            balance: controller.onGoingjobList[index].balance,
                            title: controller.onGoingjobList[index].title,
                            company: controller.onGoingjobList[index].company,
                            salary: controller.onGoingjobList[index].salary,
                          );
                        },
                        salary: controller.onGoingjobList[index].salary,
                      ),
                    );
                  },
                );
        },
      ),
    );

    return Scaffold(
        body: Obx(
      () => jobController.onGoingjobList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              separatorBuilder: (context, index) => Divider(
                height: .3.h,
              ),
              itemCount: jobController.onGoingjobList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: JobListItem(
                    balance: jobController.onGoingjobList[index].balance,
                    title: jobController.onGoingjobList[index].title,
                    company: jobController.onGoingjobList[index].company,
                    onApplyPressed: () async {
                      jobController.addNewJobOnGoing(
                        balance: jobController.onGoingjobList[index].balance,
                        title: jobController.onGoingjobList[index].title,
                        company: jobController.onGoingjobList[index].company,
                        salary: jobController.onGoingjobList[index].salary,
                      );
                      return;
                      // final userData = Job(
                      //     title: jobController.jobs[index].title,
                      //     company: jobController.jobs[index].company,
                      //     salary: jobController.jobs[index].salary,
                      //     balance: jobController.jobs[index].balance);
                      // await FirebaseService()
                      //     .updateUserJobData("9745108733", jobs: [userData]);
                    },
                    salary: jobController.onGoingjobList[index].salary,
                  ),
                );
              },
            ),
    ));
  }
}
