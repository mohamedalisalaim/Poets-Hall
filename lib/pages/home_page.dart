import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:poets_hall/models/poet.dart';
import 'package:http/http.dart' as http;
import 'package:poets_hall/pages/poet_page.dart';
import 'package:poets_hall/util/poet_tile.dart';

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
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text(
          "Poets",
          style: TextStyle(
            fontFamily: "Margarine",
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
        future: getPoets(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: poets.length,
                itemBuilder: (context, index) {
                  return PoetTile(
                    name: "${index + 1} - ${poets[index].name}",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PoetPage(poetName: poets[index].name),
                          ));
                    },
                  );
                },
              ),
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
