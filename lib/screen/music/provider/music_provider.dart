import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../model/music_model.dart';

class MusicProvider with ChangeNotifier {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  int index = 0;
  int m = 0, s = 0, h = 0;
  bool isPlaying = false;
  double indicator = 0.0;
  Duration totalCurrentDuration = const Duration();
  Duration totalLiveDuration = const Duration();
  List<String> l1 = [
    "assets/banner_image/bi1.jpg",
    "assets/banner_image/bi2.jpg",
    "assets/banner_image/bi3.jpg"
  ];

  List<MusicModel> songList = [
    MusicModel(
        name: "Ishaq Jaisa Kuch",
        image:
            "https://pagalfree.com/images/128Ishq Jaisa Kuch - Fighter 128 Kbps.jpg",
        song:
            "https://pagalfree.com/musics/128-Ishq Jaisa Kuch - Fighter 128 Kbps.mp3"),
    MusicModel(
        name: "Pehle bhi main",
        image:
            "https://pagalfree.com/images/128Pehle Bhi Main - Animal 128 Kbps.jpg",
        song:
            "https://pagalfree.com/musics/128-Pehle Bhi Main - Animal 128 Kbps.mp3"),
    MusicModel(
        name: "Beast Mode",
        image:
            "https://pagalfree.com/images/128Beast Mode - Beast 128 Kbps.jpg",
        song:
            "https://pagalfree.com/musics/128-Beast Mode - Beast 128 Kbps.mp3"),
  ];

  void playPause() {
    isPlaying = !isPlaying;
    liveDuration();
    notifyListeners();
  }

  void changeIndex() {
    index = index;
    notifyListeners();
  }

  void changeIndicator(double indicator) {
    this.indicator = indicator;
    notifyListeners();
  }

  void liveDuration() {
    assetsAudioPlayer.currentPosition.listen((event) {
      totalLiveDuration = event;
      notifyListeners();
    });
  }

  void currentDuration() {
    assetsAudioPlayer.current.listen((event) {
      if (event != null) {
        totalCurrentDuration = event.audio.duration;

        if (totalCurrentDuration.inSeconds >= 60) {
          s = totalCurrentDuration.inSeconds;

          m = s ~/ 60;
          s = s - (m * 60);

          if (m >= 60) {
            h = m ~/ 60;
            m = m - (h * 60);
          }
        }
        notifyListeners();
      }
    });
  }

  musicPlayer() async {
    await assetsAudioPlayer.open(
      Playlist(
        audios: songList.map((e) => Audio.network(e.song!)).toList(),
        startIndex: index,
      ),
      autoStart: false,
    );
    currentDuration();
  }
}
