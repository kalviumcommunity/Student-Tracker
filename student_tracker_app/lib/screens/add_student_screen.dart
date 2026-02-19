import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';

class AddStudentScreen extends StatelessWidget {
  const AddStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Student")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TextField(decoration: InputDecoration(labelText: "Name")),
            const TextField(decoration: InputDecoration(labelText: "Roll No")),
            const SizedBox(height: 20),
            PrimaryButton(
              label: "Save",
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
