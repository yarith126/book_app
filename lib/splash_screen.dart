import 'package:flutter/material.dart';
import 'login_screen.dart';

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

  @override
  void initState() {
    super.initState();
    _conScale = AnimationController(
        duration: const Duration(milliseconds: 900), vsync: this);
    _animScale = Tween<double>(begin: 1, end: 4).animate(
      CurvedAnimation(parent: _conScale, curve: Curves.easeInBack),
    );
    _conFade = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _animFade = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _conFade, curve: Curves.easeOut),
    );

    Future.delayed(const Duration(seconds: 3)).then((_) {
      _conScale.forward();
      Future.delayed(const Duration(milliseconds: 450)).then((_) {
        _conFade.forward();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.lightGreenAccent,
        body: Stack(
          children: [
            const LoginScreen(),
            FadeTransition(
              opacity: _animFade,
              child: Container(
                alignment: Alignment.center,
                color: Colors.limeAccent,
                child: ScaleTransition(
                  scale: _animScale,
                  child: Image.asset(
                      width: 180, 'assets/images/splash_icon_2.gif'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
