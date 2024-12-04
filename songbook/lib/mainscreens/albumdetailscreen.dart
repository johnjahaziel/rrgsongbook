import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:songbook/mainscreens/songscreen.dart';
import 'package:songbook/sources/songcard.dart';
import 'package:songbook/sources/utility.dart';

class AlbumDetailsScreen extends StatefulWidget {
  final String albumTitle;

  const AlbumDetailsScreen({
    super.key,
    required this.albumTitle,
  });

  @override
  State<AlbumDetailsScreen> createState() => _AlbumDetailsScreenState();
}

class _AlbumDetailsScreenState extends State<AlbumDetailsScreen> {
  List<dynamic> songs = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSongs();
  }

  String getApiAlbumTitle(String userFriendlyTitle) {
    switch (userFriendlyTitle.toLowerCase()) {
      case 'special songs':
        return 'special songs';
      case 'volume - 1':
        return 'volume -1';
      case 'volume - 2':
        return 'volume -2';
      case 'volume - 3':
        return 'volume -3';
      case 'volume - 4':
        return 'volume -4';
      case 'volume - 5':
        return 'volume -5';
      case 'volume - 6':
        return 'volume -6';
      case 'volume - 7':
        return 'volume -7';
      case 'volume - 8':
        return 'volume -8';
      case 'volume - 9':
        return 'volume -9';
      case 'volume - 10':
        return 'volume -10';
      case 'volume - 11':
        return 'volume -11';
      case 'volume - 12':
        return 'volume -12';
      case 'volume - 13':
        return 'volume -13';
      case 'volume - 14':
        return 'volume -14';
      default:
        return '';
    }
  }

  Future<void> fetchSongs() async {
    const String apiUrl = "https://app.reegangomez.com/api/songs";
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> allSongs = json.decode(response.body);
        final currentAlbum = getApiAlbumTitle(widget.albumTitle);
        setState(() {
          songs = allSongs.where((song) {
            final albumName = song['album']?.toLowerCase() ?? '';
            return albumName == currentAlbum;
          }).toList();
          isLoading = false;
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
          child: Text(
            widget.albumTitle,
            style: const TextStyle(
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
              padding: EdgeInsets.only(left: 2, top: 2),
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
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : songs.isEmpty
                      ? const Center(child: Text('No songs found for this album'))
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
