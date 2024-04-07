import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tele_app/auth_ui/welcome-screen.dart';
import 'package:tele_app/src/config/route.dart';
import 'package:tele_app/src/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

final String localUserId = Random().nextInt(10000).toString();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health Care',
      theme: AppTheme.lightTheme,
      //   routes: Routes.getRoute(),
      //   onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
      //   debugShowCheckedModeBanner: false,
      //   initialRoute: "SplashPage",
      // );
      home: WelcomeScreen(),
      builder: EasyLoading.init(),
    );
  }
}
