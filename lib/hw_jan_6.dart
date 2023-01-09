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
          title: const Text("Sample ap2p"),
        ),
        body: const Center(
          child: Text("image"),
        ),
        bottomNavigationBar: MyRow(),

        // body: Row(
        //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     const Expanded(
        //       child: MyRow(
        //         color: Colors.grey,
        //         mainAxisAlignment: MainAxisAlignment.start,
        //       ),
        //     ),
        //     Expanded(
        //       child: MyRow(
        //         color: Colors.black12,
        //         mainAxisAlignment: MainAxisAlignment.center,
        //       ),
        //     ),
        //     Expanded(
        //       child: MyRow(
        //         color: Colors.blue,
        //         mainAxisAlignment: MainAxisAlignment.end,
        //       ),
        //     ),
        //   ],
        // ),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text("+"),
        ],
      ),
    );
  }
}
