import 'package:flutter/material.dart';
import '../widgets/custom_student_card.dart';
import '../widgets/primary_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Tracker")),
      body: Column(
        children: [
          CustomStudentCard(
            name: "Vijayashree",
            rollNo: "101",
            department: "CSE",
            onTap: () {},
          ),
          CustomStudentCard(
            name: "Arjun",
            rollNo: "102",
            department: "ECE",
            onTap: () {},
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: PrimaryButton(
              label: "Add Student",
              onPressed: () {
                Navigator.pushNamed(context, '/add');
              },
            ),
          ),
        ],
      ),
    );
  }
}
