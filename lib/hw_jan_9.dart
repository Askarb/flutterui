import 'package:flutter/material.dart';

class ClJan9 extends StatelessWidget {
  const ClJan9({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffF9F9F9),
        appBar: AppBar(
          title: const Text("Sample app"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyRow(
                icon: const Icon(Icons.door_back_door),
              ),
              SizedBox(
                height: 10,
              ),
              MyRow(
                icon: const Icon(Icons.door_back_door),
              ),
              SizedBox(
                height: 10,
              ),
              MyRow(
                icon: const Icon(Icons.lock_outline_sharp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyRow extends StatelessWidget {
  final Icon icon;
  MyRow({
    Key? key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 48,
      width: 315,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 45,
            child: icon,
          ),
          const Expanded(
            child: Text(
              "Current Weight",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
          const Text(
            "---kgs",
            textAlign: TextAlign.right,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xff898A8D)),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
