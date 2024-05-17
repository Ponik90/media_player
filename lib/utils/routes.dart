import 'package:flutter/material.dart';

import 'package:practice_music_app/screen/home/view/home_screen.dart';

import '../screen/music/view/music_player_screen.dart';
import '../screen/video/view/video_player_screen.dart';

Map<String, WidgetBuilder> screen = {
  '/': (context) => const HomeScreen(),
  'MusicPlayer': (context) => const MusicPlayerScreen(),
  'videoPlayer': (context) => const VideoPlayerScreen(),
};
