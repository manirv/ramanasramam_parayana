import 'package:flutter/material.dart';
import 'package:interactive_tamil_parayana/const.dart';
import 'package:interactive_tamil_parayana/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WednesdaySongs extends StatefulWidget {
  const WednesdaySongs({super.key});

  @override
  State<WednesdaySongs> createState() => _WednesdaySongsState();
}

class _WednesdaySongsState extends State<WednesdaySongs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Sri Ramanasramam Parayana',
            style: TextStyle(fontSize: screenHeight / 35),
          ),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_outlined,
                  size: screenHeight / 30),
              onPressed: () {
                Navigator.pop(context, true);
              }),
          leadingWidth: screenWidth / 11,
          actions: [
            PopupMenuButton<Widget>(
              position: PopupMenuPosition.under,
              iconSize: screenHeight / 30,
              color: Colors.purple,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  enabled: false,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  child: Text("Select Language",
                      style: TextStyle(fontSize: screenHeight / 50)),
                ),
                const PopupMenuDivider(
                  height: 0,
                ),
                PopupMenuItem(
                  textStyle: TextStyle(
                      fontSize: screenHeight / 45,
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
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setString("selectedLanguage", "Tamil");
                    setState(() {
                      selectedLanguage = prefs.getString("selectedLanguage")!;
                    });
                  },
                ),
                PopupMenuItem(
                  textStyle: TextStyle(
                      fontSize: screenHeight / 45,
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
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setString("selectedLanguage", "English");
                    setState(() {
                      selectedLanguage = prefs.getString("selectedLanguage")!;
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
              child: Text("Tamil Parayanam\n Wednesday Songs",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontSize: screenHeight * 0.035)),
            ),
            SizedBox(height: screenHeight / 50),
            Expanded(
              child: ListView.builder(
                  itemCount: tamil_songs_list[2].length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () async {
                          setState(() {
                            currentDay = 3;
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
                              children: [
                                Image.asset(
                                  "assets/images/flower3@2x.png",
                                  width: screenWidth * 0.1,
                                ),
                                Text(
                                    selectedLanguage == "Tamil"
                                        ? tamil_songs_list[2][index]
                                        : eng_songs_list[2][index],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth / 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                              ],
                            )));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
