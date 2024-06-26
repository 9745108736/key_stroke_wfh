import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:key_stroke_wfh/common/constents/common_imports.dart';
import 'package:key_stroke_wfh/common/widgets/mazzard_widget.dart';
import 'package:key_stroke_wfh/features/authenticaion/data/service/firebase_service.dart';
import 'package:key_stroke_wfh/features/jobs/controller/new_job_controller.dart';
import 'package:key_stroke_wfh/features/jobs/widgets/job_tile_widget.dart';

class ActiveJobsPage extends StatefulWidget {
  @override
  State<ActiveJobsPage> createState() => _ActiveJobsPageState();
}

class _ActiveJobsPageState extends State<ActiveJobsPage> {
  final JobController jobController = Get.put(JobController());

  @override
  void initState() {
    super.initState();
    jobController.fetchJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => jobController.jobs.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  height: .3.h,
                ),
                itemCount: jobController.jobs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: JobListItem(
                      balance: jobController.jobs[index].balance,
                      title: jobController.jobs[index].title,
                      company: jobController.jobs[index].company,
                      onApplyPressed: () async {
                        jobController.addNewJobOnGoing(
                          balance: jobController.jobs[index].balance,
                          title: jobController.jobs[index].title,
                          company: jobController.jobs[index].company,
                          salary: jobController.jobs[index].salary,
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
                      salary: jobController.jobs[index].salary,
                    ),
                  );
                },
              ),
      ),
    );
  }
}
