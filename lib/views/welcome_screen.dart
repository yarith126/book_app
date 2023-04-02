import 'package:book_app/global_variables.dart';
import 'package:book_app/utils/route_helper.dart';
import 'package:book_app/views/home/home_screen.dart';
import 'package:book_app/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _con1, _con2, _con3, _con4;
  late AnimationController _con5, _con6, _con7, _con8;

  bool isInit = false;
  double stop1 = 1;
  double stop2 = 0;
  List<Color> colors = [Colors.green, Colors.green];

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topCenter,
            stops: [stop1, stop2],
            colors: colors,
          ),
        ),
        child: SafeArea(
          top: false,
          bottom: true,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.11),
                    const SizedBox(height: 95), // reserved for image
                    const SizedBox(height: 10),
                    _FadeScaleTransition(
                      controller: _con1,
                      child: const Text(
                        "Welcome",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    _FadeScaleTransition(
                      controller: _con2,
                      child: Container(
                        width: screenWidth * 0.7,
                        constraints: const BoxConstraints(maxWidth: 440),
                        child: ElevatedButton(
                          onPressed: () => Go.to(const LoginScreen()),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            backgroundColor: Colors.white,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    _FadeScaleTransition(
                      controller: _con3,
                      child: Container(
                        width: screenWidth * 0.7,
                        constraints: const BoxConstraints(maxWidth: 440),
                        child: ElevatedButton(
                          onPressed: () => {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 13),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            foregroundColor: Colors.transparent,
                            side: const BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                          ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 13),
                    _FadeScaleTransition(
                      controller: _con4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 100,
                            child: Divider(color: Colors.white),
                          ),
                          Container(
                            margin: const EdgeInsets.all(20),
                            child: const Text('or',
                                style: TextStyle(color: Colors.white)),
                          ),
                          const SizedBox(
                            width: 100,
                            child: Divider(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 13),
                    _FadeScaleTransition(
                      controller: _con5,
                      child: const ButtonBrand(
                        iconData: FontAwesomeIcons.apple,
                        title: 'Continue with Apple',
                        color: Colors.black,
                      ),
                    ),
                    _FadeScaleTransition(
                      controller: _con6,
                      child: const ButtonBrand(
                        iconData: FontAwesomeIcons.facebook,
                        title: 'Continue with Facebook',
                        color: Color(0xff3b59b8),
                      ),
                    ),
                    _FadeScaleTransition(
                      controller: _con7,
                      child: const ButtonBrand(
                        imagePath: 'assets/icon_google.png',
                        title: 'Continue with Google',
                        color: Color(0xffc01202),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _FadeScaleTransition(
                      controller: _con8,
                      child: InkWell(
                        onTap: () => Go.reset(const HomeScreen()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            SizedBox(width: 16),
                            Text(
                              'Skip',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.arrow_right, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              apiLevel < 31
                  ? AnimatedAlign(
                      alignment: !isInit
                          ? Alignment.center
                          : const Alignment(0, -0.65),
                      // top: screenHeight * 0.5 - 125 / 2,
                      // top: !isInit
                      //     ? 0//screenHeight * 0.5 - 125 / 2
                      //     : screenHeight * 0.09 + paddingTop,
                      // height: !isInit ? 125 : 95,
                      // height: 125,
                      curve: Curves.linearToEaseOut,
                      duration: const Duration(milliseconds: 1000),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        height: !isInit ? 125 : 95,
                        child: Image.asset('assets/logo_400.gif'),
                      ),
                    )
                  : AnimatedPositioned(
                      top: !isInit
                          ? screenHeight * 0.5 - 125 / 2
                          : screenHeight * 0.11 + paddingTop,
                      height: !isInit ? 125 : 95,
                      curve: Curves.linearToEaseOut,
                      duration: const Duration(milliseconds: 1000),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        height: !isInit ? 125 : 95,
                        child: Image.asset('assets/logo_400.gif'),
                      ),
                    ),

              //debug
              // Positioned(
              //   bottom: 30,
              //   right: 0,
              //   child: Row(
              //     children: [
              //       ElevatedButton(
              //         onPressed: () {
              //           HRoute.go(context, "/");
              //         },
              //         child: const Text('restart'),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _startAnimation() {
    // one by one pop up
    var duration = const Duration(milliseconds: 600);
    _con1 = AnimationController(duration: duration, vsync: this);
    _con2 = AnimationController(duration: duration, vsync: this);
    _con3 = AnimationController(duration: duration, vsync: this);
    _con4 = AnimationController(duration: duration, vsync: this);
    _con5 = AnimationController(duration: duration, vsync: this);
    _con6 = AnimationController(duration: duration, vsync: this);
    _con7 = AnimationController(duration: duration, vsync: this);
    _con8 = AnimationController(duration: duration, vsync: this);

    var startTime = const Duration(milliseconds: 50);
    var gapTime = startTime + const Duration(milliseconds: 20);
    Future.delayed(startTime + (gapTime * 0)).then((_) => _con8.forward());
    Future.delayed(startTime + (gapTime * 1)).then((_) => _con7.forward());
    Future.delayed(startTime + (gapTime * 2)).then((_) => _con6.forward());
    Future.delayed(startTime + (gapTime * 3)).then((_) => _con5.forward());
    Future.delayed(startTime + (gapTime * 3.5)).then((_) => _con4.forward());
    Future.delayed(startTime + (gapTime * 4)).then((_) => _con3.forward());
    Future.delayed(startTime + (gapTime * 5)).then((_) => _con2.forward());
    Future.delayed(startTime + (gapTime * 6)).then((_) => _con1.forward());

    // color shift
    Future.delayed(startTime - (gapTime * 3)).then((_) {
      setState(() {
        stop1 = 0.2;
        stop2 = 0.7;
        colors = [const Color(0xFF00a676), const Color(0xFF00c676)];
      });
    });
    // image position change
    Future.delayed(startTime + (gapTime * 2.5)).then((_) {
      setState(() => isInit = true);
    });
  }
}

class ButtonBrand extends StatelessWidget {
  final IconData? iconData;
  final String? imagePath;
  final String title;
  final Color color;

  const ButtonBrand({
    Key? key,
    this.iconData,
    this.imagePath,
    required this.title,
    required this.color,
  })  : assert(iconData != null || imagePath != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      constraints: const BoxConstraints(maxWidth: 500),
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
          shadowColor: Colors.red,
        ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.only(bottom: 3),
              child: iconData != null
                  ? Icon(iconData, size: 24, color: color)
                  : Image.asset(imagePath!, width: 20),
            ),
            const SizedBox(width: 9),
            SizedBox(
              width: 160,
              // padding: EdgeInsets.only(top: 2),
              child: Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FadeScaleTransition extends StatefulWidget {
  const _FadeScaleTransition({
    Key? key,
    required this.child,
    required this.controller,
  }) : super(key: key);
  final Widget child;
  final AnimationController controller;

  @override
  State<_FadeScaleTransition> createState() => _FadeScaleTransitionState();
}

class _FadeScaleTransitionState extends State<_FadeScaleTransition>
    with TickerProviderStateMixin {
  late Animation<double> _animFade;
  late Animation<double> _animScale;
  bool isInit = false;

  @override
  void initState() {
    super.initState();
    // _con = AnimationController(
    //     duration: const Duration(milliseconds: 600), vsync: this);
    _animScale = Tween<double>(begin: 0.7, end: 1).animate(
      CurvedAnimation(parent: widget.controller, curve: Curves.easeOut),
    );
    _animFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: widget.controller, curve: Curves.easeIn),
    );
    Future.delayed(Duration.zero).then((_) {
      setState(() => isInit = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animFade,
      child: ScaleTransition(
        scale: _animScale,
        child: widget.child,
      ),
    );
  }
}
