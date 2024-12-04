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
              const Text('SPECIAL SONGS',style: ktext4,),
              const SizedBox( height: 10,),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                      MaterialPageRoute(
                        builder: (context) => const AlbumDetailsScreen(
                        albumTitle: 'Special Songs',
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/singles.jpg'),
                      fit: BoxFit.cover
                    ),
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 5),
                        color: Colors.grey,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  height: 80,
                ),
              ),
              const SizedBox( height: 30,),
              ...List.generate(7, (rowIndex) {
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
