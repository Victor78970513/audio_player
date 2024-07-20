import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';

class MusicVisualizer extends StatelessWidget {
  final PlayerController controller;
  final PlayerWaveStyle playerWaveStyle;

  const MusicVisualizer(
      {super.key, required this.controller, required this.playerWaveStyle});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff322B32),
            borderRadius: BorderRadius.circular(15),
          ),
          // height: MediaQuery.sizeOf(context).height * 0.3,
          // width: double.infinity,
          child: AudioFileWaveforms(
            playerController: controller,
            size: Size(
              MediaQuery.sizeOf(context).width,
              MediaQuery.sizeOf(context).height * 0.3,
            ),
            waveformType: WaveformType.long,
            playerWaveStyle: playerWaveStyle,
          )),
    );
  }
}
