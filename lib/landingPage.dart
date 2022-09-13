import 'package:flutter/material.dart';
import 'package:interactive_tamil_parayana/const.dart';
import 'package:interactive_tamil_parayana/utils.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.1),
            Container(
              height: screenHeight * 0.3,
              width: screenWidth / 1.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bhagavan2_500.9.png'),
                    fit: BoxFit.fill),
              ),
            ),
            SizedBox(height: screenHeight / 4000),
            Text('Parayana At Sri Ramanasramam',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth / 20,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: screenHeight / 200),
            Text('The Poetic Works of \n Bhagavan Sri Ramana Maharshi',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.amberAccent,
                    fontSize: screenWidth / 20,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: screenHeight / 4000),
            GestureDetector(
                onTap: () async {
                  Navigator.pushNamed(context, '/aboutPage');
                },
                child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/intro.png",
                          width: screenWidth * 0.1,
                        ),
                        SizedBox(
                          width: screenWidth * 0.7,
                          child: Text(
                            "About Tamil Parayana",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth / 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ))),
            SizedBox(height: screenHeight / 4000),
            GestureDetector(
                onTap: () async {
                  Navigator.pushNamed(context, '/historyPage');
                },
                child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/history.png",
                          width: screenWidth * 0.1,
                        ),
                        SizedBox(
                          width: screenWidth * 0.7,
                          // (வரலாறு)
                          child: Text(
                            "History of Parayana \nat Sri Ramanasramam ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth / 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ))),
            SizedBox(height: screenHeight / 4000),
            GestureDetector(
                onTap: () async {
                  Navigator.pushNamed(context, '/daysPage');
                },
                child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/playsong.png",
                          width: screenWidth * 0.1,
                        ),
                        SizedBox(
                          width: screenWidth * 0.7,
                          child: Text(
                            "Chant Tamil Parayana",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth / 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ))),
            SizedBox(height: screenHeight / 4000),
            GestureDetector(
                onTap: () async {
                  Navigator.pushNamed(context, '/download');
                },
                child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.all(Radius.circular(2.0)),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/playsong.png",
                          width: screenWidth * 0.1,
                        ),
                        SizedBox(
                          width: screenWidth * 0.7,
                          child: Text(
                            "Download Songs",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth / 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ))),
            //     GestureDetector(
            // onTap: () async {},
            // child: Container(
            //     margin: const EdgeInsets.all(20),
            //     padding: const EdgeInsets.all(10.0),
            //     decoration: BoxDecoration(
            //       color: Colors.purpleAccent,
            //       border: Border.all(width: 1.0, color: Colors.grey),
            //       borderRadius:
            //           const BorderRadius.all(Radius.circular(5.0)),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Image.asset(
            //           "assets/images/bhagavanround2.png",
            //           width: screenWidth * 0.1,
            //         ),
            //         SizedBox(
            //           width: screenWidth * 0.7,
            //           child: Text(
            //             "Tamil Parayana",
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: screenWidth / 20,
            //                 fontWeight: FontWeight.bold),
            //           ),
            //         ),
            //       ],
            //     ))),
          ],
        ),
      ),
    );
  }
}
