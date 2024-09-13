import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormController extends GetxController {
  // TextEditingControllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final idController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final districtController = TextEditingController();
  final stateController = TextEditingController();

  // Observable variables
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // Form Key for validation
  final formKey = GlobalKey<FormState>();

  Future<void> submitForm() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    // Update loading state
    isLoading.value = true;
    errorMessage.value = '';

    final url = 'https://669b3f09276e45187d34eb4e.mockapi.io/api/v1/employee'; // Replace with your API endpoint

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'first_name': firstNameController.text,
          'last_name': lastNameController.text,
          'id': idController.text,
          'email': emailController.text,
          'phone_number': phoneNumberController.text,
          'district': districtController.text,
          'state': stateController.text,
        }),
      );

      if (response.statusCode == 200) {
        // Handle successful response
        Get.snackbar('Success', 'Employee added successfully');
        clearForm();
      } else {
        // Handle response error
        errorMessage.value = 'Failed to add employee. Please try again.';
      }
    } catch (e) {
      // Handle exception
      errorMessage.value = 'An error occurred. Please try again.';
    } finally {
      // Update loading state
      isLoading.value = false;
    }
  }

  void clearForm() {
    firstNameController.clear();
    lastNameController.clear();
    idController.clear();
    emailController.clear();
    phoneNumberController.clear();
    districtController.clear();
    stateController.clear();
  }
}
