import 'package:flutter/material.dart';
import 'package:songbook/sources/utility.dart';

class Privacypolicy extends StatefulWidget {
  static String id = 'PrivacyPolicy';
  const Privacypolicy({super.key});

  @override
  State<Privacypolicy> createState() => _PrivacypolicyState();
}

class _PrivacypolicyState extends State<Privacypolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (Rect bounds) {
            return gradient.createShader(bounds);
          },
          child: const Text(
            'Privacy Policy',
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
          children: const [
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontFamily: 'BalsamiqSans',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '1. Information Collection',
              style: ktext8,
            ),
            SizedBox(height: 5),
            Text(
              'We collect personal information such as your name, email address, and usage data to improve our services and provide a personalized experience. We may also collect non-personal information, including device details and usage statistics.',
              style: ktext7,
            ),
            SizedBox(height: 20),
            Text(
              '2. Use of Information',
              style: ktext8,
            ),
            SizedBox(height: 5),
            Text(
              'The information collected is used to improve the functionality of the app, enhance user experience, and communicate with users regarding updates, new features, and other relevant content.',
              style: ktext7,
            ),
            SizedBox(height: 20),
            Text(
              '3. Sharing of Information',
              style: ktext8,
            ),
            SizedBox(height: 5),
            Text(
              'We do not share your personal information with third parties unless it is necessary for the functioning of the app or required by law. Any data shared with service providers is done securely and only for specific purposes.',
              style: ktext7,
            ),
            SizedBox(height: 20),
            Text(
              '4. Security',
              style: ktext8,
            ),
            SizedBox(height: 5),
            Text(
              'We take the security of your data seriously and implement appropriate technical and organizational measures to protect your personal information. However, no method of transmission over the Internet is completely secure, and we cannot guarantee its absolute security.',
              style: ktext7,
            ),
            SizedBox(height: 20),
            Text(
              '5. Your Rights',
              style: ktext8,
            ),
            SizedBox(height: 5),
            Text(
              'You have the right to access, update, or delete your personal information at any time. If you wish to exercise these rights, please contact us through the app\'s support channels.',
              style: ktext7,
            ),
            SizedBox(height: 20),
            Text(
              '6. Changes to the Policy',
              style: ktext8,
            ),
            SizedBox(height: 5),
            Text(
              'We reserve the right to update this Privacy Policy at any time. Users will be notified of significant changes via email or through the app. Continued use of the app after any changes signifies your acceptance of the new terms.',
              style: ktext7,
            ),
          ],
        ),
      ),
    );
  }
}
