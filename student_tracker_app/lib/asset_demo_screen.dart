import 'package:flutter/material.dart';

class AssetDemoScreen extends StatelessWidget {
  const AssetDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assets Demo"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            /// BANNER IMAGE
            Image.asset(
              'assets/images/banner.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),

            /// LOGO
            Image.asset(
              'assets/images/logo.png',
              width: 120,
              height: 120,
            ),

            const SizedBox(height: 20),

            const Text(
              "Powered by Flutter",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            /// ICONS ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [

                Icon(Icons.flutter_dash,
                    color: Colors.blue,
                    size: 40),

                SizedBox(width: 20),

                Icon(Icons.android,
                    color: Colors.green,
                    size: 40),

                SizedBox(width: 20),

                Icon(Icons.apple,
                    color: Colors.grey,
                    size: 40),
              ],
            ),

            const SizedBox(height: 30),

            /// LOCAL ICON IMAGE
            Image.asset(
              'assets/icons/star.png',
              width: 60,
            ),
          ],
        ),
      ),
    );
  }
}