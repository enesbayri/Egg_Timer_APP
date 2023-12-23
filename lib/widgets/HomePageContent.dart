// ignore_for_file: file_names, non_constant_identifier_names

import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_14/notification_config/NotificationController.dart';
import 'package:flutter_application_14/widgets/eggStatusText.dart';
import 'package:flutter_application_14/widgets/eggs.dart';
import 'package:flutter_application_14/widgets/progressBar.dart';
import 'package:flutter_application_14/widgets/progressBarText.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent>
    with TickerProviderStateMixin {
  late AnimationController HighEgg;
  late AnimationController MidEgg;
  late AnimationController SoftEgg;
  late AnimationController controller;
  late Animation Textanimation;
  late AnimationController eggStatusTextAnimationController;
  bool stopTextAnimation = true;
  String selectedEgg = "";

  late Animation EggScaleAnimation;
  late AnimationController eggScaleAnimationController;

  double timeBar = 0;
  String eggStatusText = "Yumurta Tipini Seçiniz!";
  bool timeCounterWidget = false;
  String timeCounterWidgetText = "";

  @override
  void initState() {
    NotificationController.notificationSetListeners();

    NotificationController.notificationPermission();

    super.initState();
    eggStatusTextAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    Textanimation = Tween<double>(begin: -50, end: 50).animate(CurvedAnimation(
        parent: eggStatusTextAnimationController, curve: Curves.bounceIn));

    eggScaleAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    EggScaleAnimation = Tween<double>(begin: 1, end: 1.2).animate(
        CurvedAnimation(
            parent: eggScaleAnimationController, curve: Curves.linear));

    controller = createAnimationController(10);
    HighEgg = createAnimationController(600);
    MidEgg = createAnimationController(420);
    SoftEgg = createAnimationController(300);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Eggs(
                  onTap: () {
                    selectEggType(SoftEgg);
                  },
                  eggScaleAnimationController: eggScaleAnimationController,
                  eggType: SoftEgg,
                  eggAnimationController: eggScaleAnimationController,
                  selectedEgg: selectedEgg,
                  EggScaleAnimation: EggScaleAnimation,
                  eggUrl: "assets/eggs/soft_egg.png",
                  thisEggType: "Az pişmiş"),
              const SizedBox(
                width: 10,
              ),
              Eggs(
                  onTap: () {
                    selectEggType(MidEgg);
                  },
                  eggScaleAnimationController: eggScaleAnimationController,
                  eggType: MidEgg,
                  eggAnimationController: eggScaleAnimationController,
                  selectedEgg: selectedEgg,
                  EggScaleAnimation: EggScaleAnimation,
                  eggUrl: "assets/eggs/medium_egg.png",
                  thisEggType: "Orta pişmiş"),
              const SizedBox(
                width: 10,
              ),
              Eggs(
                  onTap: () {
                    selectEggType(HighEgg);
                  },
                  eggScaleAnimationController: eggScaleAnimationController,
                  eggType: HighEgg,
                  eggAnimationController: eggScaleAnimationController,
                  selectedEgg: selectedEgg,
                  EggScaleAnimation: EggScaleAnimation,
                  eggUrl: "assets/eggs/hard_egg.png",
                  thisEggType: "Tam pişmiş"),
            ],
          ),
        ),
        EggStatusText(
            eggStatusTextAnimationController: eggStatusTextAnimationController,
            stopTextAnimation: stopTextAnimation,
            Textanimation: Textanimation,
            eggStatusText: eggStatusText),
        timeCounterWidget ? progressBar(timeBar: timeBar) : Container(),
        ProgressBarText(timeCounterWidgetText: timeCounterWidgetText),
      ],
    );
  }

  AnimationController createAnimationController(int duration) {
    return AnimationController(
      vsync: this,
      duration: Duration(seconds: duration),
      lowerBound: 0,
      upperBound: 1,
    );
  }

  @override
  void dispose() {
    HighEgg.dispose();
    SoftEgg.dispose();
    MidEgg.dispose();
    controller.dispose();
    eggScaleAnimationController.dispose();
    eggScaleAnimationController.dispose();

    super.dispose();
  }

  void alarm(int yumurtaSuresi) async {
    Future.delayed(
      Duration(seconds: yumurtaSuresi),
      () async {
        String eggUrl="assets/eggs/";
        eggUrl+=(selectedEgg=="Az pişmiş"? "soft_egg.png" : (selectedEgg=="Orta pişmiş"? "medium_egg.png":"hard_egg.png"));
        NotificationController.sendNotification("Yumurta Hazır!","$selectedEgg yumurtanız hazır",eggUrl);
        eggStatusText = "Yumurtanız hazır!";
        timeCounterWidgetText = "Yumurta pişti!";
        stopTextAnimation = false;
        eggStatusTextAnimationController.forward();
        eggStatusTextAnimationController.addStatusListener(
          (status) {
            if (status == AnimationStatus.completed) {
              eggStatusTextAnimationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              eggStatusTextAnimationController.forward();
            }
          },
        );
        final player = AudioPlayer();
        await player.play(AssetSource("sounds/EggTimer_alarm_sound.mp3"));
        player.play(AssetSource("sounds/EggTimer_alarm_sound.mp3"));
        player.play(AssetSource("sounds/EggTimer_alarm_sound.mp3"));
      },
    );
  }

  void selectEggType(AnimationController eggType) {
    controller.reset();
    String egg = eggType.duration!.inSeconds == 300
        ? "Az pişmiş"
        : (eggType.duration!.inSeconds == 420 ? "Orta pişmiş" : "Tam pişmiş");
    selectedEgg = egg;
    timeCounterWidgetText = "Pişirmeye devam edin!";
    eggStatusText = "$egg yumurtaniz pişiyor!";
    timeCounterWidget = true;
    eggScaleAnimationController.forward();
    eggScaleAnimationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          eggScaleAnimationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          eggScaleAnimationController.forward();
        }
      },
    );
    controller = eggType;
    controller.forward();
    eggStatusTextAnimationController.stop();
    stopTextAnimation = true;
    alarm(controller.duration!.inSeconds);
    controller.addListener(() {
      setState(() {
        timeBar = controller.value;
      });
    });
  }
}
