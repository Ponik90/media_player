import 'package:flutter/material.dart';

import '../../music/view/music_screen.dart';
import '../../video/view/video_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Media App"),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Music",
              ),
              Tab(
                text: "Video",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MusicScreen(),
            VideoScreen(),
          ],
        ),
      ),
    );
  }
}
