import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("First screen"),
        ),
        body: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(
              child: MyRow(
                color: Colors.grey,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            Expanded(
              child: MyRow(
                color: Colors.black12,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            Expanded(
              child: MyRow(
                color: Colors.blue,
                mainAxisAlignment: MainAxisAlignment.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyRow extends StatelessWidget {
  final Color color;
  final MainAxisAlignment mainAxisAlignment;
  const MyRow({
    super.key,
    required this.color,
    required this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.red,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  const Text("1"),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.yellow,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text("2"),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.green,
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                children: [
                  const Text("2"),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
