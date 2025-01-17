import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List imageList = [
    {"id": 1, "imagePath": 'assets/images/img.png'},
    {"id": 2, "imagePath": 'assets/images/second.jpeg'},
    {"id": 3, "imagePath": 'assets/images/img.png'},
    {"id": 4, "imagePath": 'assets/images/second.jpeg'},
    {"id": 5, "imagePath": 'assets/images/img.png'},
    {"id": 6, "imagePath": 'assets/images/second.jpeg'},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: content(),
      //Image.asset('assets/images/img.png')
    );
  }

  Widget content() {
    return Container(
      child: CarouselSlider(
          items: [1, 2, 3, 3, 4, 5].map((i) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                "Text $i",
                style: TextStyle(fontSize: 40),
              )),
            );
          }).toList(),
          options: CarouselOptions(height: 300)),
    );
  }
}
