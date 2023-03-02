import 'package:flutter/material.dart';
import 'about_page.dart';
import 'laundry_page.dart';
import 'home_page.dart';

Color mainColor = const Color(0xFF19de9b);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreenIndex = 0;
  final List _screen = [
    {"screen": const HomePage(), "title": "ទំព័រដើម"},
    {"screen": const LaundryPage(), "title": "ហាងបោកអ៊ុត"},
    {"screen": const AboutPage(), "title": "អំពីអ្នក"},
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_screen[_selectedScreenIndex]["title"]),
      // ),
      body: _screen[_selectedScreenIndex]["screen"],
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 16,
          selectedFontSize: 16,
          selectedItemColor: mainColor,
          currentIndex: _selectedScreenIndex,
          onTap: _selectScreen,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home), label: _screen[0]["title"]),
            BottomNavigationBarItem(
                icon: const Icon(Icons.store), label: _screen[1]["title"]),
            BottomNavigationBarItem(
                icon: const Icon(Icons.person), label: _screen[2]["title"]),
          ],
        ),
      ),
    );
  }
}
