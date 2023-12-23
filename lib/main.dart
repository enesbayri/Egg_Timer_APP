

import 'package:flutter/material.dart';
import 'package:flutter_application_14/notification_config/NotificationController.dart';
import 'package:flutter_application_14/pages/homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationController.initialize();
  runApp(const EggTimerApp());
}

class EggTimerApp extends StatelessWidget {
  const EggTimerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Egg Timer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}


