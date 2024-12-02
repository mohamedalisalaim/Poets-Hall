import 'package:flutter/material.dart';

class PoemTile extends StatelessWidget {
  final String title;
  final String linecount;
  final void Function()? onTap;

  const PoemTile({
    super.key,
    required this.title,
    required this.linecount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Colors.green[400],
        textColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: "Margarine",
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text("lines: $linecount"),
        contentPadding: const EdgeInsets.all(8),
        enableFeedback: true,
        onTap: onTap,
      ),
    );
  }
}
