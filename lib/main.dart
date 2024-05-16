import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice_music_app/screen/home/tab_screen/music/provider/music_provider.dart';
import 'package:practice_music_app/screen/home/tab_screen/video/provider/video_provider.dart';
import 'package:practice_music_app/utils/routes.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: MusicProvider(),
        ),
        ChangeNotifierProvider.value(
          value: VideoProvider(),
        ),
      ],
      child: MaterialApp(
        routes: screen,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
