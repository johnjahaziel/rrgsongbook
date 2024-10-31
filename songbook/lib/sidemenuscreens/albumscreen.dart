import 'package:flutter/material.dart';
import 'package:songbook/mainscreens/albumdetailscreen.dart';
import 'package:songbook/sources/albumwidget.dart';
import 'package:songbook/sources/utility.dart';

class Albumscreen extends StatefulWidget {
  static String id = "Albumscreen";
  const Albumscreen({super.key});

  @override
  State<Albumscreen> createState() => _AlbumscreenState();
}

class _AlbumscreenState extends State<Albumscreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (Rect bounds) {
            return gradient.createShader(bounds);
          },
          child: const Text(
            'Album',
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
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 35, right: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AlbumWidget(
                  title: 'Volume - 1',
                  imagePath: 'images/RRG14.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AlbumDetailsScreen(
                          albumTitle: 'Volume - 1',
                        ),
                      ),
                    );
                  },
                ),
                AlbumWidget(
                  title: 'Volume - 2',
                  imagePath: 'images/RRG14.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AlbumDetailsScreen(
                          albumTitle: 'Volume - 2',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AlbumWidget(
                  title: 'Volume - 3',
                  imagePath: 'images/RRG14.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AlbumDetailsScreen(
                          albumTitle: 'Volume - 3',
                        ),
                      ),
                    );
                  },
                ),
                AlbumWidget(
                  title: 'Volume - 4',
                  imagePath: 'images/RRG14.jpg',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AlbumDetailsScreen(
                          albumTitle: 'Volume - 4',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
