import 'package:flutter/material.dart';
import 'package:interactive_tamil_parayana/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TabletLandingPage extends StatefulWidget {
  const TabletLandingPage({super.key});

  @override
  State<TabletLandingPage> createState() => _TabletLandingPageState();
}

class _TabletLandingPageState extends State<TabletLandingPage> {
  @override
  void initState() {
    _languageSelection();
    super.initState();
  }

  _languageSelection() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString("selectedLanguage") == null) {
      prefs.setString("selectedLanguage", "English");
    } else {
      selectedLanguage = prefs.getString("selectedLanguage")!;
    }
    print(prefs.getString("selectedLanguage"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.03),
                  Container(
                    height: screenHeight * 0.3,
                    width: screenWidth / 1.8,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/bhagavan2_500.9.png'),
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
                  _getMenuBody(),
                ],
              )
            : Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: screenHeight * 0.3,
                          width: screenWidth / 1.8,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/bhagavan2_500.9.png'),
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
                        Text(
                            'The Poetic Works of \n Bhagavan Sri Ramana Maharshi',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: screenWidth / 20,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: screenHeight / 4000),
                      ],
                    ),
                  ),
                  _getMenuBody(),
                ],
              ),
      ),
    );
  }

  Image get_image(path) {
    return Image.asset(
      path,
    );
  }

  _getMenuBody() {
    final List<MenuData> menu = [
      MenuData(get_image("assets/images/intro.png"), 'About Tamil Parayana',
          '/aboutPage'),
      MenuData(get_image("assets/images/history.png"), 'History of Parayana ',
          '/historyPage'),
      MenuData(get_image("assets/images/playsong.png"), 'Chant Tamil Parayana',
          '/tabDaysPage'),
      MenuData(get_image("assets/images/playsong.png"), 'Download Songs',
          '/download'),
    ];

    return Expanded(
      child: Padding(
        padding:  EdgeInsets.all( MediaQuery.of(context).orientation == Orientation.portrait?10.0:15.0),
        child: Container(
          margin: EdgeInsets.all(MediaQuery.of(context).orientation == Orientation.portrait?10.0:15.0),
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? screenHeight * 1
              : screenHeight / 0.3,
          width: MediaQuery.of(context).orientation == Orientation.portrait?screenWidth/1.5: screenWidth /5,
          color: Colors.transparent,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 2,
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
                            fontSize: screenWidth / 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
