import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:songbook/sources/utility.dart';

class Songscreen extends StatefulWidget {
  static String id = 'Songscreen';
  final String songTitle;
  final String songSubtitle;
  final String albumName;
  final List<String> lyrics;
  final String scale;
  final String beat;
  final String tempo;

  const Songscreen({
    super.key,
    required this.songTitle,
    required this.albumName,
    required this.lyrics,
    required this.songSubtitle,
    required this.scale,
    required this.beat,
    required this.tempo,
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
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return gradient.createShader(bounds);
                          },
                          child: Text(
                            formatTitle(widget.songTitle),
                            style: const TextStyle(
                              fontFamily: 'BalsamiqSans',
                              fontSize: 25,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 128),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final textPainter = TextPainter(
                            text: TextSpan(
                              text: 'Album: ${widget.albumName}',
                              style: const TextStyle(
                                fontFamily: 'BalsamiqSans',
                                fontSize: 16,
                                color: kblack,
                              ),
                            ),
                            textDirection: TextDirection.ltr,
                          )..layout();
                          double containerWidth = textPainter.width + 20;

                          return Column(
                            children: [
                              Container(
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
                                width: containerWidth,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: Center(
                                    child: Text(
                                      'Album: ${widget.albumName}',
                                      style: const TextStyle(
                                        fontFamily: 'BalsamiqSans',
                                        fontSize: 16,
                                        color: kblack,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(widget.beat, style: ktext4),
                                    const SizedBox(width: 5),
                                    const Text('|', style: ktext1),
                                    const SizedBox(width: 5),
                                    Text('Tempo: ${widget.tempo}', style: ktext4),
                                    const SizedBox(width: 5),
                                    const Text('|', style: ktext1),
                                    const SizedBox(width: 5),
                                    Text(widget.scale, style: ktext4),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 10),
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
