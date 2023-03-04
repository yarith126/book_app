import 'package:book_app/helper/route_helper.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return _Wrapper(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: screenHeight * 0.08),
            const Center(
              child: Text(
                'Welcome back',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.greenAccent.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.green.shade100),
                          ),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email or Phone number or Username',
                            hintStyle: TextStyle(
                                color: Colors.grey.shade600, fontSize: 14),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(13),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.grey.shade800),
                ),
              ],
            ),
            const SizedBox(height: 35),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 80,
                    vertical: 16,
                  ),
                ),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not yet registered? ',
                    style: TextStyle(color: Colors.grey.shade800),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text('Sign Up',
                        style: TextStyle(fontWeight: FontWeight.bold)),
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

// background + scaffold
class _Wrapper extends StatelessWidget {
  final Widget child;

  const _Wrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Stack(
        children: [
          Container(color: const Color(0xfff5fde8)),
          Image.asset('assets/background/bg_1.png'),
          SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: const Text('Sign In'),
                backgroundColor: Colors.transparent,
              ),
              body: child,
            ),
          ),
          // Positioned(
          //   right: 0,
          //   left: 0,
          //   bottom: 0,
          //   child: Image.asset('assets/images/background/bg_login_bottom.jpg'),
          // ),
        ],
      ),
    );
  }
}
