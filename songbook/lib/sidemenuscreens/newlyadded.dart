import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:songbook/mainscreens/songscreen.dart';
import 'package:songbook/sources/songcard.dart';
import 'package:songbook/sources/utility.dart';

class Newlyadded extends StatefulWidget {
  static String id = "Newlyadded";
  const Newlyadded({super.key});

  @override
  State<Newlyadded> createState() => _NewlyaddedState();
}

class _NewlyaddedState extends State<Newlyadded> {
  List<dynamic> songs = [];
  List<dynamic> newlyAddedSongs = [];
  DateTime today = DateTime.now();

  @override
  void initState() {
    super.initState();
    fetchsongs();
  }

  Future<void> fetchsongs() async {
    const String apiUrl = "https://app.reegangomez.com/api/songs";
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> fetchedSongs = json.decode(response.body);
        setState(() {
          songs = fetchedSongs;
          newlyAddedSongs = songs.where((song) {
            final String? updatedAtStr = song['updated_at'];
            if (updatedAtStr != null) {
              final DateTime updatedAt = DateTime.parse(updatedAtStr);
              final Duration difference = today.difference(updatedAt);
              return difference.inDays <= 30;
            }
            return false;
          }).toList();
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
            'New Songs',
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
              child: newlyAddedSongs.isEmpty
                  ? const Center(child: Text('No new songs',style: ktext8,))
                  : ListView.builder(
                      itemCount: newlyAddedSongs.length,
                      itemBuilder: (context, index) {
                        final song = newlyAddedSongs[index];
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
                                  scale: song['scale'] ?? 'Unknown',
                                  beat: song['beat'] ?? 'Unknown',
                                  tempo: song['tempo'] ?? 'Unknown',
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
