import 'package:flutter/material.dart';
import 'package:key_stroke_wfh/common/constents/common_imports.dart';
import 'package:key_stroke_wfh/common/widgets/header_widgets.dart';
import 'package:key_stroke_wfh/features/jobs/pages/active_jobs_page.dart';


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
        appBar: AppBar(centerTitle: true,
          title:  const HeaderWidget(
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



class CompletedJobsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Completed Jobs Page Content'),
    );
  }
}
