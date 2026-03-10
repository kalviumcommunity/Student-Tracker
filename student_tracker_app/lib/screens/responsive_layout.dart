import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    bool isTablet = width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Tracker"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            /// HEADER
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "Student Dashboard",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// RESPONSIVE SECTION
            Expanded(
              child: isTablet
                  ? Row(
                      children: [
                        buildCard("Attendance", Icons.check_circle, Colors.green),
                        const SizedBox(width: 12),
                        buildCard("Assignments", Icons.assignment, Colors.orange),
                        const SizedBox(width: 12),
                        buildCard("Profile", Icons.person, Colors.purple),
                      ],
                    )
                  : Column(
                      children: [
                        buildCard("Attendance", Icons.check_circle, Colors.green),
                        const SizedBox(height: 12),
                        buildCard("Assignments", Icons.assignment, Colors.orange),
                        const SizedBox(height: 12),
                        buildCard("Profile", Icons.person, Colors.purple),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String title, IconData icon, Color color) {
    return Expanded(
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(icon, size: 40, color: Colors.white),

            const SizedBox(height: 10),

            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}