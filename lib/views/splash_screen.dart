import 'dart:io';

import 'package:book_app/main.dart' as main;
import 'package:book_app/utils/route_helper.dart';
import 'package:book_app/views/home/home_screen.dart';
import 'package:book_app/views/login_screen.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'welcome_screen.dart';
import 'package:book_app/global_variables.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final _conScale = AnimationController(
      duration: const Duration(milliseconds: 400), vsync: this);
  late final _conFade = AnimationController(
      duration: const Duration(milliseconds: 100), vsync: this);
  late final _animScale = Tween<double>(begin: 1, end: 4)
      .animate(CurvedAnimation(parent: _conScale, curve: Curves.easeInBack));
  late final _animFade = Tween<double>(begin: 1, end: 0)
      .animate(CurvedAnimation(parent: _conFade, curve: Curves.easeOut));
  bool _isLoaded = true;
  bool isSignedIn = false;
  int _apiLevel = 0;

  @override
  void initState() {
    super.initState();
    // FlutterNativeSplash.remove();
    // final prefs = await SharedPreferences.getInstance();
    // Future.delayed(const Duration(milliseconds: 500)).then((_) {
    //   return FlutterNativeSplash.remove();
    // });
    _fetchApiLevel().then((_) {
      debugPrint('\x1B[95m trigger \x1B[0m');
      setState(() {
        _apiLevel = apiLevel;
      });
      // FlutterNativeSplash.remove();
      Future.delayed(const Duration(milliseconds: 300)).then((_) {
        return FlutterNativeSplash.remove();
      });
    });
    // native splash delay

    // Sign-in check
    Future.delayed(const Duration(seconds: 3)).then((_) {
      if (!isSignedIn) {
        Go.reset(const WelcomeScreen(), TransitionType.none);
      } else {
        _conScale.forward();
        Future.delayed(const Duration(milliseconds: 200)).then((_) {
          _conFade.forward().whenComplete(() {
            setState(() => _isLoaded = false);
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('\x1B[95m ${_apiLevel} \x1B[0m');
    return Stack(
      children: [
        const HomeScreen(),
        _isLoaded
            ? FadeTransition(
                opacity: _animFade,
                child: Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  color: Colors.green,
                  child: ScaleTransition(
                    scale: _animScale,
                    child: SafeArea(
                      top: false,
                      bottom: _apiLevel < 31 ? true : false,
                      child: Image.asset(height: 125, 'assets/logo_400.gif'),
                    ),
                  ),
                ),
              )
            : Container()
      ],
    );
  }

  _fetchApiLevel() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      apiLevel = build.version.sdkInt;
    }
  }
}
