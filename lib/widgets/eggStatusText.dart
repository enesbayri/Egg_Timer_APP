
// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_14/ui_helper/ui_textstyleHelper.dart';

class EggStatusText extends StatelessWidget {
  const EggStatusText({
    super.key,
    required this.eggStatusTextAnimationController,
    required this.stopTextAnimation,
    required this.Textanimation,
    required this.eggStatusText,
  });

  final AnimationController eggStatusTextAnimationController;
  final bool stopTextAnimation;
  final Animation Textanimation;
  final String eggStatusText;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: AnimatedBuilder(
            animation: eggStatusTextAnimationController,
            builder: (context, child) => Transform.rotate(
                  angle: stopTextAnimation ? 0 : 3.14 / Textanimation.value,
                  child: Text(
                    eggStatusText,
                    style: TextStyleHelper.eggStatusTextStyle,
                  ),
                )));
  }
}
