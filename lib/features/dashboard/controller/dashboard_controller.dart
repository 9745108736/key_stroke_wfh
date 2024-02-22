import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:key_stroke_wfh/common/utils/common_print_util.dart';

import '../../../common/constents/common_imports.dart';

class DashboardController extends GetxController {
  final RxString accountBalance = RxString('');

// ... inside FormController
  final Stream<QuerySnapshot<Map<String, dynamic>>> userStream =
      FirebaseFirestore.instance
          .collection('users')
          .where('phoneNumber', isEqualTo: "9745108733"
              // Get.find<UserController>().phoneNumber
              )
          .snapshots();

  @override
  void onReady() {
    super.onReady();
    consolePrint(value: "onready called");
    userStream.listen((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        final documentSnapshot = querySnapshot.docs.first;
        final data = documentSnapshot.data();
        accountBalance.value = data['amount'] as String;
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    consolePrint(value: "oninit called");
  }
}
