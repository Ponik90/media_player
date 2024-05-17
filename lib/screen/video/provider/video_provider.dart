import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:practice_music_app/screen/video/model/video_model.dart';
import 'package:video_player/video_player.dart';

class VideoProvider with ChangeNotifier {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  int videoIndex = 0;
  List<VideoModel> videoList = [
    VideoModel(name: "video1", video: "assets/video_song/video1.mp4"),
    VideoModel(name: "video2", video: "assets/video_song/video2.mp4"),
    VideoModel(name: "video3", video: "assets/video_song/video3.mp4"),
    VideoModel(name: "video4", video: "assets/video_song/video4.mp4"),
  ];

  void playVideo() async {
    videoPlayerController = VideoPlayerController.asset("$videoList");
    videoPlayerController!.initialize();
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController!, autoPlay: true);

    notifyListeners();
  }
}
