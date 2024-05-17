import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/music_provider.dart';

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
    super.initState();
    context.read<MusicProvider>().isPlaying = false;
    context.read<MusicProvider>().musicPlayer();
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
            value: providerW!.totalLiveDuration.inSeconds.toDouble(),
            onChanged: (value) {
              providerW!.assetsAudioPlayer
                  .seek(Duration(seconds: value.toInt()));
            },
            max: providerW!.totalCurrentDuration.inSeconds.toDouble(),
            activeColor: Colors.blueAccent,
            inactiveColor: const Color(0xff344a73),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${providerW!.totalLiveDuration.inSeconds}"),
                Text("${providerW!.h}:${providerW!.m}:${providerW!.s} "),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  providerW!.assetsAudioPlayer.seekBy(
                    const Duration(seconds: -10),
                  );
                },
                icon: const Icon(Icons.fast_rewind),
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
                    providerW!.assetsAudioPlayer.pause();
                  } else {
                    providerW!.assetsAudioPlayer.play();
                  }
                  providerR!.playPause();
                },
                icon: providerW!.isPlaying
                    ? const Icon(
                        Icons.pause_circle_outline,
                        color: Colors.blueAccent,
                        size: 40,
                      )
                    : const Icon(
                        Icons.play_circle_outline,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
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
                onPressed: () {
                  providerW!.assetsAudioPlayer.seekBy(
                    const Duration(seconds: 10),
                  );
                },
                icon: const Icon(Icons.fast_forward_sharp),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.favorite),
              Icon(Icons.download),
              Icon(Icons.share),
              Icon(Icons.playlist_add),
            ],
          )
        ],
      ),
    );
  }
}
