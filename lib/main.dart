import 'dart:io';

import 'package:book_app/utils/route_helper.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'views/splash_screen.dart';
import 'global_variables.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  _setSystemUIOverlay();
  _fetchApiLevel();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.green,
        focusColor: Colors.green,
        primaryTextTheme: TextTheme(labelSmall: TextStyle(fontSize: 25)),
        appBarTheme: AppBarTheme(),
      ),
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}

void _setSystemUIOverlay() {
  var brightness = SchedulerBinding.instance.window.platformBrightness;
  bool isDarkMode = brightness == Brightness.dark;
  if (isDarkMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ));
  } else {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ));
  }
}

_fetchApiLevel() async {
  // final prefs = await SharedPreferences.getInstance();
  // int? apiLevel = prefs.getInt('apiLevel');
  // if(apiLevel == null) {
  //   try {
  //     apiLevel = await DeviceInformation.apiLevel;
  //     await prefs.setInt('apiLevel', apiLevel ?? 0);
  //   } on PlatformException {
  //     await prefs.setInt('apiLevel', 0);
  //   }
  // }
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    var deviceData = {};
    var build = await deviceInfoPlugin.androidInfo;
    apiLevel = build.version.sdkInt;
  }
}
