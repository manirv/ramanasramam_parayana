import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:interactive_tamil_parayana/dayslist.dart';
import 'package:interactive_tamil_parayana/landingPage.dart';
import 'package:interactive_tamil_parayana/play.dart';
import 'package:interactive_tamil_parayana/songs_pages/fridaySongs.dart';
import 'package:interactive_tamil_parayana/songs_pages/mondaySongs.dart';
import 'package:interactive_tamil_parayana/songs_pages/saturdaySongs.dart';
import 'package:interactive_tamil_parayana/songs_pages/thursdaySongs.dart';
import 'package:interactive_tamil_parayana/songs_pages/tuesdaySongs.dart';
import 'package:interactive_tamil_parayana/songs_pages/wednesdaySongs.dart';
import 'package:interactive_tamil_parayana/splashScreen.dart';
import 'package:interactive_tamil_parayana/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await FlutterDownloader.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    platform = Theme.of(context).platform;
    //AudioPlayer? audioPlayer = new AudioPlayer(playerId: "001");
    return MaterialApp(
      title: 'Ramanasramam Parayana ',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: Colors.transparent),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/landingPage': (context) => const LandingPage(),
        '/daysPage': (context) => const DaysListPage(),
        '/playPage': (context) => PlayPage(
              audioPlayer: AudioPlayer(playerId: "001"),
            ),
        '/mondaySongs': (context) => const MondaySongsPage(),
        '/tuesdaySongs': (context) => const TuesdaySongsPage(),
        '/wednesdaySongs': (context) => const WednesdaySongs(),
        '/thursdaySongs': (context) => const ThursdayPage(),
        '/fridaydaySongs': (context) => const FridaySongsPage(),
        '/saturdaySongs': (context) => const SaturdaySongsPage(),
      },
    );
  }

}
