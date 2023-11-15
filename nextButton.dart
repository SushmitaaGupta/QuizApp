import 'package:flutter/material.dart';
import 'package:myquiz/constants.dart';

class nextButton extends StatelessWidget {
   nextButton({super.key, required this.nextQuestion});

  final VoidCallback nextQuestion;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextQuestion,
      child: Container(
        decoration: BoxDecoration(
          color: neutral,
          borderRadius: BorderRadius.circular(10)
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        child: Text("Next Questions", textAlign: TextAlign.center,),
      ),
    );
  }
}
