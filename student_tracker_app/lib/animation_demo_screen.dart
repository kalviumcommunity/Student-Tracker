import 'package:flutter/material.dart';
import 'next_page.dart';

class AnimationDemoScreen extends StatefulWidget {
  const AnimationDemoScreen({super.key});

  @override
  State<AnimationDemoScreen> createState() => _AnimationDemoScreenState();
}

class _AnimationDemoScreenState extends State<AnimationDemoScreen> {

  bool _toggled = false;

  void toggleAnimation() {
    setState(() {
      _toggled = !_toggled;
    });
  }

  void openNextPage() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const NextPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {

          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
            ),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Animation Demo"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /// Animated Container
            AnimatedContainer(
              width: _toggled ? 200 : 120,
              height: _toggled ? 120 : 200,
              color: _toggled ? Colors.teal : Colors.orange,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: const Center(
                child: Text(
                  "Tap Button",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 40),

            /// Animated Opacity
            AnimatedOpacity(
              opacity: _toggled ? 1.0 : 0.3,
              duration: const Duration(seconds: 1),
              child: Image.asset(
                'assets/images/logo.png',
                width: 120,
              ),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: toggleAnimation,
              child: const Text("Start Animation"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: openNextPage,
              child: const Text("Open Next Page"),
            )
          ],
        ),
      ),
    );
  }
}