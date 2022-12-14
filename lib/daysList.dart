import 'package:flutter/material.dart';
import 'package:interactive_tamil_parayana/utils.dart';

class DaysListPage extends StatefulWidget {
  const DaysListPage({super.key});

  @override
  State<DaysListPage> createState() => _DaysListPageState();
}

class _DaysListPageState extends State<DaysListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Sri Ramanasramam Parayana'),
          //  backgroundColor: Colors.purpleAccent,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
              onPressed: () {
                Navigator.pop(context, true);
              }),
          leadingWidth: screenWidth / 11,
          actions: [
            PopupMenuButton<Widget>(
              position: PopupMenuPosition.under,
              color: Colors.purple,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  enabled: false,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  child: Text("Select Language"),
                ),
                const PopupMenuDivider(
                  height: 0,
                ),
                PopupMenuItem(
                  textStyle: TextStyle(
                      color: selectedLanguage == "Tamil"
                          ? Colors.white
                          : Colors.black),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      selectedLanguage == "Tamil"
                          ? const Icon(Icons.check)
                          : Container(),
                      const SizedBox(width: 5.0),
                      const Text("Tamil"),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      selectedLanguage = "Tamil";
                    });
                  },
                ),
                PopupMenuItem(
                  textStyle: TextStyle(
                      color: selectedLanguage == "English"
                          ? Colors.white
                          : Colors.black),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      selectedLanguage == "English"
                          ? const Icon(Icons.check)
                          : Container(),
                      const SizedBox(width: 5.0),
                      const Text("English"),
                    ],
                  ),
                  onTap: () async {
                    setState(() {
                      selectedLanguage = "English";
                    });
                  },
                ),
              ],
            )
          ]),
      body: Container(
        height: screenHeight,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.0, 0.8],
              tileMode: TileMode.clamp),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight / 40),
              Container(
                height: screenHeight * 0.2,
                width: screenWidth / 2.3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bhagavanround2.png'),
                      fit: BoxFit.fill),
                ),
              ),
              // SizedBox(height: screenHeight / 40),
              // GestureDetector(
              //     onTap: () async {
              //       setState(() {
              //         currentDay = 1;
              //         currentSong = 1;
              //       });
              //       Navigator.pushNamed(context, '/playPage');
              //     },
              //     child: Container(
              //         margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              //         padding: const EdgeInsets.all(10.0),
              //         decoration: const BoxDecoration(
              //           color: Colors.purpleAccent,
              //           borderRadius: BorderRadius.all(Radius.circular(5.0)),
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Image.asset(
              //               "assets/images/flower3@2x.png",
              //               width: screenWidth * 0.1,
              //             ),
              //             SizedBox(
              //               width: screenWidth * 0.7,
              //               child: Text(
              //                 "Play Page",
              //                 style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: screenWidth / 20,
              //                     fontWeight: FontWeight.bold),
              //               ),
              //             ),
              //           ],
              //         ))),
              SizedBox(height: screenHeight / 50),
              GestureDetector(
                  onTap: () async {
                    setState(() {
                      currentDay = 0;
                    });
                    Navigator.pushNamed(context, '/mondaySongs');
                  },
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/flower3@2x.png",
                            width: screenWidth * 0.1,
                          ),
                          SizedBox(
                            width: screenWidth * 0.7,
                            child: Text(
                              selectedLanguage == "Tamil"
                                  ? "???????????????????????????????????? "
                                  : "Monday",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth / 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ))),
              SizedBox(height: screenHeight / 50),
              GestureDetector(
                  onTap: () async {
                    setState(() {
                      currentDay = 1;
                    });
                    Navigator.pushNamed(context, '/tuesdaySongs');
                  },
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/flower3@2x.png",
                            width: screenWidth * 0.1,
                          ),
                          SizedBox(
                            width: screenWidth * 0.7,
                            child: Text(
                              selectedLanguage == "Tamil"
                                  ? "????????????????????????????????????????????? "
                                  : "Tuesday",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth / 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ))),
              SizedBox(height: screenHeight / 50),
              GestureDetector(
                  onTap: () async {
                    setState(() {
                      currentDay = 2;
                    });
                    Navigator.pushNamed(context, '/wednesdaySongs');
                  },
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/flower3@2x.png",
                            width: screenWidth * 0.1,
                          ),
                          SizedBox(
                            width: screenWidth * 0.7,
                            child: Text(
                              selectedLanguage == "Tamil"
                                  ? "?????????????????????????????? "
                                  : "Wednesday",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth / 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ))),
              SizedBox(height: screenHeight / 50),
              GestureDetector(
                  onTap: () async {
                    setState(() {
                      currentDay = 3;
                    });
                    Navigator.pushNamed(context, '/thursdaySongs');
                  },
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/flower3@2x.png",
                            width: screenWidth * 0.1,
                          ),
                          SizedBox(
                            width: screenWidth * 0.7,
                            child: Text(
                              selectedLanguage == "Tamil"
                                  ? "???????????????????????????????????? "
                                  : "Thursday",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth / 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ))),
              SizedBox(height: screenHeight / 50),
              GestureDetector(
                  onTap: () async {
                    setState(() {
                      currentDay = 4;
                    });
                    Navigator.pushNamed(context, '/fridaydaySongs');
                  },
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/flower3@2x.png",
                            width: screenWidth * 0.1,
                          ),
                          SizedBox(
                            width: screenWidth * 0.7,
                            child: Text(
                              selectedLanguage == "Tamil"
                                  ? "??????????????????????????????????????? "
                                  : "Friday",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth / 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ))),
              SizedBox(height: screenHeight / 50),
              GestureDetector(
                  onTap: () async {
                    setState(() {
                      currentDay = 5;
                    });
                    Navigator.pushNamed(context, '/saturdaySongs');
                  },
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/flower3@2x.png",
                            width: screenWidth * 0.1,
                          ),
                          SizedBox(
                            width: screenWidth * 0.7,
                            child: Text(
                              selectedLanguage == "Tamil"
                                  ? "?????????????????????????????? "
                                  : "Saturday",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth / 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
