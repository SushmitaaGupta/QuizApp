import 'package:flutter/material.dart';
import 'package:myquiz/constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({super.key, required this.Result, required this.totalQuestions, required this.onpressed});

  final int Result;
  final int totalQuestions;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(padding: EdgeInsets.all(60.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Result", style: TextStyle(color: Colors.white, fontSize: 22.0),),
          SizedBox(height: 20,),
          CircleAvatar(
            backgroundColor: Result==totalQuestions? correct: Result < totalQuestions/2? notCorrect: Result == totalQuestions/2? Colors.yellow: Colors.blue,
            radius: 60,
            child: Text('$Result/$totalQuestions', style: TextStyle(color: Colors.black, fontSize: 30),),),
          SizedBox(height: 20,),
          Text(Result == totalQuestions/2? 'Almost there':  Result < totalQuestions/2? 'Try again':'Great!', style: TextStyle(color: Colors.white),),
          SizedBox(height: 25,),
          GestureDetector(
            onTap: onpressed,
            child: Text("Start Over", style: TextStyle(color: Colors.amber, fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 1.0),),
          )
        ],
      ),
      ),
    );
  }
}
