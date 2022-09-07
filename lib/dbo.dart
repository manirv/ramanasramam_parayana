import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

final _documents = [
  {
    'song': '(1)',
    'link':
        'http://www.sriramana.org/music/7daytamilparayana/11arunachala_mahatmiyam.mp3'
  },
];
List<Map<String, Object?>> _data = [];
String _selectedYear = "2022";

var _db;
var _song = [];
getData() async => _song;

getdb() async {
  var dbDir = await getDatabasesPath();
  var dbPath = path.join(dbDir, "app.db");
  await deleteDatabase(dbPath);
  ByteData data = await rootBundle.load("assets/tamil_parayana.db");
  List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  await File(dbPath).writeAsBytes(bytes);
  _db = await openDatabase(dbPath);
}

getSong(day_no, song_no) async {
  await getdb();
  var songs = [
    // {
    //   'song': '(1)',
    //   'link':
    //       'http://www.sriramana.org/music/7daytamilparayana/11arunachala_mahatmiyam.mp3'
    // },
  ];

  var db = _db;
  var query =
      "select song_id,song_title_no, song_sub_title,song, timed_song from tamil_songs_new where day_no=$day_no order by song_id";
  await _db.rawQuery(query).then((value) {
    List s = value;
    var songFull = "";
    for (var i = 0; i < s.length; i++) {
      // TO DO
      var row = s[i];
      var songText = row['timed_song'];
      var songId = row['song_id'];
      if (1 == song_no) {
        // ignore: prefer_interpolation_to_compose_strings
        if (songId == '111' || songId == '113') {
          // ignore: prefer_interpolation_to_compose_strings
          songFull = "$songFull\n" + songText;
        }
      } else {
        if (songId == song_no) {
          // ignore: prefer_interpolation_to_compose_strings
          songFull = "$songFull\n" + songText;
        }
      }
      _song.add({
        'song': songFull,
        'link': "http://www.sriramana.org/music/7daytamilparayana/" +
            '11arunachala_mahatmiyam.mp3',
        'song_file_name': '11arunachala_mahatmiyam.mp3',
      });
    }
  });
  // _song = songs;
}
