import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:interactive_tamil_parayana/const.dart';

TargetPlatform? platform;

double screenHeight = 0.0;
double screenWidth = 0.0;
String selectedLanguage = "Tamil";
int currentDay = 1;
int currentSong = 1;
final AudioPlayer? audioPlayer = AudioPlayer();

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
