import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:songbook/mainscreens/NavBar.dart';
import 'package:songbook/mainscreens/songscreen.dart';
import 'package:songbook/sources/songcard.dart';
import 'package:songbook/sources/utility.dart';

class Onboardingscreen extends StatefulWidget {
  static String id = 'OnboardingScreen';
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  List<dynamic> songs = [];
  List<dynamic> filteredSongs = [];
  Set<dynamic> bookmarkedSongs = {};
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchSongsFromApi();
    loadBookmarks();
  }

  Future<void> fetchSongsFromApi() async {
    const String apiUrl = "https://app.reegangomez.com/api/songs";
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        setState(() {
          songs = json.decode(response.body);
          filteredSongs = songs;
        });
      } else {
        Fluttertoast.showToast(msg: 'Failed to Load Songs');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error Fetching Songs');
    }
  }

  Future<void> loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarkList = prefs.getStringList('bookmarkedSongs') ?? [];
    setState(() {
      bookmarkedSongs = bookmarkList.map((song) => json.decode(song)).toSet();
    });
  }

  void toggleBookmark(dynamic song) async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      if (bookmarkedSongs.any((s) => s['id'] == song['id'])) {
        bookmarkedSongs.removeWhere((s) => s['id'] == song['id']);
      } else {
        bookmarkedSongs.add(song);
      }
    });

    prefs.setStringList(
      'bookmarkedSongs',
      bookmarkedSongs.map((song) => json.encode(song)).toList(),
    );
  }

  void filterSongs(String query) {
    setState(() {
      filteredSongs = songs.where((song) {
        final name = song['name']?.toLowerCase() ?? '';
        final english = song['english']?.toLowerCase() ?? '';
        return name.contains(query.toLowerCase()) || english.contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const NavBar(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: kyellow, size: 30),
          backgroundColor: kblack,
          toolbarHeight: 60,
          title: ShaderMask(
            shaderCallback: (Rect bounds) {
              return gradient.createShader(bounds);
            },
            child: const Text(
              'LYRICS',
              style: TextStyle(
                fontFamily: 'BalsamiqSans',
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: searchController,
                  decoration: textFieldDecor(
                    'Search',
                    const Icon(
                      Icons.search_rounded,
                      size: 45,
                      color: kyellow,
                      shadows: [
                        Shadow(
                          color: Colors.grey,
                          offset: Offset(0, 1),
                          blurRadius: 2,
                        )
                      ],
                    ),
                  ),
                  onChanged: (value) {
                    filterSongs(value);
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text('SONGS', style: ktext2),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12, right: 12),
                child: Divider(
                  height: 5,
                  thickness: 2,
                  color: Color.fromARGB(255, 56, 56, 56),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: filteredSongs.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: filteredSongs.length,
                        itemBuilder: (context, index) {
                          final song = filteredSongs[index];
                          final isBookmarked = bookmarkedSongs.any((s) => s['id'] == song['id']);
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
                              isBookmarked: isBookmarked,
                              onBookmarkToggle: () => toggleBookmark(song),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
