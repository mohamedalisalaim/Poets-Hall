import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:poets_hall/models/poet.dart';
import 'package:poets_hall/util/poet_tile.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Poet> poets = [];

  Future getPoets() async {
    var response = await http.get(Uri.https("poetrydb.org", "author"));
    var jsonData = jsonDecode(response.body);

    for (String eachPoet in jsonData["authors"]) {
      var poet = Poet(name: eachPoet);
      poets.add(poet);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
        future: getPoets(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: poets.length,
              itemBuilder: (context, index) {
                return PoetTile(name: poets[index].name);
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }
}
