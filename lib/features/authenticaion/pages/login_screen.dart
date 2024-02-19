import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../common/constents/common_imports.dart';
import '../controller/registration_controller.dart';

class UserRegistrationScreen extends StatelessWidget {
  final formController = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: formController.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: formController.phoneNumberController,
                validator: formController.validatePhoneNumber,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: formController.emailController,
                validator: formController.validateEmail,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: formController.firstNameController,
                validator: formController.validateFirstName,
                decoration: InputDecoration(
                  labelText: 'First Name',
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: formController.lastNameController,
                validator: formController.validateLastName,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                ),
              ),
              SizedBox(height: 20.0),
              Obx(
                () => ElevatedButton(
                  onPressed: formController.isLoading.value
                      ? null
                      : formController.submitForm,
                  child: Text(
                      formController.isLoading.value ? 'Loading...' : 'Submit'),
                ),
              ),
              Obx(
                () => ElevatedButton(
                  onPressed: formController.isLoading.value
                      ? null
                      : formController.updateLastName,
                  child: Text("Update number"),
                ),
              ),
              Obx(
                () => ElevatedButton(
                  onPressed: formController.isLoading.value
                      ? null
                      : formController.getAllDetailWithPhoneNumber,
                  child: Text("get data with number"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
