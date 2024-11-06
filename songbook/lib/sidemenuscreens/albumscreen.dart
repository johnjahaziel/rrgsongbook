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
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth * 0.1;
    double spacing = screenWidth * 0.08;

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
          padding: EdgeInsets.only(top: 20, left: padding, right: padding),
          child: Column(
            children: [
              ...List.generate(6, (rowIndex) {
                int startIndex = rowIndex * 2 + 1;
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: AlbumWidget(
                            title: 'Volume - $startIndex',
                            imagePath: 'images/vol$startIndex.jpg',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AlbumDetailsScreen(
                                    albumTitle: 'Volume - $startIndex',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: spacing),
                        Expanded(
                          child: AlbumWidget(
                            title: 'Volume - ${startIndex + 1}',
                            imagePath: 'images/vol${startIndex + 1}.jpg',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AlbumDetailsScreen(
                                    albumTitle: 'Volume - ${startIndex + 1}',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: spacing),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
