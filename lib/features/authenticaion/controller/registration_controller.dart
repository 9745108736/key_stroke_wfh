import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:key_stroke_wfh/common/widgets/alertErrorSuccesPopupWidget.dart';
import 'package:key_stroke_wfh/features/authenticaion/data/service/firebase_service.dart';

import '../../../common/constents/common_imports.dart';
import '../data/models/user_model.dart';

class FormController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  RxBool isLoading = false.obs;

  String? validatePhoneNumber(String? value) {
    if (value?.isEmpty == true) {
      return 'Phone number is required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value?.isEmpty == true) {
      return 'Email is required';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+")
        .hasMatch(value ?? "")) {
      return 'Invalid email format';
    }
    return null;
  }

  String? validateFirstName(String? value) {
    if (value?.isEmpty == true) {
      return 'First name is required';
    }
    return null;
  }

  String? validateLastName(String? value) {
    if (value?.isEmpty == true) {
      return 'Last name is required';
    }
    return null;
  }

  getAllDetailWithPhoneNumber() async {
    await FirebaseService().getAllDetailWithPhoneNumber();
  }
  updateLastName() async {
    await FirebaseService().updateFun();
  }

  Future<void> submitForm() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      isLoading.value = true;
      try {
        final userData = UserData(
            phoneNumber: phoneNumberController.text,
            email: emailController.text,
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            amount: "0",
            mobilepin: '0000');
        await FirebaseService().addUser(userData);
        isLoading.value = false;
        showSuccessMsgPopup(msg: 'User data saved successfully!');
        // Get.snackbar(
        //   'Success',
        //   'User data saved successfully!',
        //   snackPosition: SnackPosition.BOTTOM,
        // );
      } catch (error) {
        isLoading.value = false;
        showErrorMsgPopup(msg: error.toString());
        // Get.snackbar(
        //   'Error',
        //   error.toString(),
        //   snackPosition: SnackPosition.BOTTOM,
        // );
      }
    }
  }
}
