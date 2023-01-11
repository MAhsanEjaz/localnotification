import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  Function()? onTap;

  HomeScreen({this.onTap});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text(
      "Item 1",
      style: TextStyle(fontSize: 18),
    ),
    1: Text(
      "Item 2",
      style: TextStyle(fontSize: 18),
    ),
    2: Text(
      "Item 3",
      style: TextStyle(fontSize: 18),
    )
  };

  int? vlaue;

  Map<int, Widget> myTap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (widget.onTap),
      ),
      appBar: AppBar(
        title: Text(''),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSlidingSegmentedControl(
                  padding: EdgeInsets.all(0.0),
                  thumbColor: Colors.yellow,
                  groupValue: vlaue,
                  backgroundColor: Colors.black12,
                  children: myTabs,
                  onValueChanged: (int? val) {
                    vlaue = val;
                    setState(() {});
                  }),
              SizedBox(height: 10),
              if (vlaue == 0) Text('Hello how r you'),
              if (vlaue == 1) Text('I am Fine'),
              // Stepper(steps: [
              //   Step(title: Text('data'), content: Card()),
              //   Step(title: Text('data'), content: Card()),
              //   Step(title: Text('data'), content: Card()),
              // ])
            ],
          ),
        ),
      ),
    );
  }
}
