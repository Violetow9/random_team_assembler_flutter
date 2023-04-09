import 'package:flutter/material.dart';

class SettingsMenu extends StatefulWidget {
  const SettingsMenu({Key? key}) : super(key: key);

  @override
  State<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        width: 1000,
        height: 800,
        child: Container(
          color: Colors.blue,
          width: 800,
          height: 400,
          child: Text(
            "Options",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
