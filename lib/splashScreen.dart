import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interactive_tamil_parayana/landingPage.dart';
import 'package:interactive_tamil_parayana/responsive/mobile_landing.dart';
import 'package:interactive_tamil_parayana/responsive/responsive_layout.dart';
import 'package:interactive_tamil_parayana/responsive/tab_landing.dart';
import 'utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ResponsiveLayout(
                    mobileBody: MobileLandingPage(),
                    tabletBody: TabletLandingPage()))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        height: screenHeight,
        //width: screenWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.1),
            Container(
              height: screenHeight * 0.4,
              width: screenWidth / 0.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bhagavan_sitting.png'),
                    fit: BoxFit.fill),
              ),
            ),
            //const SizedBox(height: 10),
            Container(
              width: screenWidth / 1.4,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
              child: Text("Parayana At\n Sri Ramanasramam",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontSize: screenHeight * 0.035)),
            ),
            //SizedBox(height: screenHeight / 10),
            Container(
              height: screenHeight / 8,
              width: screenWidth / 4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/flower3@2x.png'),
                    fit: BoxFit.fill),
              ),
            ),
            // SizedBox(height: screenHeight / 10),
            Text(
              "The Poetic Works of \n Bhagavan Sri Ramana Maharshi",
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontSize: screenHeight / 35),
            ),
            SizedBox(height: screenHeight / 20),
            Text(
              "SRI RAMANASRAMAM  TIRUVANNAMALAI",
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontSize: screenHeight / 35),
            )
          ],
        ),
      ),
    );
  }
}
