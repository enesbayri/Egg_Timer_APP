
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_14/ui_helper/ui_textstyleHelper.dart';

class ProgressBarText extends StatelessWidget {
  const ProgressBarText({
    super.key,
    required this.timeCounterWidgetText,
  });

  final String timeCounterWidgetText;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: MediaQuery.of(context).size.height * 0.15,
        child: SizedBox(
            height: 30,
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: Text(
              timeCounterWidgetText,
              style: TextStyleHelper.timeCounterTextStyle,
            ))));
  }
}
