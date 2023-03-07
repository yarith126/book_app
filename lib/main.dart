import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/splash_screen.dart';
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
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.ralewayTextTheme(),

        // pageTransitionsTheme: PageTransitionsTheme(builders: {
        // TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        // TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        // }),
        primaryColor: Colors.green,
        focusColor: Colors.green,
        primaryTextTheme: TextTheme(labelSmall: TextStyle(fontSize: 25)),
        appBarTheme: AppBarTheme(),
      ),
      // darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      // onGenerateInitialRoutes: (route) {
      //   // if (route == '/deeplink') {
      //   //   return ?;
      //   // }
      //   debugPrint('\x1B[95m ${route} \x1B[0m');
      //   if (route == '/') {
      //     return [
      //       MaterialPageRoute(builder: (_) => SplashScreen()),
      //       MaterialPageRoute(builder: (_) => HomeScreen()),
      //     ];
      //   }
      //   return [MaterialPageRoute(builder: (_) => HomeScreen())]; //unknown
      // },
      // onGenerateRoute: (settings) {
      //   debugPrint('\x1B[95m ${settings.name} \x1B[0m');
      //   if (settings.name == '/login') {
      //     return CupertinoPageRoute(builder: (ctx) => HomeScreen());
      //   }
      //   return MaterialPageRoute(builder: (ctx) => HomeScreen());
      // },
      // onUnknownRoute: (_) {},
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
