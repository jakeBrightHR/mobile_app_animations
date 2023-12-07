import 'package:flutter/material.dart';
import 'package:mobile_app_animations/challenge_two/circle_clipper.dart';

class ChallengeTwoPartTwo extends StatefulWidget {
  const ChallengeTwoPartTwo({super.key});

  @override
  State<ChallengeTwoPartTwo> createState() => _ChallengeTwoPartTwoState();
}

class _ChallengeTwoPartTwoState extends State<ChallengeTwoPartTwo> with TickerProviderStateMixin {
  late Animation<double> circleSizeAnimation;
  late AnimationController circleSizeAnimationController;

  final Tween<double> circleSizeTween = Tween(begin: 0, end: 2000);

  @override
  void initState() {
    super.initState();
    circleSizeAnimationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    circleSizeAnimation = circleSizeTween.animate(circleSizeAnimationController);
    circleSizeAnimationController.forward();
  }

  @override
  void dispose() {
    circleSizeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: circleSizeAnimation,
        builder: (context, child) {
          return ClipPath(
            clipper: CircleClipper(circleSizeAnimation.value),
            child: const Image(
              image: AssetImage('assets/dog.jpeg'),
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          circleSizeAnimationController.reset();
          circleSizeAnimationController.forward();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
