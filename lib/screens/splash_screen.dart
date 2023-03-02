import 'package:book_app/helper/route_helper.dart';
import 'package:book_app/screens/home/home_screen.dart';
import 'package:book_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _conScale;
  late AnimationController _conFade;
  late Animation<double> _animFade;
  late Animation<double> _animScale;
  bool isLoaded = true;
  bool isSignedIn = false;

  @override
  void initState() {
    super.initState();
    _conScale = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    _animScale = Tween<double>(begin: 1, end: 4).animate(
      CurvedAnimation(parent: _conScale, curve: Curves.easeInBack),
    );
    _conFade = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);
    _animFade = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _conFade, curve: Curves.easeOut),
    );

    Future.delayed(const Duration(seconds: 3)).then((_) {
      if (!isSignedIn) {
        HRoute.push(context, '/welcome');
      } else {
        _conScale.forward();
        Future.delayed(const Duration(milliseconds: 200)).then((_) {
          _conFade
              .forward()
              .whenComplete(() => setState(() => isLoaded = false));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const HomeScreen(),
        isLoaded
            ? FadeTransition(
                opacity: _animFade,
                child: Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomRight,
                      stops: [0.2, 0.9],
                      colors: [Colors.blue, Colors.lightBlueAccent],
                    ),
                  ),
                  child: ScaleTransition(
                    scale: _animScale,
                    child: Image.asset(height: 120, 'assets/images/logo.gif'),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
