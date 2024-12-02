import 'package:flutter/material.dart';

class PoemPage extends StatelessWidget {
  final List<String> lines;
  final String poemTitle;

  const PoemPage({
    super.key,
    required this.lines,
    required this.poemTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Text(
          poemTitle,
          style: const TextStyle(
            fontFamily: "Margarine",
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: lines.length,
          itemBuilder: (context, index) {
            return Text(
              (lines[index] == "") ? "" : "${index + 1} - ${lines[index]}",
              style: const TextStyle(
                height: 1.5,
                fontFamily: "Margarine",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
    );
  }
}
