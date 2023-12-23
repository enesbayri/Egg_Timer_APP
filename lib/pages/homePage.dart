
// ignore_for_file: avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_14/ui_helper/ui_colorHelper.dart';
import 'package:flutter_application_14/ui_helper/ui_textstyleHelper.dart';
import 'package:flutter_application_14/widgets/HomePageContent.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
      title: Text(
        "Yumurta Zamanlayıcı",
        style: TextStyleHelper.appbarTextStyle,
      ),
      backgroundColor: ColorHelper.bgColor,
      actions: [
        Icon(
          Icons.timer,
          color: ColorHelper.timerIconColor,
          size: 32,
        )
      ],
    ),
      backgroundColor: ColorHelper.bgColor,
      body: Container(child: const HomePageContent()),
    );
  }
}
