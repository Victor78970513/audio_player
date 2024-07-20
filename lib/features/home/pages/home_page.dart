import 'dart:async';
import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plinko/features/home/widgets/audio_player_bar.dart';
import 'package:plinko/features/home/widgets/header.dart';
import 'package:plinko/features/home/widgets/music_visualizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late File file;
  late PlayerController controller;
  late StreamSubscription<PlayerState> playerStateSubscription;

  final playerWaveStyle = const PlayerWaveStyle(
    fixedWaveColor: Color(0xff653F58),
    liveWaveColor: Color(0xffC98AB3),
    spacing: 6,
  );

  double _volume = 2;

  void _preparePlayer() async {
    final tempDir = Directory.systemTemp;
    final filePath = '${tempDir.path}/audio.mp3';
    file = File(filePath);
    await file.writeAsBytes(
        (await rootBundle.load("assets/audio/audio.mp3")).buffer.asUint8List());
    controller.preparePlayer(
      path: file.path,
      shouldExtractWaveform: true,
    );

    controller
        .extractWaveformData(
          path: file.path,
          noOfSamples: playerWaveStyle
              .getSamplesForWidth(MediaQuery.sizeOf(context).width),
        )
        .then((wavefromData) => debugPrint(wavefromData.toString()));
  }

  @override
  void initState() {
    super.initState();
    controller = PlayerController();
    _preparePlayer();
    playerStateSubscription = controller.onPlayerStateChanged.listen((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    playerStateSubscription.cancel();
    controller.dispose();
  }

  void _updateVolume(double volume) {
    setState(() {
      _volume = volume;
      controller.setVolume(_volume);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff262026),
      body: SafeArea(
        child: Column(
          children: [
            const Header(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Jubilant Day (Upbeat Lo-fi Hip Hop Mix)",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Seth Pantalony",
                  style: TextStyle(
                      color: Color.fromARGB(255, 167, 96, 169), fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            MusicVisualizer(
              controller: controller,
              playerWaveStyle: playerWaveStyle,
            ),
            AudioPlayerBar(
              onTap: () {
                if (controller.playerState.isPlaying) {
                  controller.pausePlayer();
                } else {
                  controller.startPlayer(finishMode: FinishMode.stop);
                }
              },
              child: controller.playerState.isPlaying
                  ? const Icon(
                      Icons.pause,
                      size: 50,
                    )
                  : const Icon(
                      Icons.play_arrow_sharp,
                      size: 50,
                    ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(
                  Icons.volume_mute,
                  color: Color(0xffC98AB3),
                  size: 35,
                ),
                Expanded(
                  child: Slider(
                    min: 0,
                    max: 5,
                    value: _volume,
                    onChanged: _updateVolume,
                    activeColor: const Color(0xffC98AB3),
                    inactiveColor: Colors.grey,
                  ),
                ),
                const Icon(
                  Icons.volume_down_alt,
                  color: Color(0xffC98AB3),
                  size: 35,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
