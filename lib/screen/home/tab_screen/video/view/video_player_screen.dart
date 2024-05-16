import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:practice_music_app/screen/home/tab_screen/video/provider/video_provider.dart';
import 'package:provider/provider.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoProvider? providerR;
  VideoProvider? providerW;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState

    context.read<VideoProvider>().playVideo();
  }

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<VideoProvider>();
    providerR = context.read<VideoProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video screen"),
      ),
      body: Chewie(
        controller: providerW!.chewieController!,
      ),
    );
  }
}
