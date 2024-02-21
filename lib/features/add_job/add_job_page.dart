import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:key_stroke_wfh/features/authenticaion/controller/registration_controller.dart';

import '../../../common/constents/common_imports.dart';

//this page to add new jobs to the application
class AddNewJobScree extends StatelessWidget {
  final formController = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new jobs'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: formController.formKey,
          child: Column(
            children: [
              SizedBox(height: 10.0),
              TextFormField(
                controller: formController.emailController,
                // validator: formController.validateEmail,
                decoration: InputDecoration(
                  labelText: 'title',
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: formController.firstNameController,
                validator: formController.validateFirstName,
                decoration: InputDecoration(
                  labelText: 'Work Tool',
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: formController.lastNameController,
                validator: formController.validateLastName,
                decoration: InputDecoration(
                  labelText: 'Salary',
                ),
              ),
              TextFormField(
                controller: formController.phoneNumberController,
                validator: formController.validateLastName,
                decoration: InputDecoration(
                  labelText: 'Balance',
                ),
              ),
              SizedBox(height: 20.0),
              Obx(
                () => ElevatedButton(
                  onPressed: formController.isLoading.value
                      ? null
                      : formController.addNewJob,
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
