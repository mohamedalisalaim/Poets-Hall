import 'package:flutter/material.dart';
import 'package:poets_hall/pages/home_page.dart';

void main() {
  runApp(PoetsHall());
}

class PoetsHall extends StatelessWidget {
  const PoetsHall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
