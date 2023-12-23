// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_14/ui_helper/ui_colorHelper.dart';

class progressBar extends StatelessWidget {
  const progressBar({
    super.key,
    required this.timeBar,
  });

  final double timeBar;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.15,
      child: SizedBox(
        height: 30,
        width: MediaQuery.of(context).size.width,
        child: LinearProgressIndicator(
          value: timeBar,
          backgroundColor: ColorHelper.progressBarBgColor,
          color: ColorHelper.progressBarCompleteColor,
          minHeight: 30,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
