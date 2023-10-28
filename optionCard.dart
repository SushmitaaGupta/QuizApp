import 'package:flutter/material.dart';
import 'package:myquiz/constants.dart';

class OptionCard extends StatelessWidget {
   OptionCard({super.key, required this.option, required this.color});

  String option;
  // bool isClicked;
  Color color;



  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(option,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 22.0, color: Colors.white),
        ),
      ),
    );
  }
}
