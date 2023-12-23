// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Eggs extends StatelessWidget {
  final Function onTap;
  const Eggs({
    super.key,
    required this.eggScaleAnimationController,
    required this.eggType,
    required this.eggAnimationController,
    required this.selectedEgg,
    required this.EggScaleAnimation,
    required this.eggUrl,
    required this.thisEggType,
    required this.onTap,
  });

  final AnimationController eggScaleAnimationController;
  final AnimationController eggType;
  final AnimationController eggAnimationController;
  final String selectedEgg;
  final Animation EggScaleAnimation;
  final String eggUrl;
  final String thisEggType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
            onTap: () => {onTap()},
            child: AnimatedBuilder(
              animation: eggScaleAnimationController,
              builder: (context, child) => Transform.scale(
                  scale:
                      selectedEgg == thisEggType ? EggScaleAnimation.value : 1,
                  child: Image.asset(eggUrl)),
            )));
  }
}
