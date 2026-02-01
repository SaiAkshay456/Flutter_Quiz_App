import "package:flutter/material.dart";

class TextWidgetForCompo extends StatelessWidget {
  const TextWidgetForCompo({super.key});
  @override
  Widget build(BuildContext context) {
    return const Text("Hello from TextWidgetForCompo");
  }
}

//reusable class widget for buttons
class OtherWidget extends StatefulWidget {
  const OtherWidget({super.key});
  @override
  State<OtherWidget> createState() {
    return _OtherWidgetHere();
  }
}

class _OtherWidgetHere extends State<OtherWidget> {
  var imagePath = "assets/virat_bhuvi.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath, width: 250, height: 250),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  imagePath = "assets/odi_match.png";
                });
              },
              child: Text("Click Odi"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  imagePath = "assets/test_match.png";
                });
              },
              child: Text("Click Test"),
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  imagePath = "assets/virat_bhuvi.png";
                });
              },
              child: Text("Click Bhuvi and Virat"),
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  imagePath = "assets/ipl.png";
                });
              },
              child: Text("Click IPL"),
            ),
          ],
        ),
      ),
    );
  }
}
