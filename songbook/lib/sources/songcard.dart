import 'package:flutter/material.dart';
import 'package:songbook/sources/utility.dart';

class SongCard extends StatelessWidget {
  final String songTitle;
  final String songSubtitle;
  final bool isBookmarked;
  final VoidCallback? onBookmarkToggle;

  const SongCard({
    super.key,
    required this.songTitle,
    required this.songSubtitle,
    required this.isBookmarked,
    this.onBookmarkToggle,
  });

  String truncateText(String text, int maxWords) {
    final words = text.split(' ');
    if (words.length <= maxWords) return text;
    return '${words.take(maxWords).join(' ')}...';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 5,
            )
          ],
        ),
        child: ListTile(
          title: Text(
            truncateText(songTitle, 3),
            style: ktext5,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Text(
            truncateText(songSubtitle, 3),
            style: ktext6,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          trailing: onBookmarkToggle != null
              ? GestureDetector(
                  onTap: onBookmarkToggle,
                  child: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_add_outlined,
                    size: 35,
                    color: kyellow,
                    shadows: const [
                      Shadow(
                        color: Colors.grey,
                        offset: Offset(0, 2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                )
              : null,
        ),
      ),
    );
  }
}