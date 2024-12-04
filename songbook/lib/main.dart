import 'package:flutter/material.dart';
import 'package:songbook/mainscreens/onboardingscreen.dart';
import 'package:songbook/mainscreens/songscreen.dart';
import 'package:songbook/sidemenuscreens/aboutus.dart';
import 'package:songbook/sidemenuscreens/albumscreen.dart';
import 'package:songbook/sidemenuscreens/allsongs.dart';
import 'package:songbook/sidemenuscreens/helpscreen.dart';
import 'package:songbook/sidemenuscreens/library.dart';
import 'package:songbook/sidemenuscreens/newlyadded.dart';
import 'package:songbook/sidemenuscreens/privacypolicy.dart';
import 'package:songbook/sidemenuscreens/settings.dart';
import 'package:songbook/sidemenuscreens/termsandconditions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Onboardingscreen(),
        Onboardingscreen.id: (context) => const Onboardingscreen(),
        Songscreen.id: (context) => const Songscreen(songTitle: '', albumName: '', lyrics: [], songSubtitle: '',scale: '',beat: '',tempo: ''),
        Newlyadded.id:(context) => const Newlyadded(),
        Albumscreen.id: (context) => const Albumscreen(),
        Allsongs.id: (context) => const Allsongs(),
        Library.id: (context) => const Library(),
        Settings.id: (context) => const Settings(),
        Helpscreen.id: (context) => const Helpscreen(),
        Termsandconditions.id:(context) => const Termsandconditions(),
        Privacypolicy.id:(context) => const Privacypolicy(),
        Aboutus.id: (context) => const Aboutus()
      },
    );
  }
}