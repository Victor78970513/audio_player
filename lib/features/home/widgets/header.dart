import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            SizedBox(width: 20),
            Text(
              "Music",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            Text(
              "237",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 10),
            Text(
              "Online",
              style: TextStyle(
                color: Color(0xff8F4D90),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff8F4D90),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 75,
            width: double.infinity,
            child: const Center(
                child: Text(
              "Back to Plinko",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            )),
          ),
        ),
      ],
    );
  }
}
