import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/splash_screen.dart';

void main() => runApp(const MyApp());

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
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      // themeMode: ThemeMode.system,
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

