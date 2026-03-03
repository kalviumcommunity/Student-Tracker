import 'package:flutter/material.dart';
import '../widgets/app_info_card.dart';

class DetailsScreen extends StatelessWidget{
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
        children: const [
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
