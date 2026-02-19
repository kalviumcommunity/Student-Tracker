import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'add_student_screen.dart';

class ResponsiveHome extends StatelessWidget {
  const ResponsiveHome({super.key});

  void toggleAttendance(String docId, bool currentStatus) {
    FirebaseFirestore.instance
        .collection('students')
        .doc(docId)
        .update({'present': !currentStatus});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Tracker – Squad 74'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddStudentScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('students')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator());
          }

          if (!snapshot.hasData ||
              snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("No students added yet"),
            );
          }

          final students = snapshot.data!.docs;

          int totalPresent = students
              .where((doc) => doc['present'] == true)
              .length;

          return Column(
            children: [
              const SizedBox(height: 10),
              Text(
                "Total Present: $totalPresent",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    final doc = students[index];
                    final name = doc['name'];
                    final present = doc['present'];

                    return Card(
                      child: ListTile(
                        title: Text(name),
                        trailing: Icon(
                          present
                              ? Icons.check_circle
                              : Icons.cancel,
                          color: present
                              ? Colors.green
                              : Colors.red,
                        ),
                        onTap: () =>
                            toggleAttendance(doc.id, present),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
