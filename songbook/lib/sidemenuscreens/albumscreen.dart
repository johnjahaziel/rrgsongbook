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
      body: SingleChildScrollView(
        child: Padding(
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
                    imagePath: 'images/vol2.jpg',
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
                    imagePath: 'images/vol2.jpg',
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
                    imagePath: 'images/vol3.jpg',
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
                    imagePath: 'images/vol4.jpg',
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
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AlbumWidget(
                    title: 'Volume - 5',
                    imagePath: 'images/vol5.jpg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AlbumDetailsScreen(
                            albumTitle: 'Volume - 5',
                          ),
                        ),
                      );
                    },
                  ),
                  AlbumWidget(
                    title: 'Volume - 6',
                    imagePath: 'images/vol6.jpg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AlbumDetailsScreen(
                            albumTitle: 'Volume - 6',
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
                    title: 'Volume - 7',
                    imagePath: 'images/vol7.jpg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AlbumDetailsScreen(
                            albumTitle: 'Volume - 7',
                          ),
                        ),
                      );
                    },
                  ),
                  AlbumWidget(
                    title: 'Volume - 8',
                    imagePath: 'images/vol8.jpg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AlbumDetailsScreen(
                            albumTitle: 'Volume - 8',
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
                    title: 'Volume - 9',
                    imagePath: 'images/vol9.jpg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AlbumDetailsScreen(
                            albumTitle: 'Volume - 9',
                          ),
                        ),
                      );
                    },
                  ),
                  AlbumWidget(
                    title: 'Volume - 10',
                    imagePath: 'images/vol10.jpg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AlbumDetailsScreen(
                            albumTitle: 'Volume - 10',
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
                    title: 'Volume - 11',
                    imagePath: 'images/vol11.jpg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AlbumDetailsScreen(
                            albumTitle: 'Volume - 11',
                          ),
                        ),
                      );
                    },
                  ),
                  AlbumWidget(
                    title: 'Volume - 12',
                    imagePath: 'images/vol12.jpg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AlbumDetailsScreen(
                            albumTitle: 'Volume - 12',
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
      ),
    );
  }
}
