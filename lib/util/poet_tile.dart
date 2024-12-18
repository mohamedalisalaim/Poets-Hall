import 'package:flutter/material.dart';

class PoetTile extends StatelessWidget {
  final String name;
  final void Function()? onTap;

  const PoetTile({
    super.key,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Colors.green[400],
        textColor: Colors.white,
        title: Text(
          name,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontFamily: "Margarine",
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        contentPadding: const EdgeInsets.all(8),
        enableFeedback: true,
        onTap: onTap,
      ),
    );
  }
}
