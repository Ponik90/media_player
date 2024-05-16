import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoProvider with ChangeNotifier {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  void playVideo() {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"));
    videoPlayerController!.initialize();
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController!, autoPlay: true);
    notifyListeners();
  }
}
