import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:key_stroke_wfh/common/constents/common_imports.dart';
import 'package:key_stroke_wfh/features/authenticaion/controller/registration_controller.dart';
import 'package:key_stroke_wfh/features/authenticaion/data/models/user_model.dart';
import 'package:key_stroke_wfh/features/jobs/controller/new_job_controller.dart';

import '../../../../common/widgets/alertErrorSuccesPopupWidget.dart';

class FirebaseService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(UserData userData) async {
    await usersCollection.add(userData.toJson());
  }


  final CollectionReference jobCollection =
  FirebaseFirestore.instance.collection('activejobs');

  Future<void> addjob(Job userData) async {
    await jobCollection.add(userData.toJson());
  }

  Future<DocumentSnapshot?> getDocumentByPhoneNumber(String phoneNumber) async {
    final collection = FirebaseFirestore.instance.collection('users');
    final querySnapshot =
        await collection.where('phoneNumber', isEqualTo: phoneNumber).get();
    return querySnapshot.docs.isNotEmpty ? querySnapshot.docs.first : null;
  }

  // code to update with email and phone
  Future<DocumentSnapshot?> getDocumentByCredentials(
      String phoneNumber, String email) async {
    final collection = FirebaseFirestore.instance.collection('users');
    final querySnapshot = await collection
        .where('phoneNumber', isEqualTo: phoneNumber)
        .where('email', isEqualTo: email)
        .get();
    return querySnapshot.docs.isNotEmpty ? querySnapshot.docs.first : null;
  }

  Future<void> updateLastName(
      DocumentSnapshot document, String newLastName) async {
    await document.reference.update({'lastName': newLastName});
  }

  updateFun() async {
    // Get the phone number from the user input
    String phoneNumber = Get.find<FormController>().phoneNumberController.text;

// Retrieve the document
    getDocumentByPhoneNumber(phoneNumber).then((document) {
      if (document != null) {
        // Get the new last name from the user input
        String newLastName = Get.find<FormController>().lastNameController.text;

        // Update the last name
        updateLastName(document, newLastName).then((_) {
          Get.snackbar(
            'Success',
            'Last name updated successfully!',
            snackPosition: SnackPosition.BOTTOM,
          );
        }).catchError((error) {
          showErrorMsgPopup(msg: error.toString());

          // Get.snackbar(
          //   'Error',
          //   error.toString(),
          //   snackPosition: SnackPosition.BOTTOM,
          // );
        });
      } else {
        showErrorMsgPopup(msg: "No user found with the provided phone number!");
        // Get.snackbar(
        //   'Error',
        //   'No user found with the provided phone number!',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
      }
    });
  }

  Future<Map<String, dynamic>?> getUserData(String phoneNumber) async {
    try {
      final document = await getDocumentByPhoneNumber(phoneNumber);
      return document?.data() as Map<String,
          dynamic>?; // Return the data as a Map<String, dynamic>?
    } catch (error) {
      // Handle any errors that occur during retrieval
      print("Error retrieving user data: $error");
      return null; // Return null if an error occurs
    }
  }

  //this used to retrieve data with phone number
  getAllDetailWithPhoneNumber() {
    String phoneNumber = Get.find<FormController>().phoneNumberController.text;

    getUserData(phoneNumber).then((data) {
      if (data != null) {
        String? name = data["firstName"];
        // Access individual fields using data['fieldName']
        // String name = data['firstName'] + ' ' + data['lastName'];
        String email = data['email'];
        // ... access other fields as needed
      } else {
        Get.snackbar(
          'Error',
          'No user found with the provided phone number!',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    });
  }
}
