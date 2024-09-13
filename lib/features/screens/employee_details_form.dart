import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:employee_management/features/controllers/form_controller.dart';

class EmployeeDetailsForm extends StatelessWidget {
  const EmployeeDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final FormController controller = Get.put(FormController());

    return Scaffold(
      appBar: AppBar(title: Text('Add Employee')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Obx(() {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.firstNameController,
                          decoration: const InputDecoration(
                            labelText: "Employee First Name",
                            prefixIcon: Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a first name';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 30.0),
                      Expanded(
                        child: TextFormField(
                          controller: controller.lastNameController,
                          decoration: const InputDecoration(
                            labelText: "Employee Last Name",
                            prefixIcon: Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a last name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: controller.idController,
                    decoration: const InputDecoration(
                      labelText: "ID",
                      prefixIcon: Icon(Icons.card_membership),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an ID';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                      labelText: "Email ID",
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      if (!GetUtils.isEmail(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: controller.phoneNumberController,
                    decoration: const InputDecoration(
                      labelText: "Phone Number",
                      prefixIcon: Icon(Icons.phone),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a phone number';
                      }
                      if (!GetUtils.isPhoneNumber(value)) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.districtController,
                          decoration: const InputDecoration(
                            labelText: "District",
                            prefixIcon: Icon(Icons.location_city),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30.0),
                      Expanded(
                        child: TextFormField(
                          controller: controller.stateController,
                          decoration: const InputDecoration(
                            labelText: "State",
                            prefixIcon: Icon(Icons.home),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  if (controller.isLoading.value)
                    const Center(child: CircularProgressIndicator())
                  else
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.submitForm,
                        child: const Text("Add Employee"),
                      ),
                    ),
                  if (controller.errorMessage.value.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        controller.errorMessage.value,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
