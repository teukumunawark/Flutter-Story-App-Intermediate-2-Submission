import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ButtonLoading extends StatelessWidget {
  const ButtonLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: kPrimary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Center(
          child: CircularProgressIndicator(
        backgroundColor: kBackground,
      )),
    );
  }
}
