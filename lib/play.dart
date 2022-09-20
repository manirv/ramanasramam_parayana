import 'dart:io';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lyric/lyrics_reader.dart';
//import 'package:interactive_tamil_parayana/dbo%20copy.dart';
import 'package:interactive_tamil_parayana/download.dart';
import 'package:interactive_tamil_parayana/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'const.dart';

import 'package:android_path_provider/android_path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:interactive_tamil_parayana/const.dart';
import 'package:path_provider/path_provider.dart';

const debug = false;

class PlayPage extends StatefulWidget {
  final AudioPlayer audioPlayer;

  PlayPage({
    Key? key,
    required this.audioPlayer, // here we set first value
  }) : super(key: key);

  //  PlayPage(
  //        Key? key,
  //    required this.audioPlayer,}
  //   {super.key});

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  // with SingleTickerProviderStateMixin {
  late AudioPlayer? audioPlayer = widget.audioPlayer;
  double sliderProgress = 0;
  static GlobalPlatformInterface get _global => AudioPlayer.global;
  AudioContextConfig config = AudioContextConfig();

  //111658;
  int playProgress = 0; //111658;
  double max_value = 211658;
  bool isTap = false;
  //static int currentDay = 1;
  //static int currentSong = 1;
  static List<String> songList = [];
  static List<String> engSongList = [];

  bool useEnhancedLrc = false;
  final _documents = [];
  late String localPath;

  _getdb() async {
    _documents.clear();
    DownloadUtil._findLocalPath().then((value) => localPath = value!);

    var dbDir = await getDatabasesPath();
    var dbPath = path.join(dbDir, "app.db");
    await deleteDatabase(dbPath);
    ByteData data = await rootBundle.load("assets/tamil_parayana.db");
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes);
    var db = await openDatabase(dbPath);
    var query =
        "select day_no,song_id,song_title_no, song_sub_title,song, timed_song from tamil_songs_new where timed_song is not null  order by day_no, song_id";
    await db.rawQuery(query).then((value) async {
      List s = value;
      var prevSongTitle = 0;
      // List<String> songList = [];
      var songFullText = "";
      var engSongFullText = "";
      bool adding = false;
      for (var i = 0; i < s.length; i++) {
        // TO DO
        var row = s[i];
        var dayNo = row['day_no'];
        var songText = row['timed_song'];
        var songId = row['song_id'];
        var songTitleNo = row['song_title_no'];
        if (debug) {
          print('Song title no is: $songTitleNo');
          print('Song id is: $songId');
          print('Song is: $songText');
        }
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

      var engQuery =
          "select day_no,song_id,song_title_no, song_sub_title,song, timed_song from eng_songs_new where timed_song is not null  order by day_no, song_id";
      await db.rawQuery(engQuery).then((value) {
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
          if (debug) {
            print('Song title no is: $songTitleNo');
            print('Song id is: $songId');
            print('Song is: $songText');
          }
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
              engSongList.add(songFullText);
            }
            songFullText = "";
            songFullText = songText;
          }
          // }
          prevSongTitle = songTitleNo;
        } //Enf of For loop
        engSongList.add(songFullText);

        //tamilLyric = songList;
        if (debug) {
          print(engSongList[0]);
        }
        lyricModel = LyricsModelBuilder.create()
            .bindLyricToMain(
                getLyricsList()[getSongIndex(currentDay, currentSong)])
            .bindLyricToExt("")
            .getModel();
        DownloadUtil._getFilesList();
        _global.setGlobalAudioContext(config.build());
        setState(() {
          //currentSong = currentSong + 1;
        });
      });
    });
  }

  static getLyricsList() {
    return selectedLanguage == "Tamil" ? songList : engSongList;
  }

  late var lyricModel = LyricsModelBuilder.create()
      .bindLyricToMain("")
      .bindLyricToExt("")
      .getModel();
  var lyricUI = UINetease();

  @override
  void initState() {
    super.initState();
    lyricUI.defaultSize = 30;
    lyricUI.defaultExtSize = screenHeight / 20;
    lyricUI.otherMainSize = screenHeight / 20;
    lyricUI.bias = 0.5;
    lyricUI.lineGap = 10;
    lyricUI.inlineGap = 25;
    lyricUI.lyricAlign = LyricAlign.CENTER;
    lyricUI.lyricBaseLine = LyricBaseLine.CENTER;
    lyricUI.highlight = true;
    lyricUI.highlightDirection = HighlightDirection.LTR;
    _getdb();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
  ]);
  }

  @override
  void dispose() {
    audioPlayer?.stop();
    audioPlayer?.seek(const Duration(milliseconds: 0));
     SystemChrome.setPreferredOrientations([
    //DeviceOrientation.landscapeRight,
   // DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Sri Ramana Parayana',
            style: TextStyle(fontSize: screenHeight / 35),
          ),
          leadingWidth: screenWidth / 11,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_outlined,
                  size: screenHeight / 30),
              onPressed: () {
                Navigator.pop(context, true);
              }),
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
                      lyricModel = LyricsModelBuilder.create()
                          .bindLyricToMain(getLyricsList()[
                              getSongIndex(currentDay, currentSong)])
                          .bindLyricToExt("")
                          .getModel();
                      refreshLyric();
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
                      lyricModel = LyricsModelBuilder.create()
                          .bindLyricToMain(getLyricsList()[
                              getSongIndex(currentDay, currentSong)])
                          .bindLyricToExt("")
                          .getModel();
                      refreshLyric();
                    });
                  },
                ),
                // const PopupMenuItem(
                //   enabled: false,
                //   textStyle: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     color: Colors.black,
                //   ),
                //   child: Text("Settings"),
                // ),
                // const PopupMenuDivider(
                //   height: 0,
                // ),
                // PopupMenuItem(
                //   textStyle: TextStyle(color: Colors.white),
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       const Icon(Icons.download),
                //       const Text("Download Manager"),
                //     ],
                //   ),
                //   onTap: () {
                //     audioPlayer!.stop();
                //     Navigator.pushNamed(context, '/download');
                //     setState(() {});
                //   },
                // ),
              ],
            )
          ]),
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
          size: Size(double.infinity, screenHeight / 1.3),
          emptyBuilder: () => Center(
            child: Text(
              "Click on Play Button to Play with Verses",
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
                    icon: const Icon(Icons.play_arrow, color: Colors.green)),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.green),
                    height: 1,
                    width: double.infinity,
                  ),
                ),
                Text(
                  progress.toString(),
                  style: const TextStyle(color: Colors.green),
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
          activeColor: Colors.purpleAccent,
          // inactiveColor: Colors.,
          onChanged: (double value) {
            if (mounted) {
              setState(() {
                sliderProgress = value;
              });
            }
          },
          onChangeStart: (double value) {
            isTap = true;
          },
          onChangeEnd: (double value) {
            isTap = false;
            if (mounted) {
              setState(() {
                playProgress = value.toInt();
              });
            }
            audioPlayer?.seek(Duration(milliseconds: value.toInt()));
          },
        ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () async {
              DownloadUtil._refreshTasks();
              audioPlayer?.stop();
              prevSong();
              setState(() {
                // currentSong = currentSong - 1;
              });
              var songIndex = getSongIndex(currentDay, currentSong);
              //audioPlayer = null;
              lyricModel = LyricsModelBuilder.create()
                  .bindLyricToMain(getLyricsList()[songIndex])
                  .bindLyricToExt(transLyric)
                  .getModel();
              String songName = mp3_tamil_list[songIndex];
              // DownloadUtil._refreshTasks().then((value) {
              _TaskInfo? tInfo = DownloadUtil._itemsMap[songName];
              var id = tInfo?.taskId;
              var status = tInfo?.status;
              var progress = tInfo?.progress;
              if (debug) {
                print(
                    'Task download status: task ($id)) is in status ($status) and process ($progress)');
              }
              if (id == null && tInfo?.status == DownloadTaskStatus.undefined) {
                DownloadUtil._requestDownload(tInfo!);
                showToaster(
                    "The requested song is being downloaded! Please wait",
                    context);
                // int? prog = tInfo?.progress;
                // if (prog! < 5) {
                //   DownloadUtil._delete(tInfo!);
                // }

              } else if (tInfo?.status == DownloadTaskStatus.enqueued) {
                showToaster(
                    "Download is still in progress! Please click play again, later.",
                    context);
              } else if (tInfo?.status == DownloadTaskStatus.running) {
                showToaster(
                    "Download is still in progress! Please click play again, later.",
                    context);
              } else if (tInfo?.status == DownloadTaskStatus.paused) {
                // int? prog = tInfo?.progress;
                // if (prog! < 5) {
                //   DownloadUtil._delete(tInfo!);
                // }
                showToaster(
                    "The requested song is being downloaded! Please play later.",
                    context);
              } else if (tInfo?.status == DownloadTaskStatus.complete) {
                // audioPlayer?.setVolume(1.0);
                audioPlayer //= AudioPlayer()
                    ?.play(DeviceFileSource(localPath +
                        "/" +
                        songName)); // will immediately start playing
                // ..play(AssetSource(mp3_tamil_list[songIndex]));
                setState(() {
                  playing = true;
                });
                audioPlayer?.onDurationChanged.listen((Duration event) {
                  if (!mounted) return;
                  setState(() {
                    max_value = event.inMilliseconds.toDouble();
                  });
                });
                audioPlayer?.onPositionChanged.listen((Duration event) {
                  if (isTap) return;
                  if (!mounted) return;
                  setState(() {
                    sliderProgress = event.inMilliseconds.toDouble();
                    playProgress = event.inMilliseconds;
                  });
                });

                audioPlayer?.onPlayerStateChanged.listen((PlayerState state) {
                  if (!mounted) return;
                  setState(() {
                    playing = state == PlayerState.playing;
                  });
                });
              }
              DownloadUtil._refreshTasks();
              // });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.skip_previous,
                  size: screenHeight / 20,
                ), // icon
                Text("Prev") // text
              ],
            ),
          ),
          Container(
            width: 10,
          ),
          TextButton(
            onPressed: () async {
              DownloadUtil._refreshTasks();
              if (playing) {
                audioPlayer!.pause();
              } else if (!playing) {
                if (audioPlayer != null) {
                  // _requestDownload(_TaskInfo task)
                  //var localFile = await downloadSong(day, song_no);
                  //var localFile = songs_fullpath_name(day,song_no)
                  var songIndex = getSongIndex(currentDay, currentSong);
                  //audioPlayer = null;
                  lyricModel = LyricsModelBuilder.create()
                      .bindLyricToMain(getLyricsList()[songIndex])
                      .bindLyricToExt(transLyric)
                      .getModel();
                  String songName = mp3_tamil_list[songIndex];
                  // DownloadUtil._refreshTasks().then((value) {
                  _TaskInfo? tInfo = DownloadUtil._itemsMap[songName];
                  var id = tInfo?.taskId;
                  var status = tInfo?.status;
                  var progress = tInfo?.progress;
                  if (debug) {
                    print(
                        'Task download status: task ($id)) is in status ($status) and process ($progress)');
                  }
                  if (id == null &&
                      tInfo?.status == DownloadTaskStatus.undefined) {
                    DownloadUtil._requestDownload(tInfo!);
                    showToaster(
                        "The requested song is being downloaded! Please wait...",
                        context);
                    // audioPlayer //= AudioPlayer()
                    //     ?.play(DeviceFileSource(localPath +
                    //         "/" +
                    //         songName)); // will immediately start playing
                    // await audioPlayer?.setVolume(1.0);

                    // //..play(DeviceFileSource(localFile));
                    // setState(() {
                    //   playing = true;
                    // });
                  } else if (tInfo?.status == DownloadTaskStatus.enqueued) {
                    showToaster(
                        "Download is still in progress! Please click play again, later.",
                        context);
                  } else if (tInfo?.status == DownloadTaskStatus.running) {
                    showToaster(
                        "Download is still in progress! Please click play again, later.",
                        context);
                  } else if (tInfo?.status == DownloadTaskStatus.paused) {
                    DownloadUtil._resumeDownload(tInfo!);
                    showToaster(
                        "The requested song is being downloaded! Please play later.",
                        context);
                  } else if (tInfo?.status == DownloadTaskStatus.complete) {
                    audioPlayer //= AudioPlayer()
                        ?.play(DeviceFileSource(localPath +
                            "/" +
                            songName)); // will immediately start playing
                    //?.play(AssetSource(mp3_tamil_list[songIndex]));
                    //..play(DeviceFileSource(localFile));
                    if (!mounted) return;
                    setState(() {
                      playing = true;
                    });
                    audioPlayer?.onDurationChanged.listen((Duration event) {
                      if (!mounted) return;
                      setState(() {
                        max_value = event.inMilliseconds.toDouble();
                      });
                    });
                    audioPlayer?.onPositionChanged.listen((Duration event) {
                      if (isTap) return;
                      if (!mounted) return;
                      setState(() {
                        sliderProgress = event.inMilliseconds.toDouble();
                        playProgress = event.inMilliseconds;
                      });
                    });

                    audioPlayer?.onPlayerStateChanged
                        .listen((PlayerState state) {
                      if (!mounted) return;
                      setState(() {
                        playing = state == PlayerState.playing;
                      });
                    });
                  }
                  DownloadUtil._refreshTasks();
                  // });
                }
              }
            },
            child: !playing
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.play_arrow,
                        size: screenHeight / 20,
                      ), // icon
                      Text("Play") // text
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.pause,
                        size: screenHeight / 20,
                      ), // icon
                      Text("Pause") // text
                    ],
                  ),
          ),

          // TextButton(
          //   onPressed: () async {
          //     if (audioPlayer != null) {
          //       //var localFile = await downloadSong(day, song_no);
          //       //var localFile = songs_fullpath_name(day,song_no)
          //       var songIndex = getSongIndex(currentDay, currentSong);
          //       //audioPlayer = null;
          //       lyricModel = LyricsModelBuilder.create()
          //           .bindLyricToMain(getLyricsList()[songIndex])
          //           .bindLyricToExt(transLyric)
          //           .getModel();
          //       audioPlayer //= AudioPlayer()
          //           ?.play(AssetSource(mp3_tamil_list[songIndex]));
          //       //..play(DeviceFileSource(localFile));
          //       if (!mounted) return;
          //       setState(() {
          //         playing = true;
          //       });
          //       audioPlayer?.onDurationChanged.listen((Duration event) {
          //         if (!mounted) return;
          //         setState(() {
          //           max_value = event.inMilliseconds.toDouble();
          //         });
          //       });
          //       audioPlayer?.onPositionChanged.listen((Duration event) {
          //         if (isTap) return;
          //         if (!mounted) return;
          //         setState(() {
          //           sliderProgress = event.inMilliseconds.toDouble();
          //           playProgress = event.inMilliseconds;
          //         });
          //       });

          //       audioPlayer?.onPlayerStateChanged.listen((PlayerState state) {
          //         if (!mounted) return;
          //         setState(() {
          //           playing = state == PlayerState.playing;
          //         });
          //       });
          //     } else {
          //       // audioPlayer?.resume();
          //     }
          //   },
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: const <Widget>[
          //       CircleAvatar(child: Icon(Icons.play_arrow)), // icon
          //       Text("Play") // text
          //     ],
          //   ),
          // ),
          // Container(
          //   width: 10,
          // ),
          // TextButton(
          //   onPressed: () async {
          //     audioPlayer?.pause();
          //   },
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: const <Widget>[
          //       Icon(Icons.pause), // icon
          //       Text("Pause") // text
          //     ],
          //   ),
          // ),
          Container(
            width: 10,
          ),
          TextButton(
            onPressed: () async {
              audioPlayer?.stop();
              //audioPlayer = null;
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.stop,
                  size: screenHeight / 20,
                ), // icon
                Text("Stop") // text
              ],
            ),
          ),
          Container(
            width: 10,
          ),
          TextButton(
            onPressed: () async {
              DownloadUtil._refreshTasks();
              audioPlayer?.stop();
              nextSong();
              setState(() {
                //currentSong = currentSong + 1;
              });
              // await getSong(1, 1);
              // var song = await getData();
              var songIndex = getSongIndex(currentDay, currentSong);
              // audioPlayer = null;
              lyricModel = LyricsModelBuilder.create()
                  .bindLyricToMain(getLyricsList()[songIndex])
                  .bindLyricToExt(transLyric)
                  .getModel();
              String songName = mp3_tamil_list[songIndex];
              // DownloadUtil._refreshTasks().then((value) {
              _TaskInfo? tInfo = DownloadUtil._itemsMap[songName];
              var id = tInfo?.taskId;
              var status = tInfo?.status;
              var progress = tInfo?.progress;
              if (debug) {
                print(
                    'Task download status: task ($id)) is in status ($status) and process ($progress)');
              }
              if (id == null && tInfo?.status == DownloadTaskStatus.undefined) {
                DownloadUtil._requestDownload(tInfo!);
                showToaster(
                    "The requested song is being downloaded! Please play later.",
                    context);
              } else if (tInfo?.status == DownloadTaskStatus.enqueued) {
                showToaster(
                    "Download is still in progress! Please click play again, later.",
                    context);
              } else if (tInfo?.status == DownloadTaskStatus.running) {
                showToaster(
                    "Download is still in progress! Please click play again, later.",
                    context);
              } else if (tInfo?.status == DownloadTaskStatus.paused) {
                DownloadUtil._resumeDownload(tInfo!);
                showToaster(
                    "The requested song is being downloaded! Please play later.",
                    context);
              } else if (tInfo?.status == DownloadTaskStatus.complete) {
                // audioPlayer?.setVolume(1.0);
                audioPlayer //= AudioPlayer()
                    ?.play(DeviceFileSource(localPath +
                        "/" +
                        songName)); // will immediately start playing
                //..play(DeviceFileSource(localFile));
                setState(() {
                  playing = true;
                });
                audioPlayer?.onDurationChanged.listen((Duration event) {
                  if (!mounted) return;
                  setState(() {
                    max_value = event.inMilliseconds.toDouble();
                  });
                });
                audioPlayer?.onPositionChanged.listen((Duration event) {
                  if (isTap) return;
                  if (!mounted) return;
                  setState(() {
                    sliderProgress = event.inMilliseconds.toDouble();
                    playProgress = event.inMilliseconds;
                  });
                });

                audioPlayer?.onPlayerStateChanged.listen((PlayerState state) {
                  if (!mounted) return;
                  setState(() {
                    playing = state == PlayerState.playing;
                  });
                });
              }
              DownloadUtil._refreshTasks();
              // });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.skip_next,
                  size: screenHeight / 20,
                ), // icon
                Text("Next") // text
              ],
            ),
          ),
        ],
      ),
    ];
  }

  var playing = false;

  List<Widget> buildReaderBackground() {
    return [
      Positioned.fill(
        child: Image.asset(
          "assets/images/bhagavan_sitting.png",
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
      const Text("UI setting", style: TextStyle(fontWeight: FontWeight.bold)),
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
          const Text("enable highLight"),
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
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green));

  downloadSong(day, song_no) {
    //Download the song to the local download folder.
    return "path_to_file";
  }
}

class DownloadUtil {
  static var _permissionReady;
  static var _localPath;
  static var _tasks = [];
  static var _items = [];
  static var _documents = [];
  static bool _isLoading = false;
  static var _data = [];
  static Map<String, _TaskInfo?> _itemsMap = {};
  static ReceivePort _port = ReceivePort();

  static void _getFilesList() async {
    // await FlutterDownloader.initialize();

    _documents.clear();
    for (var i = 0; i <= mp3_tamil_list.length - 1; i++) {
      Map<String, String> doc = {};

      doc['name'] = mp3_tamil_list[i];
      doc['link'] = tamil_mp3_parent_url + mp3_tamil_list[i];
      _documents.add(doc);
    }

    _data = [];
    _data = _documents;
    // _bindBackgroundIsolate();

    FlutterDownloader.registerCallback(downloadCallback);

    _prepare();
  }

  // static void _bindBackgroundIsolate() {
  //   bool isSuccess = IsolateNameServer.registerPortWithName(
  //       _port.sendPort, 'downloader_send_port');
  //   if (!isSuccess) {
  //     _unbindBackgroundIsolate();
  //     _bindBackgroundIsolate();
  //     return;
  //   }
  //   _port.listen((dynamic data) {
  //     if (debug) {
  //       print('UI Isolate Callback: $data');
  //     }
  //     String? id = data[0];
  //     DownloadTaskStatus? status = data[1];
  //     int? progress = data[2];

  //     if (_tasks != null && _tasks!.isNotEmpty) {
  //       final task = _tasks!.firstWhere((task) => task.taskId == id);
  //       task.status = status;
  //       task.progress = progress;
  //     }
  //   });
  // }

  // static void _unbindBackgroundIsolate() {
  //   IsolateNameServer.removePortNameMapping('downloader_send_port');
  // }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    if (debug) {
      print(
          'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
    }
    // final SendPort send =
    //     IsolateNameServer.lookupPortByName('downloader_send_port')!;
    // send.send([id, status, progress]);
  }

  static Future<void> _retryRequestPermission() async {
    final hasGranted = await _checkPermission();

    if (hasGranted) {
      await _prepareSaveDir();
    }

    _permissionReady = hasGranted;
  }

  static void _requestDownload(_TaskInfo task) async {
    task.taskId = await FlutterDownloader.enqueue(
      url: task.link!,
      headers: {"auth": "test_for_sql_encoding"},
      savedDir: _localPath,
      showNotification: true,
      openFileFromNotification: true,
      saveInPublicStorage: true,
    );
  }

  // Not used in the example.
  // void _cancelDownload(_TaskInfo task) async {
  //   await FlutterDownloader.cancel(taskId: task.taskId!);
  // }

  static void _pauseDownload(_TaskInfo task) async {
    await FlutterDownloader.pause(taskId: task.taskId!);
  }

  static void _resumeDownload(_TaskInfo task) async {
    String? newTaskId = await FlutterDownloader.resume(taskId: task.taskId!);
    task.taskId = newTaskId;
  }

  static void _retryDownload(_TaskInfo task) async {
    String? newTaskId = await FlutterDownloader.retry(taskId: task.taskId!);
    task.taskId = newTaskId;
  }

  Future<bool> _openDownloadedFile(_TaskInfo? task) {
    if (task != null) {
      return FlutterDownloader.open(taskId: task.taskId!);
    } else {
      return Future.value(false);
    }
  }

  static void _delete(_TaskInfo task) async {
    await FlutterDownloader.remove(
        taskId: task.taskId!, shouldDeleteContent: true);
    await _prepare();
  }

  static Future<bool> _checkPermission() async {
    return true;
  }

  static Future<Null> _refreshTasks() async {
    final tasks = await FlutterDownloader.loadTasks();

    int count = 0;
    _tasks = [];
    _items = [];

    _tasks.addAll(_documents.map((document) =>
        _TaskInfo(name: document['name'], link: document['link'])));

    _items.add(_ItemHolder(name: 'Parayana Songs'));
    for (int i = count; i < _tasks.length; i++) {
      _items.add(_ItemHolder(name: _tasks[i].name, task: _tasks[i]));
      _itemsMap[_tasks[i].name] = _tasks[i];
      if (_tasks[i].status == DownloadTaskStatus.complete) {
        _itemsMap[_tasks[i].name]!.status = DownloadTaskStatus.complete;
      }
      count++;
    }

    tasks!.forEach((task) {
      for (_TaskInfo info in _tasks) {
        if (info.link == task.url) {
          info.taskId = task.taskId;
          info.status = task.status;
          info.progress = task.progress;
        }
      }
    });
  }

  static Future<Null> _prepare() async {
    final tasks = await FlutterDownloader.loadTasks();

    int count = 0;
    _tasks = [];
    _items = [];

    _tasks.addAll(_documents.map((document) =>
        _TaskInfo(name: document['name'], link: document['link'])));

    _items.add(_ItemHolder(name: 'Parayana Songs'));
    for (int i = count; i < _tasks.length; i++) {
      _items.add(_ItemHolder(name: _tasks[i].name, task: _tasks[i]));
      _itemsMap[_tasks[i].name] = _tasks[i];
      count++;
    }

    // _tasks!.addAll(_images
    //     .map((image) => _TaskInfo(name: image['name'], link: image['link'])));

    // _items.add(_ItemHolder(name: 'Images'));
    // for (int i = count; i < _tasks!.length; i++) {
    //   _items.add(_ItemHolder(name: _tasks![i].name, task: _tasks![i]));
    //   count++;
    // }

    // _tasks!.addAll(_videos
    //     .map((video) => _TaskInfo(name: video['name'], link: video['link'])));

    // _items.add(_ItemHolder(name: 'Videos'));
    // for (int i = count; i < _tasks!.length; i++) {
    //   _items.add(_ItemHolder(name: _tasks![i].name, task: _tasks![i]));
    //   count++;
    // }

    tasks!.forEach((task) {
      for (_TaskInfo info in _tasks) {
        if (info.link == task.url) {
          info.taskId = task.taskId;
          info.status = task.status;
          info.progress = task.progress;
        }
      }
    });

    _permissionReady = await _checkPermission();

    if (_permissionReady) {
      await _prepareSaveDir();
    }

    _isLoading = false;
  }

  static Future<void> _prepareSaveDir() async {
    _localPath = (await _findLocalPath())!;
    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  static Future<String?> _findLocalPath() async {
    var externalStorageDirPath;
    if (Platform.isAndroid) {
      try {
        externalStorageDirPath = await AndroidPathProvider.downloadsPath;
      } catch (e) {
        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    }
    return externalStorageDirPath;
  }
}

class _TaskInfo {
  final String? name;
  final String? link;

  String? taskId;
  int? progress = 0;
  DownloadTaskStatus? status = DownloadTaskStatus.undefined;

  _TaskInfo({this.name, this.link});
}

class _ItemHolder {
  final String? name;
  final _TaskInfo? task;

  _ItemHolder({this.name, this.task});
}
