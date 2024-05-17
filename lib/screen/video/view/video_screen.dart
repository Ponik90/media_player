import 'package:flutter/material.dart';
import 'package:practice_music_app/screen/video/provider/video_provider.dart';
import 'package:provider/provider.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoProvider? providerR;
  VideoProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<VideoProvider>();
    providerR = context.read<VideoProvider>();
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: providerW!.videoList.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.pushNamed(context, 'videoPlayer');
                },
                title: Text("${providerW!.videoList[index].name}"),
              );
            },
          ),
        )
      ],
    );
  }
}
