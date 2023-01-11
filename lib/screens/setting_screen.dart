import 'package:flutter/material.dart';
import 'package:notification_prac/theame_provider/theame_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool data = false;

  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, data, _) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Setting'),
          ),
          body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SwitchListTile(
                      title: Text('Dark Theme'),
                      value: data.darkTheme,
                      onChanged: (myData) {
                        data.toggleTheme();
                        setState(() {});
                      }),
                  Row(
                    children: [
                      CustomButton(
                          color: selectIndex == 0 ? true : false,
                          onTap: () {
                            selectIndex = 0;
                            setState(() {});
                          }),
                      CustomButton(
                          color: selectIndex == 1 ? true : false,
                          onTap: () {
                            selectIndex = 1;
                            setState(() {});
                          }),
                      CustomButton(
                          color: selectIndex == 2 ? true : false,
                          onTap: () {
                            selectIndex = 2;
                            setState(() {});
                          }),
                    ],
                  )
                ]),
          ));
    });
  }
}

class CustomButton extends StatefulWidget {
  bool color;
  Function()? onTap;

  CustomButton({required this.color, this.onTap});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (widget.onTap),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: widget.color ? Colors.orange : Colors.black12),
        child: Center(
          child: Text(
            "Whats is This",
            style:
                TextStyle(color: widget.color ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
