import 'package:flutter/material.dart';

class HwJan6 extends StatelessWidget {
  const HwJan6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          centerTitle: false,
          title: const Text("Sample app"),
        ),
        body: const Center(
          child: Text("image"),
        ),
        bottomNavigationBar: MyRow(),
      ),
    );
  }
}

class MyRow extends StatelessWidget {
  MyRow({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(),
            SizedBox(
              width: 20,
            ),
            Button(),
            SizedBox(
              width: 20,
            ),
            Button(),
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 60,
      color: Colors.cyan,
      child: const Center(child: Text("  +\nAdd")),
    );
  }
}
