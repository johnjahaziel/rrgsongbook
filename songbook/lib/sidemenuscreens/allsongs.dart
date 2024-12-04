import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:songbook/mainscreens/songscreen.dart';
import 'package:songbook/sources/songcard.dart';
import 'package:songbook/sources/utility.dart';

class Allsongs extends StatefulWidget {
  static String id = 'Allsongs';
  const Allsongs({super.key});

  @override
  State<Allsongs> createState() => _AllsongsState();
}

class _AllsongsState extends State<Allsongs> {
  List<dynamic> songs = [];

  @override
  void initState() {
    super.initState();
    fetchSongs();
  }

  Future<void> fetchSongs() async {
    const String apiUrl = "https://app.reegangomez.com/api/songs";
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        setState(() {
          songs = json.decode(response.body);
          // Sort songs alphabetically by "name"
          songs.sort((a, b) {
            final nameA = (a['name'] ?? '').toLowerCase();
            final nameB = (b['name'] ?? '').toLowerCase();
            return nameA.compareTo(nameB);
          });
        });
      } else {
        Fluttertoast.showToast(msg: 'Failed to Load Songs');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error Fetching Songs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (Rect bounds) {
            return gradient.createShader(bounds);
          },
          child: const Text(
            'All Songs',
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
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 2),
              child: Text('SONGS', style: ktext2),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 2, right: 2),
              child: Divider(
                height: 5,
                thickness: 2,
                color: Color.fromARGB(255, 56, 56, 56),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: songs.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: songs.length,
                      itemBuilder: (context, index) {
                        final song = songs[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Songscreen(
                                  songSubtitle: song['name'] ?? 'Unknown',
                                  songTitle: song['english'] ?? 'Unknown Song',
                                  albumName: song['album'] ?? 'Unknown',
                                  lyrics: List<String>.from(song['lyrics'] ?? []),
                                ),
                              ),
                            );
                          },
                          child: SongCard(
                            songTitle: song['english'] ?? 'Untitled',
                            songSubtitle: song['name'] ?? 'Unknown',
                            isBookmarked: false,
                            onBookmarkToggle: null,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
