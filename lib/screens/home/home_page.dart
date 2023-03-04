import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:core';
import 'dart:math' as math;

const Color mainColor = Color(0xFF19de9b);
const double mainPadding = 21;
const List<String> carouselImageUrls = [
  'assets/home/cover1.png',
  'assets/home/cover2.png',
  'assets/home/cover3.jpg',
  'assets/home/cover4.png',
];
const String imgUrlCover1 = 'assets/home/cover4.png';
const String imgUrlLogo = 'assets/home/logo_400.png';
const String imgUrlType1 = 'assets/home/type1.png';
const String imgUrlType2 = 'assets/home/type2.png';

// ListViewBox isn't a listview?
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // color: Colors.grey.shade100,
  // padding: const EdgeInsets.symmetric(horizontal: 21),
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: mainPadding),
            child: TopBar(),
          ),
          Expanded(
            child: Scrollbar(
              trackVisibility: true,
              thickness: 5,
              radius: Radius.circular(8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ContentBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: mainColor,
                  size: 28,
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pickup",
                      textAlign: TextAlign.left,
                    ),
                    Text("#32,Phnom Penh,Cambodia"),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              child: Icon(
                Icons.shopping_cart,
                color: mainColor,
                size: 29,
              ),
            ),
          ],
        ),
        SizedBox(height: 13),
        Container(
          child: const OutlineSearchBar(
            borderColor: Colors.black,
            cursorColor: Colors.blueAccent,
            cursorWidth: 3,
            cursorRadius: Radius.circular(10),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            clearButtonColor: Colors.blueAccent,
            searchButtonIconColor: Colors.black,
            searchButtonPosition: SearchButtonPosition.leading,
            textStyle: TextStyle(fontSize: 15),
            hintText: "Search..",
          ),
        )
      ],
    );
  }
}

class ContentBox extends StatelessWidget {
  const ContentBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: 30),
        CarouselSlider(
          options: CarouselOptions(
            enableInfiniteScroll: true,
            autoPlay: true,
            viewportFraction: 0.93,
          ),
          items: carouselImageUrls.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: screenWidth * 90 / 100,
                  height: 200,
                  color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0),
                  child: Image.asset(imageUrl),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 22),
        Container(
          padding: EdgeInsets.symmetric(horizontal: mainPadding),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 5, left: 6),
                width: double.infinity,
                alignment: Alignment.topLeft,
                child: Text(
                  "ប្រភេទសេវាកម្ម",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 19,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: screenWidth * 42 / 100,
                    width: screenWidth * 42 / 100,
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      elevation: 2,
                      child: Image.asset(imgUrlType1),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 42 / 100,
                    width: screenWidth * 42 / 100,
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      elevation: 2,
                      child: Image.asset(imgUrlType2),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
