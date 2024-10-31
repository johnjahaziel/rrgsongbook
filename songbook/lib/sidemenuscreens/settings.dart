// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:songbook/sources/utility.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  static String id = "Settings";
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  double _fontSize = 16;
  final double _minFontSize = 12;
  final double _maxFontSize = 30;

  @override
  void initState() {
    super.initState();
    _loadFontSize();
  }

  final Uri gmailUri = Uri(
    scheme: 'mailto',
    path: 'reegangomez.r@gmail.com',
    query: 'subject=Contact&body=Hello',
  );

  Future<void> openGmail() async {
    if (await canLaunchUrl(gmailUri)) {
      await launchUrl(gmailUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Could not open Gmail',
            style: ktext1,
          ),
          backgroundColor: kyellow,
        ),
      );
    }
  }

  Future<void> _loadFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _fontSize = prefs.getDouble('fontSize') ?? 16;
    });
  }

  Future<void> _saveFontSize(double fontSize) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('fontSize', fontSize);
  }

  Future<void> _restoreDefaultFontSize() async {
    setState(() {
      _fontSize = 16;
    });
    await _saveFontSize(_fontSize);
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
            'Settings',
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Adjust Font Size',
              style: ktext1
            ),
            const SizedBox(height: 20),
            Slider(
              value: _fontSize,
              min: _minFontSize,
              max: _maxFontSize,
              divisions: (_maxFontSize - _minFontSize).toInt(),
              label: _fontSize.toString(),
              onChanged: (newSize) {
                setState(() {
                  _fontSize = newSize;
                });
                _saveFontSize(newSize);
              },
              activeColor: kyellow,
            ),
            const SizedBox(height: 20),
            Text(
              'Sample Text',
              style: TextStyle(
                fontFamily: 'BalsamiqSans',
                fontSize: _fontSize,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: _restoreDefaultFontSize,
                child: const Text(
                  'Restore Default',
                  style: ktext1,
                )
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 2,
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Contact Us',
              style: ktext1,
            ),
            const SizedBox(height: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: GestureDetector(
                  onTap: openGmail,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 241, 241, 241),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 2),
                          color: Colors.grey,
                          blurRadius: 2
                        )
                      ]
                    ),
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: const DecorationImage(image: AssetImage('images/gmail-logo.png')),
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Expanded(
                            child: Text(
                              'reegangomez.r@gmail.com',
                              style: ktext4,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
