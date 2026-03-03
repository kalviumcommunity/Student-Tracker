import 'package:flutter/material.dart';

class AppInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const AppInfoCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance Summary'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          AppInfoCard(
            title: "Student Records",
            subtitle: "View daily attendance logs",
            icon: Icons.check_circle,
          ),
          AppInfoCard(
            title: "Monthly Report",
            subtitle: "Attendance performance summary",
            icon: Icons.bar_chart,
          ),
          AppInfoCard(
            title: "Settings",
            subtitle: "Manage your account preferences",
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }
}
