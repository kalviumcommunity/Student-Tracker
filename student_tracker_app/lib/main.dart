import 'package:flutter/material.dart';

void main() {
  runApp(const RuralAttendanceApp());
}

class RuralAttendanceApp extends StatelessWidget {
  const RuralAttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rural Attendance Tracker',
      home: const AttendanceScreen(),
    );
  }
}

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  AttendanceScreenState createState() => AttendanceScreenState();
}

class AttendanceScreenState extends State<AttendanceScreen> {
  // Dummy student data (for testing)
  List<Map<String, dynamic>> students = [
    {'name': 'Ramesh', 'present': false},
    {'name': 'Sita', 'present': false},
    {'name': 'Arjun', 'present': false},
    {'name': 'Lakshmi', 'present': false},
  ];

  void toggleAttendance(int index) {
    setState(() {
      students[index]['present'] = !students[index]['present'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance – Squad 74'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04, // responsive padding
          vertical: 8,
        ),
        child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            final student = students[index];

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: InkWell(
                onTap: () => toggleAttendance(index),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          student['name'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(
                        student['present']
                            ? Icons.check_circle
                            : Icons.cancel,
                        color: student['present']
                            ? Colors.green
                            : Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
