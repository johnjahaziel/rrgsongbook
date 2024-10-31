import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:songbook/sources/utility.dart';

class Helpscreen extends StatefulWidget {
  static String id = "Helpscreen";
  const Helpscreen({super.key});

  @override
  State<Helpscreen> createState() => _HelpscreenState();
}

class _HelpscreenState extends State<Helpscreen> {
  String appVersion = "";

  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }

  Future<void> _getAppVersion() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      setState(() {
        appVersion = packageInfo.version;
      });
    } catch (e) {
      setState(() {
        appVersion = "Unknown version";
      });
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
            'Help',
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
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Welcome to e-Song Book!',
              style: TextStyle(
                fontFamily: 'BalsamiqSans',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'e-Song Book is your personal digital songbook where you can explore a vast collection of songs, bookmark your favorites, and stay updated with the latest additions.',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'BalsamiqSans',
                color: Color.fromARGB(255, 105, 105, 105)
              ),
            ),
            const SizedBox(height: 10),
            const Divider(
              height: 2,
              color: Colors.black,
            ),
            const SizedBox(height: 20),
            const Text(
              'Frequently Asked Questions (FAQs)',
              style: TextStyle(
                fontFamily: 'BalsamiqSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildFaqItem(
              question: "How can I bookmark a song?",
              answer: "You can bookmark a song by clicking the 'Bookmark' icon next to the song title.",
            ),
            _buildFaqItem(
              question: "Where can I find my bookmarked songs?",
              answer: "You can access all your bookmarked songs under the 'Library' section from the side menu.",
            ),
            _buildFaqItem(
              question: "How do I find newly added songs?",
              answer: "Newly added songs can be found under the 'Newly Added' section in the side menu.",
            ),
            _buildFaqItem(
              question: "Can I share a song with friends?",
              answer: "Yes! You can share any song by clicking the 'Share' icon in the song's options.",
            ),
            _buildFaqItem(
              question: "How do I contact support?",
              answer: "You can contact support through the 'Settings' screen, where you’ll find a 'Contact Us' option.",
            ),
            const SizedBox(height: 10),
            const Divider(
              height: 2,
              color: Colors.black,
            ),
            const SizedBox(height: 20),
            const Text(
              'App Version',
              style: TextStyle(
                fontFamily: 'BalsamiqSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Version: $appVersion',
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'BalsamiqSans',
                color: Color.fromARGB(255, 105, 105, 105)
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqItem({required String question, required String answer}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontFamily: 'BalsamiqSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            answer,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'BalsamiqSans',
              color: Color.fromARGB(255, 105, 105, 105)
            ),
          ),
        ],
      ),
    );
  }
}
