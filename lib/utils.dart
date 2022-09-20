import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:interactive_tamil_parayana/const.dart';
import 'package:interactive_tamil_parayana/download.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

TargetPlatform? platform;

double screenHeight = 0.0;
double screenWidth = 0.0;
String selectedLanguage = "English";
int currentDay = 1;
int currentSong = 1;
final AudioPlayer? audioPlayer = AudioPlayer();
var downloader = new DownloadFile(
  title: 'Downloader',
  //platform: platform,
);

prevSong() {
  if (currentSong == 1) {
    if (currentDay > 1) {
      currentDay = currentDay - 1;
    } else {
      currentDay = 6;
    }
    currentSong = getIndexList()[currentDay - 1].length;
  } else {
    currentSong = currentSong - 1;
  }
}

nextSong() {
  if (currentSong >= getIndexList()[currentDay - 1].length) {
    if (currentDay < 6) {
      currentDay = currentDay + 1;
    } else {
      currentDay = 1;
    }
    currentSong = 1;
  } else {
    currentSong = currentSong + 1;
  }
}

showToaster(message, context) {
  showToast(
    message,
    context: context,
    backgroundColor: Colors.white70,
    textStyle: const TextStyle(color: Colors.black),
    animation: StyledToastAnimation.scale,
    reverseAnimation: StyledToastAnimation.fade,
    position:
        const StyledToastPosition(align: Alignment.bottomCenter, offset: 100.0),
    animDuration: const Duration(seconds: 1),
    duration: const Duration(seconds: 2),
    curve: Curves.elasticOut,
    reverseCurve: Curves.linear,
  );
}

class MenuData {
  MenuData(this.icon, this.title, this.page);
  final Widget icon;
  final String title;
  final String page;
}
