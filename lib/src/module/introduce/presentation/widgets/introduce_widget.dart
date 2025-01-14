import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroduceWidget extends StatelessWidget {
  const IntroduceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Welcome to CleanEarth!",
              body: "Join us in making the planet cleaner and greener by managing waste responsibly.",
              image: const Center(
                child: Icon(Icons.eco, size: 100.0, color: Colors.green),
              ),
            ),
            PageViewModel(
              title: "Recycle and Reuse",
              body: "Learn how to sort waste, recycle materials, and reduce landfill impact.",
              image: const Center(
                child: Icon(Icons.recycling, size: 100.0, color: Colors.blue),
              ),
            ),
            PageViewModel(
              title: "Track Your Impact",
              body: "Monitor your contribution to a cleaner environment and earn rewards for sustainable actions.",
              image: const Center(
                child: Icon(Icons.bar_chart, size: 100.0, color: Colors.orange),
              ),
            ),
          ],
          onDone: () {
              //
          },
          showSkipButton: true,
          skip: TextButton(
            onPressed: () {
              //
            },
            style: TextButton.styleFrom(foregroundColor: Colors.grey),
            child: const Text("Skip"),
          ),
          next: const Icon(Icons.arrow_forward, color: Colors.blueAccent),
          done: const Text(
            "Done",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          dotsDecorator: DotsDecorator(
            size: const Size(8.0, 8.0),
            activeSize: const Size(16.0, 8.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            activeColor: Colors.green,
            color: Colors.grey,
          ),
          globalBackgroundColor: Colors.white,
          allowImplicitScrolling: true,
          animationDuration: 300,
        ),
      ),
    );
  }
}
