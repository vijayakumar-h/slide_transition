import 'package:flutter/material.dart';

class SlideAnimationScreen extends StatefulWidget {
  const SlideAnimationScreen({super.key});

  @override
  State<SlideAnimationScreen> createState() => _SlideAnimationScreenState();
}

class _SlideAnimationScreenState extends State<SlideAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    offset = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, 1.0),
    ).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slide animation"),
      ),
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
              child: const Text("Show / Hide"),
              onPressed: () {
                switch (controller.status) {
                  case AnimationStatus.completed:
                    controller.reverse();
                    break;
                  case AnimationStatus.dismissed:
                    controller.forward();
                  default:
                }
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: offset,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.red.shade300,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                    child: Text(
                      "No internet connection found",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
