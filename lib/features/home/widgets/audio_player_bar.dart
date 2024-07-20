import 'package:flutter/material.dart';

class AudioPlayerBar extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  const AudioPlayerBar({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 100,
            width: MediaQuery.sizeOf(context).width * 0.25,
            decoration: const BoxDecoration(
              color: Color(0xff332C33),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: const Icon(
              Icons.keyboard_double_arrow_left_outlined,
              color: Colors.white,
              size: 50,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 100,
              width: MediaQuery.sizeOf(context).width * 0.35,
              decoration: BoxDecoration(
                color: Color(0xffFF89D2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(child: child),
            ),
          ),
          Container(
            height: 100,
            width: MediaQuery.sizeOf(context).width * 0.25,
            decoration: const BoxDecoration(
              color: Color(0xff332C33),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: const Icon(
              Icons.keyboard_double_arrow_right_outlined,
              color: Colors.white,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
