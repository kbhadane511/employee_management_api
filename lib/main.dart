import 'package:employee_management/features/controllers/employee_controller.dart';
import 'package:employee_management/features/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(EmployeeController()); // Dependency injection for GetX

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Employee Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
