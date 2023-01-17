import 'package:flutter/material.dart';

class ClJan16 extends StatefulWidget {
  const ClJan16({super.key});

  @override
  State<ClJan16> createState() => _ClJan16State();
}

class _ClJan16State extends State<ClJan16> {
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
                str: 'kgs',
              ),
              SizedBox(
                height: 10,
              ),
              MyRow(
                icon: const Icon(Icons.door_back_door),
                str: 'kgs',
              ),
              SizedBox(
                height: 10,
              ),
              MyRow(
                icon: const Icon(Icons.lock_outline_sharp),
                str: 'cms',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyRow extends StatefulWidget {
  final Icon icon;
  final String str;
  List boxShadow = <BoxShadow>[];
  bool isShowed = true;
  List<BoxShadow> getBoxShadow() {
    return isShowed
        ? [
            const BoxShadow(
              color: Colors.red,
              blurRadius: 4,
              offset: Offset(4, 8), // Shadow position
            )
          ]
        : [];
  }

  MyRow({
    Key? key,
    required this.icon,
    required this.str,
  });

  @override
  State<MyRow> createState() => _MyRowState();
}

class _MyRowState extends State<MyRow> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.isShowed = !widget.isShowed;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: widget.getBoxShadow(),
        ),
        height: 48,
        width: 315,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 45,
              child: widget.icon,
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
            Text(
              "--- ${widget.str}",
              textAlign: TextAlign.right,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xff898A8D)),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
