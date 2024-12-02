import 'package:flutter/material.dart';
import 'package:poets_hall/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text(
          "Welcome",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Margarine",
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Poet's Hall",
                style: TextStyle(
                  fontFamily: "Margarine",
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "The poet's job is to find a way to say what everyone else has been thinking. \n \n David Whyte",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Margarine",
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: MaterialButton(
                color: Colors.green[400],
                padding: const EdgeInsets.all(24),
                child: const Text(
                  "Let's Begin",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Margarine",
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Made With ❤️ By Mohamed Ali Salaim",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Margarine",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
