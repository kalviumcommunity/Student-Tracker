import 'package:flutter/material.dart';

class ResponsiveHome extends StatefulWidget {
  const ResponsiveHome({super.key});

  @override
  State<ResponsiveHome> createState() => _ResponsiveHomeState();
}

class _ResponsiveHomeState extends State<ResponsiveHome> {
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
    final screenHeight = MediaQuery.of(context).size.height;

    bool isTablet = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance – Squad 74'),
        backgroundColor: Colors.green,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.01,
        ),
        child: isTablet
            // Tablet Layout (Grid)
            ? GridView.builder(
                itemCount: students.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return buildStudentCard(index);
                },
              )
            // Phone Layout (List)
            : ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return buildStudentCard(index);
                },
              ),
      ),

      // Footer Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              backgroundColor: Colors.green,
            ),
            child: const Text(
              "Submit Attendance",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStudentCard(int index) {
    final student = students[index];

    return Card(
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
                color:
                    student['present'] ? Colors.green : Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
