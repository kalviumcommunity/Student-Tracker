import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  void addStudent() async {
    if (_formKey.currentState!.validate()) {
      await FirebaseFirestore.instance.collection('students').add({
        'name': nameController.text.trim(),
        'present': false,
        'createdAt': Timestamp.now(),
      });

      nameController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Student Added")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Student")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration:
                    const InputDecoration(labelText: "Student Name"),
                validator: (value) =>
                    value == null || value.isEmpty
                        ? "Enter student name"
                        : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: addStudent,
                child: const Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
