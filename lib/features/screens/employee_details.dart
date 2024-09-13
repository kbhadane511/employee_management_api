import 'package:flutter/material.dart';
import '../models/employee.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final Employee employee;

  const EmployeeDetailsScreen({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black
            ),
            const SizedBox(height: 16),
            Text(
              employee.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              employee.mobile,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),

            Text(
              employee.id,
              style: const TextStyle(fontSize: 18),
            ),
            
            const SizedBox(height: 16),
            Text(
              employee.createdAt,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Text(
              employee.emailId,
              style: const TextStyle(fontSize: 18),
            ),            
            const SizedBox(height: 8),

            Text(
              employee.country,
              style: const TextStyle(fontSize: 18),
            ),            
            const SizedBox(height: 16),

            Text(
              employee.state,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Text(
              employee.district,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
