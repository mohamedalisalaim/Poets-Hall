import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poets_hall/models/poem.dart';
import 'package:poets_hall/pages/poem_page.dart';
import 'package:poets_hall/util/poem_tile.dart';

class PoetPage extends StatelessWidget {
  final String poetName;

  PoetPage({super.key, required this.poetName});

  List<Poem> poems = [];

  Future getPoems() async {
    var r = await http.get(Uri.https("poetrydb.org", "author/$poetName"));
    var jsonData = jsonDecode(r.body);

    for (int i = 0; i < jsonData.length; i++) {
      final poem = Poem(
        title: jsonData[i]["title"],
        linecount: jsonData[i]["linecount"],
        lines: List.from(jsonData[i]["lines"]),
      );
      poems.add(poem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Text(
          poetName,
          style: const TextStyle(
            fontFamily: "Margarine",
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getPoems(),
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: poems.length,
              itemBuilder: (context, index) {
                return PoemTile(
                  title: poems[index].title,
                  linecount: poems[index].linecount,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PoemPage(
                            poemTitle: poems[index].title,
                            lines: List.from(poems[index].lines),
                          ),
                        ));
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
