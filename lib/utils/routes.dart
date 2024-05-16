import 'package:flutter/material.dart';
import 'package:practice_music_app/screen/home/tab_screen/music/music_player_view/music_player_screen.dart';
import 'package:practice_music_app/screen/home/view/home_screen.dart';

import '../screen/home/tab_screen/video/view/video_player_screen.dart';

Map<String, WidgetBuilder> screen = {
  '/': (context) => const HomeScreen(),
  'MusicPlayer': (context) => const MusicPlayerScreen(),
  'videoPlayer': (context) => const VideoPlayerScreen(),
};
