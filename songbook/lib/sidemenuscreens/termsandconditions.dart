import 'package:flutter/material.dart';
import 'package:songbook/sources/utility.dart';

class Termsandconditions extends StatefulWidget {
  static String id = 'Termsandconditions';
  const Termsandconditions({super.key});

  @override
  State<Termsandconditions> createState() => _TermsandconditionsState();
}

class _TermsandconditionsState extends State<Termsandconditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (Rect bounds) {
            return gradient.createShader(bounds);
          },
          child: const Text(
            'T & C',
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
              'Terms and Conditions',
              style: TextStyle(
                fontFamily: 'BalsamiqSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '1. Acceptance of Terms',
              style: ktext8,
            ),
            SizedBox(height: 5),
            Text(
              'By using this app, you agree to these terms and conditions. If you do not agree to these terms, you may not use the app.',
              style: ktext7,
            ),
            SizedBox(height: 20),
            Text(
              '2. Usage of the App',
              style: ktext8,
            ),
            SizedBox(height: 5),
            Text(
              'You are granted a limited, non-exclusive, and non-transferable license to use this app for personal purposes. Unauthorized distribution, modification, or resale is prohibited.',
              style: ktext7,
            ),
            SizedBox(height: 20),
            Text(
              '3. User Responsibilities',
              style: ktext8,
            ),
            SizedBox(height: 5),
            Text(
              'You are responsible for your use of the app, including any content you upload, share, or interact with. Any misuse of the app may result in termination of your access.',
              style: ktext7,
            ),
            SizedBox(height: 20),
            Text(
              '4. Intellectual Property',
              style: ktext8,
            ),
            SizedBox(height: 5),
            Text(
              'All content in this app, including but not limited to text, graphics, logos, and software, is the property of e-Song Book or its licensors. You may not use this content for any commercial purpose without written permission.',
              style: ktext7,
            ),
            SizedBox(height: 20),
            Text(
              '5. Limitation of Liability',
              style: ktext8,
            ),
            SizedBox(height: 5),
            Text(
              'The app is provided on an "as-is" basis. We are not responsible for any damages arising from the use or inability to use the app.',
              style: ktext7,
            ),
            SizedBox(height: 20),
            Text(
              '6. Privacy Policy',
              style: ktext8,
            ),
            SizedBox(height: 5),
            Text(
              'We respect your privacy. Any data you provide or share with the app will be handled according to our Privacy Policy, which is available within the app.',
              style: ktext7,
            ),
            SizedBox(height: 20),
            Text(
              '7. Changes to Terms',
              style: ktext8,
            ),
            SizedBox(height: 5),
            Text(
              'We reserve the right to modify these terms at any time. Continued use of the app after any changes will constitute your acceptance of the new terms.',
              style: ktext7,
            ),
          ],
        ),
      ),
    );
  }
}
