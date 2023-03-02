import 'package:book_app/helper/route_helper.dart';
import 'package:book_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _con;
  late Animation<double> _animFade;
  late Animation<double> _animScale;
  bool isInit = false;

  @override
  void initState() {
    super.initState();
    _con = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    _animScale = Tween<double>(begin: 0.7, end: 1).animate(
      CurvedAnimation(parent: _con, curve: Curves.easeOut),
    );
    _animFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _con, curve: Curves.easeIn),
    );
    _con.forward();
    Future.delayed(Duration.zero).then((_) {
      setState(() => isInit = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            stops: [0.2, 0.9],
            colors: [Colors.blue, Colors.lightBlueAccent],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            FadeTransition(
              opacity: _animFade,
              child: ScaleTransition(
                scale: _animScale,
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.15),
                    const SizedBox(height: 95), // reserved for image
                    const SizedBox(height: 15),
                    const Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      width: screenWidth * 0.7,
                      constraints: const BoxConstraints(maxWidth: 440),
                      child: ElevatedButton(
                        onPressed: () => HRoute.push(context, '/login'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shadowColor: Colors.transparent,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: screenWidth * 0.7,
                      constraints: const BoxConstraints(maxWidth: 440),
                      child: ElevatedButton(
                        onPressed: () => {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          side: const BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                        ),
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
                    const SizedBox(height: 13),
                    Row(
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
                    const SizedBox(height: 13),
                    const ButtonBrand(
                      iconData: FontAwesomeIcons.apple,
                      title: 'Continue with Apple',
                      color: Colors.black,
                    ),
                    const ButtonBrand(
                      iconData: FontAwesomeIcons.facebook,
                      title: 'Continue with Facebook',
                      color: Color(0xff3b59b8),
                    ),
                    const ButtonBrand(
                      imagePath: 'assets/images/icon_google.png',
                      title: 'Continue with Google',
                      color: Color(0xffc01202),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () => HRoute.go(context, '/home'),
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
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              top: !isInit ? screenHeight * 0.5 - 60 : screenHeight * 0.15,
              height: !isInit ? 120 : 95,
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 600),
              child: Image.asset('assets/images/logo.gif'),
            ),
            //debug
            Positioned(
              bottom: 0,
              right: 0,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      debugPrint('\x1B[96m trigger \x1B[0m');
                      HRoute.go(context, "/");
                    },
                    child: const Text('restart'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
        ),
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
