import 'package:flutter/material.dart';

class AlbumWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const AlbumWidget({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'BalsamiqSans',
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              color: Colors.amber,
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 5),
                  color: Colors.grey,
                  blurRadius: 3,
                ),
              ],
            ),
            height: 200,
            width: 170,
          ),
        ),
      ],
    );
  }
}
