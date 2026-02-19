import 'package:flutter/material.dart';

class CustomStudentCard extends StatelessWidget {
  final String name;
  final String rollNo;
  final String department;
  final VoidCallback onTap;

  const CustomStudentCard({
    super.key,
    required this.name,
    required this.rollNo,
    required this.department,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.teal,
          child: Text(name[0], style: const TextStyle(color: Colors.white)),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Roll No: $rollNo\nDept: $department"),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
