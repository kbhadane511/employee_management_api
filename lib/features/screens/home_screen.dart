import 'package:employee_management/features/screens/employee_details.dart';
import 'package:employee_management/features/screens/employee_details_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/employee_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EmployeeController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Management'),
        actions: [
          IconButton(onPressed: (){
            Get.off( EmployeeDetailsForm());
          }, icon: const Icon(Icons.add_circle)),
        ],
        ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Search by ID',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // Implement search logic here
                },
              ),
            ),
            
            Expanded(
              child: ListView.builder(
                itemCount: controller.employees.length,
                itemBuilder: (context, index) {
                  final employee = controller.employees[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(employee.avatar),
                    ),
                    title: Text(employee.name),
                    subtitle: Text(employee.mobile),
                    onTap: () {
                      Get.to(() => EmployeeDetailsScreen(employee: employee));
                    },
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
