import 'package:flutter/material.dart';
import 'package:practice_music_app/screen/home/tab_screen/music/provider/music_provider.dart';
import 'package:provider/provider.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  MusicProvider? providerR;
  MusicProvider? providerW;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MusicProvider>().musicPlayer();
    context.read<MusicProvider>().currentDuration();
  }
  @override
  Widget build(BuildContext context) {
    providerW = context.watch<MusicProvider>();
    providerR = context.read<MusicProvider>();

    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text(providerW!.songList[index].name!),
      ),
      body: Column(
        children: [
          Image.network(providerW!.songList[index].image!),
          Slider(
            value: 1,
            onChanged: (value) {},
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("data"),
                Text("${providerW!.h}:${providerW!.m}:${providerW!.s} "),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.forward_10_outlined),
              ),
              IconButton(
                onPressed: () {
                  providerW!.assetsAudioPlayer.previous();

                  providerW!.isPlaying = false;
                  providerR!.playPause();
                },
                icon: const Icon(Icons.skip_previous),
              ),
              IconButton(
                onPressed: () {
                  if (providerW!.isPlaying) {
                    providerW!.assetsAudioPlayer.play();
                    providerR!.playPause();
                  } else {
                    providerW!.assetsAudioPlayer.pause();
                    providerR!.playPause();
                  }
                },
                icon: providerW!.isPlaying
                    ? const Icon(Icons.play_arrow)
                    : const Icon(Icons.pause),
              ),
              IconButton(
                onPressed: () {
                  providerW!.assetsAudioPlayer.next();
                  providerW!.isPlaying = false;
                  providerR!.playPause();
                },
                icon: const Icon(Icons.skip_next),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.forward_10_outlined),
              ),
            ],
          )
        ],
      ),
    );
  }
}
