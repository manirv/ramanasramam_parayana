import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lyric/lyrics_reader.dart';

import 'const.dart';
import 'dbo.dart';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  AudioPlayer? audioPlayer;
  double sliderProgress = 0;
  //111658;
  int playProgress = 0; //111658;
  double max_value = 211658;
  bool isTap = false;
  static int currentDay = 1;
  static int currentSong = 1;
  static List<String> songList = [];

  bool useEnhancedLrc = false;
  final _documents = [];
  List<Map<String, Object?>> _data = [];
  String _selectedYear = "2022";
  TextEditingController _yearController = TextEditingController();
  final DateTime _currentYear = DateTime.now();

  _getdb() async {
    _documents.clear();

    var dbDir = await getDatabasesPath();
    var dbPath = path.join(dbDir, "app.db");
    await deleteDatabase(dbPath);
    ByteData data = await rootBundle.load("assets/tamil_parayana.db");
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes);
    var db = await openDatabase(dbPath);
    var query =
        "select day_no,song_id,song_title_no, song_sub_title,song, timed_song from tamil_songs_new where day_no=$currentDay  order by day_no, song_id";
    db.rawQuery(query).then((value) {
      List s = value;
      var prevSongTitle = 0;
      // List<String> songList = [];
      var songFullText = "";
      bool adding = false;
      for (var i = 0; i < s.length; i++) {
        // TO DO
        var row = s[i];
        var dayNo = row['day_no'];
        var songText = row['timed_song'];
        var songId = row['song_id'];
        var songTitleNo = row['song_title_no'];
        print('Song title no is: $songTitleNo');
        print('Song id is: $songId');
        print('Song is: $songText');

        // if (dayNo == 1 &&
        //     (songTitleNo == 0 || songTitleNo == 1 || songTitleNo == 2)) {
        //   if (songText != null) {
        //     songFullText = "$songFullText\n" + songText;
        //   }
        // } else {
        if (prevSongTitle == songTitleNo) {
          // ignore: prefer_interpolation_to_compose_strings
          if (songText != null) {
            songFullText = "$songFullText\n" + songText;
          }
        } else {
          if (prevSongTitle > 0) {
            songList.add(songFullText);
          }
          songFullText = "";
          songFullText = songText;
        }
        // }
        prevSongTitle = songTitleNo;
      } //Enf of For loop
      // _song.add({
      //   'song': songFull,
      //   'link': "http://www.sriramana.org/music/7daytamilparayana/" +
      //       '11arunachala_mahatmiyam.mp3',
      //   'song_file_name': '11arunachala_mahatmiyam.mp3',
      // });
      // }
      // setState(() {
      //   _data = [];
      //   _data = value;
      songList.add(songFullText);

      //tamilLyric = songList;
      //print(songList[0]);
    });
  }

  var lyricModel = LyricsModelBuilder.create()
      .bindLyricToMain("")
      .bindLyricToExt("")
      .getModel();

  var lyricUI = UINetease();

  @override
  void initState() {
    super.initState();
    lyricUI.defaultSize = 30;
    lyricUI.defaultExtSize = 14;
    lyricUI.otherMainSize = 15;
    lyricUI.bias = 0.5;
    lyricUI.lineGap = 10;
    lyricUI.inlineGap = 25;
    lyricUI.lyricAlign = LyricAlign.LEFT;
    lyricUI.lyricBaseLine = LyricBaseLine.CENTER;
    lyricUI.highlight = true;
    lyricUI.highlightDirection = HighlightDirection.LTR;
    _getdb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sri Ramanasramam Parayana'),
      ),
      body: buildContainer(),
    );
  }

  Widget buildContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildReaderWidget(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...buildPlayControl(),
                //...buildUIControl(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  var lyricPadding = 40.0;

  Stack buildReaderWidget() {
    return Stack(
      children: [
        ...buildReaderBackground(),
        LyricsReader(
          padding: EdgeInsets.symmetric(horizontal: lyricPadding),
          model: lyricModel,
          position: playProgress,
          lyricUi: lyricUI,
          playing: playing,
          size: Size(double.infinity, MediaQuery.of(context).size.height / 2),
          emptyBuilder: () => Center(
            child: Text(
              "No lyrics",
              style: lyricUI.getOtherMainTextStyle(),
            ),
          ),
          selectLineBuilder: (progress, confirm) {
            return Row(
              children: [
                IconButton(
                    onPressed: () {
                      LyricsLog.logD("click event");
                      confirm.call();
                      setState(() {
                        audioPlayer?.seek(Duration(milliseconds: progress));
                      });
                    },
                    icon: Icon(Icons.play_arrow, color: Colors.green)),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.green),
                    height: 1,
                    width: double.infinity,
                  ),
                ),
                Text(
                  progress.toString(),
                  style: TextStyle(color: Colors.green),
                )
              ],
            );
          },
        )
      ],
    );
  }

  List<Widget> buildPlayControl() {
    return [
      Container(
        height: 10,
      ),
      // Text(
      //   "Progress:$sliderProgress",
      //   style: TextStyle(
      //     fontSize: 16,
      //     color: Colors.green,
      //   ),
      // ),
      if (sliderProgress < max_value)
        Slider(
          min: 0,
          max: max_value,
          label: sliderProgress.toString(),
          value: sliderProgress,
          activeColor: Colors.blueGrey,
          inactiveColor: Colors.blue,
          onChanged: (double value) {
            setState(() {
              sliderProgress = value;
            });
          },
          onChangeStart: (double value) {
            isTap = true;
          },
          onChangeEnd: (double value) {
            isTap = false;
            setState(() {
              playProgress = value.toInt();
            });
            audioPlayer?.seek(Duration(milliseconds: value.toInt()));
          },
        ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () async {
                currentSong = currentSong - 1;
                audioPlayer?.stop();
                var songIndex = getSongIndex(currentDay, currentSong);
                audioPlayer = null;
                lyricModel = LyricsModelBuilder.create()
                    .bindLyricToMain(songList[songIndex])
                    .bindLyricToExt(transLyric)
                    .getModel();
                audioPlayer = AudioPlayer()
                  ..play(AssetSource(mp3_tamil_list[songIndex]));
                //..play(DeviceFileSource(localFile));
                setState(() {
                  playing = true;
                });
                audioPlayer?.onDurationChanged.listen((Duration event) {
                  setState(() {
                    max_value = event.inMilliseconds.toDouble();
                  });
                });
                audioPlayer?.onPositionChanged.listen((Duration event) {
                  if (isTap) return;
                  setState(() {
                    sliderProgress = event.inMilliseconds.toDouble();
                    playProgress = event.inMilliseconds;
                  });
                });

                audioPlayer?.onPlayerStateChanged.listen((PlayerState state) {
                  setState(() {
                    playing = state == PlayerState.playing;
                  });
                });
              },
              child: Text("Prev")),
          Container(
            width: 10,
          ),
          TextButton(
              onPressed: () async {
                if (audioPlayer == null) {
                  //var localFile = await downloadSong(day, song_no);
                  //var localFile = songs_fullpath_name(day,song_no)
                  var songIndex = getSongIndex(currentDay, currentSong);
                  audioPlayer = null;
                  lyricModel = LyricsModelBuilder.create()
                      .bindLyricToMain(songList[songIndex])
                      .bindLyricToExt(transLyric)
                      .getModel();
                  audioPlayer = AudioPlayer()
                    ..play(AssetSource(mp3_tamil_list[songIndex]));
                  //..play(DeviceFileSource(localFile));
                  setState(() {
                    playing = true;
                  });
                  audioPlayer?.onDurationChanged.listen((Duration event) {
                    setState(() {
                      max_value = event.inMilliseconds.toDouble();
                    });
                  });
                  audioPlayer?.onPositionChanged.listen((Duration event) {
                    if (isTap) return;
                    setState(() {
                      sliderProgress = event.inMilliseconds.toDouble();
                      playProgress = event.inMilliseconds;
                    });
                  });

                  audioPlayer?.onPlayerStateChanged.listen((PlayerState state) {
                    setState(() {
                      playing = state == PlayerState.playing;
                    });
                  });
                } else {
                  audioPlayer?.resume();
                }
              },
              child: Text("Play")),
          Container(
            width: 10,
          ),
          TextButton(
              onPressed: () async {
                audioPlayer?.pause();
              },
              child: Text("Pause")),
          Container(
            width: 10,
          ),
          TextButton(
              onPressed: () async {
                audioPlayer?.stop();
                //audioPlayer = null;
              },
              child: Text("Stop")),
          Container(
            width: 10,
          ),
          TextButton(
              onPressed: () async {
                currentSong = currentSong + 1;
                audioPlayer?.stop();
                // await getSong(1, 1);
                // var song = await getData();
                var songIndex = getSongIndex(currentDay, currentSong);
                audioPlayer = null;
                lyricModel = LyricsModelBuilder.create()
                    .bindLyricToMain(songList[songIndex])
                    .bindLyricToExt(transLyric)
                    .getModel();
                audioPlayer = AudioPlayer()
                  ..play(AssetSource(mp3_tamil_list[songIndex]));
                //..play(DeviceFileSource(localFile));
                setState(() {
                  playing = true;
                });
                audioPlayer?.onDurationChanged.listen((Duration event) {
                  setState(() {
                    max_value = event.inMilliseconds.toDouble();
                  });
                });
                audioPlayer?.onPositionChanged.listen((Duration event) {
                  if (isTap) return;
                  setState(() {
                    sliderProgress = event.inMilliseconds.toDouble();
                    playProgress = event.inMilliseconds;
                  });
                });

                audioPlayer?.onPlayerStateChanged.listen((PlayerState state) {
                  setState(() {
                    playing = state == PlayerState.playing;
                  });
                });
              },
              child: Text("Next")),
        ],
      ),
    ];
  }

  var playing = false;

  List<Widget> buildReaderBackground() {
    return [
      Positioned.fill(
        child: Image.asset(
          "bhagavan_sitting.png",
          fit: BoxFit.cover,
        ),
      ),
      Positioned.fill(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
      )
    ];
  }

  var mainTextSize = 30.0;
  var extTextSize = 15.0;
  var lineGap = 10.0;
  var inlineGap = 10.0;
  var lyricAlign = LyricAlign.LEFT;
  var highlightDirection = HighlightDirection.LTR;

  List<Widget> buildUIControl() {
    return [
      Container(
        height: 30,
      ),
      Text("UI setting", style: TextStyle(fontWeight: FontWeight.bold)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
              value: lyricUI.enableHighlight(),
              onChanged: (value) {
                setState(() {
                  lyricUI.highlight = (value ?? false);
                  refreshLyric();
                });
              }),
          Text("enable highLight"),
          // Checkbox(
          //     value: useEnhancedLrc,
          //     onChanged: (value) {
          //       setState(() {
          //         useEnhancedLrc = value!;
          //         lyricModel = LyricsModelBuilder.create()
          //             .bindLyricToMain(value ? advancedLyric : normalLyric)
          //             .bindLyricToExt(transLyric)
          //             .getModel();
          //       });
          //     }),
          // Text("use Enhanced lrc")
        ],
      ),
      // buildTitle("highlight direction"),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: HighlightDirection.values
            .map(
              (e) => Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Radio<HighlightDirection>(
                        activeColor: Colors.orangeAccent,
                        value: e,
                        groupValue: highlightDirection,
                        onChanged: (v) {
                          setState(() {
                            highlightDirection = v!;
                            lyricUI.highlightDirection = highlightDirection;
                            refreshLyric();
                          });
                        }),
                    Text(e.toString().split(".")[1])
                  ],
                ),
              )),
            )
            .toList(),
      ),
      buildTitle("lyric padding"),
      Slider(
        min: 0,
        max: 100,
        label: lyricPadding.toString(),
        value: lyricPadding,
        activeColor: Colors.blueGrey,
        inactiveColor: Colors.blue,
        onChanged: (double value) {
          setState(() {
            lyricPadding = value;
          });
        },
      ),
      buildTitle("lyric primary text size"),
      Slider(
        min: 15,
        max: 30,
        label: mainTextSize.toString(),
        value: mainTextSize,
        activeColor: Colors.blueGrey,
        inactiveColor: Colors.blue,
        onChanged: (double value) {
          setState(() {
            mainTextSize = value;
          });
        },
        onChangeEnd: (double value) {
          setState(() {
            lyricUI.defaultSize = mainTextSize;
            refreshLyric();
          });
        },
      ),
      buildTitle("lyric secondary text size"),
      Slider(
        min: 15,
        max: 30,
        label: extTextSize.toString(),
        value: extTextSize,
        activeColor: Colors.blueGrey,
        inactiveColor: Colors.blue,
        onChanged: (double value) {
          setState(() {
            extTextSize = value;
          });
        },
        onChangeEnd: (double value) {
          setState(() {
            lyricUI.defaultExtSize = extTextSize;
            refreshLyric();
          });
        },
      ),
      buildTitle("lyric line spacing"),
      Slider(
        min: 10,
        max: 80,
        label: lineGap.toString(),
        value: lineGap,
        activeColor: Colors.blueGrey,
        inactiveColor: Colors.blue,
        onChanged: (double value) {
          setState(() {
            lineGap = value;
          });
        },
        onChangeEnd: (double value) {
          setState(() {
            lyricUI.lineGap = lineGap;
            refreshLyric();
          });
        },
      ),
      buildTitle("primary and secondary lyric spacing"),
      Slider(
        min: 10,
        max: 80,
        label: inlineGap.toString(),
        value: inlineGap,
        activeColor: Colors.blueGrey,
        inactiveColor: Colors.blue,
        onChanged: (double value) {
          setState(() {
            inlineGap = value;
          });
        },
        onChangeEnd: (double value) {
          setState(() {
            lyricUI.inlineGap = inlineGap;
            refreshLyric();
          });
        },
      ),
      buildTitle("select line bias"),
      Slider(
        min: 0.3,
        max: 0.8,
        label: bias.toString(),
        value: bias,
        activeColor: Colors.blueGrey,
        inactiveColor: Colors.blue,
        onChanged: (double value) {
          setState(() {
            bias = value;
          });
        },
        onChangeEnd: (double value) {
          setState(() {
            lyricUI.bias = bias;
            refreshLyric();
          });
        },
      ),
      buildTitle("lyric align"),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: LyricAlign.values
            .map(
              (e) => Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Radio<LyricAlign>(
                        activeColor: Colors.orangeAccent,
                        value: e,
                        groupValue: lyricAlign,
                        onChanged: (v) {
                          setState(() {
                            lyricAlign = v!;
                            lyricUI.lyricAlign = lyricAlign;
                            refreshLyric();
                          });
                        }),
                    Text(e.toString().split(".")[1])
                  ],
                ),
              )),
            )
            .toList(),
      ),
      buildTitle("select line base"),
      Row(
        children: LyricBaseLine.values
            .map((e) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Radio<LyricBaseLine>(
                            activeColor: Colors.orangeAccent,
                            value: e,
                            groupValue: lyricBiasBaseLine,
                            onChanged: (v) {
                              setState(() {
                                lyricBiasBaseLine = v!;
                                lyricUI.lyricBaseLine = lyricBiasBaseLine;
                                refreshLyric();
                              });
                            }),
                        Text(e.toString().split(".")[1])
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    ];
  }

  void refreshLyric() {
    lyricUI = UINetease.clone(lyricUI);
  }

  var bias = 0.5;
  var lyricBiasBaseLine = LyricBaseLine.CENTER;

  Text buildTitle(String title) => Text(title,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green));

  downloadSong(day, song_no) {
    //Download the song to the local download folder.
    return "path_to_file";
  }
}
