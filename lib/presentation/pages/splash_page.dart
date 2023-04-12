import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../routes/app_route.dart';
import '../utils/constants.dart';
import '../utils/token_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 1), () async {
      String? token = await getToken();
      if (token != null && token.isNotEmpty) {
        router.goNamed('home', extra: {'token': token});
      } else {
        router.goNamed('login');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: DefaultTextStyle(
            style: kHeading2.copyWith(fontSize: 20),
            child: AnimatedTextKit(
              pause: const Duration(microseconds: 2),
              isRepeatingAnimation: true,
              animatedTexts: [
                RotateAnimatedText('Create memories'),
                RotateAnimatedText('share experiences'),
                RotateAnimatedText(' inspire others.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
