import 'package:flutter/material.dart';

class HWJan16 extends StatefulWidget {
  const HWJan16({super.key});

  @override
  State<HWJan16> createState() => _HWJan16State();
}

class _HWJan16State extends State<HWJan16> {
  bool bordered = false;
  int _selectedBox = 0;

  void selectBox(int selectedBox) {
    print('select $selectedBox');

    setState(() {
      _selectedBox = _selectedBox != selectedBox ? selectedBox : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffF9F9F9),
        appBar: AppBar(
          title: const Text("Sample app"),
        ),
        body: Container(
          color: Color(0xfff9f9f9),
          padding: EdgeInsets.all(20),
          child: Center(
            child: Row(
              children: [
                MyContainer(
                  level: 'Beginner',
                  month: '0-6',
                  bordered: 1 == _selectedBox,
                  // selectBox: selectBox,
                  selectBox: () {
                    selectBox(1);
                  },
                ),
                MyContainer(
                  level: 'Intermediate',
                  month: '6-18',
                  bordered: 2 == _selectedBox,
                  selectBox: () {
                    selectBox(2);
                  },
                ),
                MyContainer(
                  level: 'Advanced',
                  month: '18+',
                  bordered: 3 == _selectedBox,
                  selectBox: () {
                    selectBox(3);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyContainer extends StatefulWidget {
  final String level, month;
  final Function selectBox;
  final bool bordered;

  MyContainer(
      {Key? key,
      required this.level,
      required this.month,
      required this.bordered,
      required this.selectBox})
      : super(key: key);

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.selectBox();
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 150),
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(
              width: 3,
              color:
                  const Color(0xff5EE0B1).withOpacity(widget.bordered ? 1 : 0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.level,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              Text(
                widget.month,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              const Text(
                "months",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
