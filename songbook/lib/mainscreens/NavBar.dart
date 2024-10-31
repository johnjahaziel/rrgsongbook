// Import the share_plus package

// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:songbook/sidemenuscreens/aboutus.dart';
import 'package:songbook/sidemenuscreens/albumscreen.dart';
import 'package:songbook/sidemenuscreens/allsongs.dart';
import 'package:songbook/sidemenuscreens/helpscreen.dart';
import 'package:songbook/sidemenuscreens/library.dart';
import 'package:songbook/sidemenuscreens/newlyadded.dart';
import 'package:songbook/sidemenuscreens/privacypolicy.dart';
import 'package:songbook/sidemenuscreens/settings.dart';
import 'package:songbook/sidemenuscreens/termsandconditions.dart';
import 'package:songbook/sources/utility.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    const SizedBox(
                      height: 130,
                      child: DrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('images/RRG.png'),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return gradient1.createShader(bounds);
                                },
                                child: const Text(
                                  'Reegan Gomez',
                                  style: TextStyle(
                                    fontFamily: 'BalsamiqSans',
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return gradient1.createShader(bounds);
                                },
                                child: const Text(
                                  'e-Song Book',
                                  style: TextStyle(
                                    fontFamily: 'BalsamiqSans',
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15),
                  child: Column(
                    children: [
                      _buildDrawerItem(
                        context: context,
                        icon: Icons.list_alt,
                        text: 'All Songs',
                        routeName: Allsongs.id,
                      ),
                      const SizedBox(height: 30),
                      _buildDrawerItem(
                        context: context,
                        icon: Icons.bookmark_add,
                        text: 'Library',
                        routeName: Library.id,
                      ),
                      const SizedBox(height: 30),
                      _buildDrawerItem(
                        context: context,
                        icon: Icons.new_releases,
                        text: 'Newly Added',
                        routeName: Newlyadded.id,
                      ),
                      const SizedBox(height: 30),
                      _buildDrawerItem(
                        context: context,
                        icon: Icons.album_rounded,
                        text: 'Albums',
                        routeName: Albumscreen.id,
                      ),
                      const SizedBox(height: 30),
                      _buildDrawerItem(
                        context: context,
                        icon: Icons.settings,
                        text: 'Settings',
                        routeName: Settings.id,
                      ),
                      const SizedBox(height: 30),
                      _buildDrawerItem(
                        context: context,
                        icon: Icons.info,
                        text: 'About Us',
                        routeName: Aboutus.id,
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () => openYouTube(context),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.play_arrow,
                              size: 35,
                              shadows: [
                                Shadow(
                                  color: Colors.grey,
                                  offset: Offset(0, 1),
                                  blurRadius: 2,
                                ),
                              ],
                              color: kyellow,
                            ),
                            SizedBox(width: 14),
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text('Youtube', style: ktext4),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () => shareApp(context),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.share,
                              size: 35,
                              shadows: [
                                Shadow(color: Colors.grey, offset: Offset(0, 1), blurRadius: 2),
                              ],
                              color: kyellow,
                            ),
                            SizedBox(width: 14),
                            Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text('Share', style: ktext4),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      _buildDrawerItem(
                        context: context,
                        icon: Icons.help_center,
                        text: 'Help',
                        routeName: Helpscreen.id,
                      ),
                      const SizedBox(height: 30),
                      _buildDrawerItem(
                        context: context,
                        icon: Icons.app_settings_alt,
                        text: 'Terms and Conditions',
                        routeName: Termsandconditions.id,
                      ),
                      const SizedBox(height: 30),
                      _buildDrawerItem(
                        context: context,
                        icon: Icons.privacy_tip,
                        text: 'Privacy Policy',
                        routeName: Privacypolicy.id,
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String text,
    String? routeName,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName!);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 35,
            shadows: const [
              Shadow(color: Colors.grey, offset: Offset(0, 1), blurRadius: 2),
            ],
            color: kyellow,
          ),
          const SizedBox(width: 14),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(text, style: ktext4),
          ),
        ],
      ),
    );
  }

  void openYouTube(BuildContext context) async {
    final Uri youtubeUri = Uri.parse('https://www.youtube.com/@reegangomezr');
    
    if (!await launchUrl(youtubeUri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Could not open YouTube',
            style: ktext1,
          ),
          backgroundColor: kyellow,
        ),
      );
    }
  }

  void shareApp(BuildContext context) {
    const String appLink = 'https://play.google.com/store/apps/details?id=com.devsparkles.lyrics&pcampaignid=web_share';
    Share.share('Check out this awesome app: $appLink');
  }
}
