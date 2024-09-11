import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/employee.dart';

class EmployeeController extends GetxController {
  var employees = <Employee>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchEmployees();
    super.onInit();
  }

  Future<void> fetchEmployees() async {
    isLoading(true);
    try {
      final response = await http.get(Uri.parse('https://669b3f09276e45187d34eb4e.mockapi.io/api/v1/employee'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        employees.value = data.map((json) => Employee.fromJson(json)).toList();
      } else {
        errorMessage.value = 'Failed to load employees';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading(false);
    }
  }
}
