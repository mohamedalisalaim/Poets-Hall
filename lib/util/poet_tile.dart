import 'package:flutter/material.dart';

class PoetTile extends StatelessWidget {
  final String name;

  PoetTile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(name));
  }
}
