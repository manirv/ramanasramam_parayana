import 'package:flutter/material.dart';
import 'package:interactive_tamil_parayana/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TabDaysListPage extends StatefulWidget {
  const TabDaysListPage({super.key});

  @override
  State<TabDaysListPage> createState() => _TabDaysListPageState();
}

class _TabDaysListPageState extends State<TabDaysListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Sri Ramanasramam Parayana',
              style: TextStyle(fontSize: screenHeight / 35),
            ),
            //  backgroundColor: Colors.purpleAccent,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new_outlined,
                    size: screenHeight / 30),
                onPressed: () {
                  Navigator.pop(context, true);
                }),
            leadingWidth: screenWidth / 11,
            actions: [
              PopupMenuButton<Widget>(
                iconSize: screenHeight / 30,
                position: PopupMenuPosition.under,
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
                stops: [0.0, 0.8],
                tileMode: TileMode.clamp),
          ),
          child: MediaQuery.of(context).orientation == Orientation.portrait
              ? Column(
                  children: [
                    SizedBox(height: screenHeight / 50),
                    Container(
                      height: screenHeight * 0.3,
                      width: screenWidth / 2.1,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/bhagavanround2.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    SizedBox(height: screenHeight / 40),
                    _getMenuBody()
                  ],
                )
              : Row(
                  children: [
                    SizedBox(height: screenHeight / 50),
                    Container(
                      height: screenHeight * 0.3,
                      width: screenWidth / 2,
                      margin: EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/bhagavanround2.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    SizedBox(height: screenHeight / 40),
                    _getMenuBody()
                  ],
                ),
        ));
  }

  Image get_image(path) {
    return Image.asset(
      path,
      height: screenHeight / 15,
      width: screenWidth / 10,
    );
  }

  _getMenuBody() {
    final List<MenuData> menu = [
      MenuData(
          get_image("assets/images/flower3@2x.png"),
          selectedLanguage == "Tamil" ? "திங்கட்கிழமை " : "Monday",
          '/mondaySongs'),
      MenuData(
          get_image("assets/images/flower3@2x.png"),
          selectedLanguage == "Tamil" ? "செவ்வாய்க்கிழமை " : "Tuesday",
          '/tuesdaySongs'),
      MenuData(
          get_image("assets/images/flower3@2x.png"),
          selectedLanguage == "Tamil" ? "புதன்கிழமை " : "Wednesday",
          '/wednesdaySongs'),
      MenuData(
          get_image("assets/images/flower3@2x.png"),
          selectedLanguage == "Tamil" ? "வியாழக்கிழமை " : "Thursday",
          '/thursdaySongs'),
      MenuData(
          get_image("assets/images/flower3@2x.png"),
          selectedLanguage == "Tamil" ? "வெள்ளிக்கிழமை " : "Friday",
          '/fridaydaySongs'),
      MenuData(
          get_image("assets/images/flower3@2x.png"),
          selectedLanguage == "Tamil" ? "சனிக்கிழமை " : "Saturday",
          '/saturdaySongs'),
    ];

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
            height: screenHeight / 2.0,
            width: screenWidth / 1,
            color: Colors.transparent,
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context, int index) {
                  Widget icon = menu[index].icon;
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          menu[index].page,
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          icon,
                          SizedBox(height: 10),
                          Text(
                            menu[index].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: screenWidth / 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}
