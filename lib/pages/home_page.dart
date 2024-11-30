import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:poets_hall/models/poet.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Poet> poets = [];

  Future getPoets() async {
    var response = await http.get(Uri.https("poetrydb.org", "author"));
    var jsonData = jsonDecode(response.body);

    for (var eachPoet in jsonData["authors"]) {
      final poet = Poet(name: eachPoet);
      poets.add(poet);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getPoets(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: poets.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(poets[index].name),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
