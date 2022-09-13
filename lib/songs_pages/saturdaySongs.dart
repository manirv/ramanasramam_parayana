import 'package:flutter/material.dart';
import 'package:interactive_tamil_parayana/const.dart';
import 'package:interactive_tamil_parayana/utils.dart';

class SaturdaySongsPage extends StatefulWidget {
  const SaturdaySongsPage({super.key});

  @override
  State<SaturdaySongsPage> createState() => _SaturdaySongsPageState();
}

class _SaturdaySongsPageState extends State<SaturdaySongsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Sri Ramanasramam Parayana'),
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
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Column(
          children: [
            SizedBox(height: screenHeight / 100),
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
              child: Text("Tamil Parayanam\n Saturday Songs",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontSize: screenHeight * 0.035)),
            ),
            SizedBox(height: screenHeight / 50),
            ListView.builder(
                itemCount: tamil_songs_list[5].length,
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () async {
                        setState(() {
                          currentDay = 6;
                          currentSong = index + 1;
                        });
                        Navigator.pushNamed(context, '/playPage');
                      },
                      child: Container(
                          margin: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 5.0),
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            color: Colors.purpleAccent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
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
                                      ? tamil_songs_list[5][index]
                                      : eng_songs_list[5][index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenWidth / 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )));
                })
          ],
        ),
      ),
    );
  }
}
