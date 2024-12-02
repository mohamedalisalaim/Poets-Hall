import 'package:flutter/material.dart';
import 'package:poets_hall/pages/intro_page.dart';

void main() {
  runApp(const PoetsHall());
}

class PoetsHall extends StatelessWidget {
  const PoetsHall({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}
