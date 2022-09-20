import 'package:flutter/material.dart';
import 'package:interactive_tamil_parayana/const.dart';
import 'package:interactive_tamil_parayana/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('History of Parayana',
              style: TextStyle(fontSize: screenHeight / 35)),
          centerTitle: true,
          backgroundColor: Colors.purpleAccent,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_outlined,
                  size: screenHeight / 30),
              onPressed: () {
                Navigator.pop(context, true);
              }),
          leadingWidth: screenWidth / 11,
          actions: [
            PopupMenuButton<Widget>(
              iconSize: screenHeight / 28,
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
              stops: [0.0, 0.8],
              tileMode: TileMode.clamp),
        ),
        child: Center(
            child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: screenWidth / 1.5,
                height: screenHeight / 3,
                margin: const EdgeInsets.all(10.0),
                color: Colors.transparent,
                child: Image.asset(
                  "assets/images/bhagavan_sitting.png",
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  selectedLanguage == "English" ? engHistory : history,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth / 20,
                      height: 1.5,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
