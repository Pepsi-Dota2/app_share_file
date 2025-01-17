import 'package:app_share_file/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
              title: LocaleKeys.tutorial_welcome_title.tr(),
              body: LocaleKeys.tutorial_welcome_body.tr(),
              image: const Center(
                child: Icon(Icons.eco, size: 100.0, color: Colors.green),
              ),
            ),
            PageViewModel(
              title: LocaleKeys.tutorial_recycle_title.tr(),
              body: LocaleKeys.tutorial_recycle_body.tr(),
              image: const Center(
                child: Icon(Icons.recycling, size: 100.0, color: Colors.blue),
              ),
            ),
            PageViewModel(
              title: LocaleKeys.tutorial_recycle_title.tr(),
              body: LocaleKeys.tutorial_track_body.tr(),
              image: const Center(
                child: Icon(Icons.bar_chart, size: 100.0, color: Colors.orange),
              ),
            ),
          ],
          onDone: () {
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
