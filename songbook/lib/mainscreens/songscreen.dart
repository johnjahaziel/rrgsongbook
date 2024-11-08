import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:songbook/sources/utility.dart';

class Songscreen extends StatefulWidget {
  static String id = 'Songscreen';
  final String songTitle;
  final String songSubtitle;
  final String albumName;
  final List<String> lyrics;

  const Songscreen({
    super.key,
    required this.songTitle,
    required this.albumName,
    required this.lyrics,
    required this.songSubtitle,
  });

  @override
  State<Songscreen> createState() => _SongscreenState();
}

class _SongscreenState extends State<Songscreen> {
  bool isBookmarked = false;
  Set<dynamic> bookmarkedSongs = {};
  double _fontSize = 16.0;

  @override
  void initState() {
    super.initState();
    loadFontSize();
  }

  Future<void> loadFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _fontSize = prefs.getDouble('fontSize') ?? 16.0;
    });
  }

  String formatTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length > 2) {
      return '${words.take(2).join(' ')}...';
    }
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                const SizedBox(
                  height: 200,
                  child: Image(
                    image: AssetImage('images/Ellipse2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return gradient.createShader(bounds);
                        },
                        child: Text(
                          formatTitle(widget.songTitle),
                          style: const TextStyle(
                            fontFamily: 'BalsamiqSans',
                            fontSize: 28,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          height: 40,
                          width: 40,
                          child: const Icon(
                            Icons.arrow_back_rounded,
                            size: 25,
                            weight: 2,
                            color: kblack,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 128, left: 125),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kyellow,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 2),
                          color: Colors.grey,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    height: 38,
                    width: 160,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Center(
                        child: Text(
                          'Album: ${widget.albumName}',
                          style: const TextStyle(
                            fontFamily: 'BalsamiqSans',
                            fontSize: 18,
                            color: kblack,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                widget.lyrics.join("\n"),
                style: TextStyle(
                  fontFamily: 'BalsamiqSans',
                  fontSize: _fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
