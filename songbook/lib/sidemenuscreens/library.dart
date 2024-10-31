import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:songbook/sources/songcard.dart';
import 'package:songbook/sources/utility.dart';

class Library extends StatefulWidget {
  static String id = 'Library';
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  List<dynamic> bookmarkedSongs = [];

  @override
  void initState() {
    super.initState();
    loadBookmarks();
  }

  Future<void> loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      bookmarkedSongs = prefs.getStringList('bookmarkedSongs')
              ?.map((song) => json.decode(song)).toList() 
          ?? [];
    });
  }

  Future<void> toggleBookmarkFromLibrary(dynamic song) async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      bookmarkedSongs.remove(song);
    });

    await prefs.setStringList(
      'bookmarkedSongs',
      bookmarkedSongs.map((song) => json.encode(song)).toList(),
    );
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
            'Favourites',
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
              child: Text('FAVOURITE SONGS', style: ktext2),
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
              child: bookmarkedSongs.isEmpty
                  ? const Center(child: Text('No Favourite Songs',style: ktext8,))
                  : ListView.builder(
                      itemCount: bookmarkedSongs.length,
                      itemBuilder: (context, index) {
                        final song = bookmarkedSongs[index];
                        return SongCard(
                          songTitle: song['english'] ?? 'Unknown Title', // Accessing title
                          songSubtitle: song['name'] ?? 'Unknown Subtitle', // Accessing subtitle
                          isBookmarked: true,
                          onBookmarkToggle: () => toggleBookmarkFromLibrary(song),
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
