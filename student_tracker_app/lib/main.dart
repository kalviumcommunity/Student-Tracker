import 'package:flutter/material.dart';

void main() {
  runApp(RuralAttendanceApp());
}

class RuralAttendanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rural Attendance Tracker',
      home: AttendanceScreen(),
    );
  }
}

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance – Squad 74'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(students[index]['name']),
            trailing: Icon(
              students[index]['present']
                  ? Icons.check_circle
                  : Icons.cancel,
              color: students[index]['present']
                  ? Colors.green
                  : Colors.red,
            ),
            onTap: () => toggleAttendance(index),
          );
        },
      ),
    );
  }
}
