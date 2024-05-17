import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/music_provider.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  MusicProvider? providerR;
  MusicProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<MusicProvider>();
    providerW = context.watch<MusicProvider>();
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (context, index, realIndex) {
              return Image.asset(
                providerW!.l1[index],
                fit: BoxFit.fill,
              );
            },
            options: CarouselOptions(
              height: 200,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayCurve: Curves.linear,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: providerW!.songList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    providerR!.changeIndex();
                    Navigator.pushNamed(context, 'MusicPlayer',
                        arguments: index);
                  },
                  leading: Image.network(providerW!.songList[index].image!),
                  title: Text(providerW!.songList[index].name!),
                  contentPadding: const EdgeInsets.all(5),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
