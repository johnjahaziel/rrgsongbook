import 'package:flutter/material.dart';
import 'package:songbook/sources/utility.dart';

class Aboutus extends StatefulWidget {
  static String id = 'Aboutus';
  const Aboutus({super.key});

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (Rect bounds) {
            return gradient.createShader(bounds);
          },
          child: const Text(
            'About Us',
            style: TextStyle(
              fontFamily: 'BalsamiqSans',
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: kblack,
      ),
    );
  }
}