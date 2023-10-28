import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:myquiz/Widgets/Question_widgets.dart';
import 'package:myquiz/constants.dart';
import 'package:myquiz/nextButton.dart';
import 'package:myquiz/optionCard.dart';
import 'result_box.dart';

import 'modal/question_modal.dart';
class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
   List<Question> _questions=[
    Question(id: '1', title:'What is 2+2? ' , options: {'5':false, '4':true, '10':false, '7':false}),
    Question(id: '2', title:'What is 2*2? ' , options: {'4':true, '5':false, '10':false, '7':false}),
    Question(id: '3', title:'What is 2//2? ' , options: {'5':false, '1':true, '10':false, '7':false}),
    Question(id: '4', title:'What is 2/2? ' , options: {'5':false, '1':false, '10':false, '1.0':true}),
    Question(id: '5', title:'What is 2%2? ' , options: {'5':false, '4':false, '0':true, '7':false}),
  ];

  int index=0;
  // for score..
  int score=0;
  bool isPressed=false;
  bool isAlreadySelected = false;
  void nextQuestion(){
    if(index==_questions.length-1){
      showDialog(
          barrierDismissible: false,
          context: context, builder: (ctx)=>ResultBox(Result: score, totalQuestions: _questions.length, onpressed: StatOver,));
    }
    else{
      if(isPressed){
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected=false;
        });
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please selct any option"), behavior: SnackBarBehavior.floating, margin: EdgeInsets.symmetric(vertical: 20.0),)
        );
      }

    }
  }

  void checkAnswerandUpdate(bool value){
    if(isAlreadySelected){
      return;
    }
    else {
      if (value == true) {
        score++;
        setState(() {
          isPressed = true;
          isAlreadySelected = true;
        });
      }
    }

  }

  void changeColor(){
    if(isAlreadySelected){
      return;
    }
    else {
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }

  }

  void StatOver(){
    setState(() {
      index=0;
      score=0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text("Quiz App"),
        backgroundColor: background,
        shadowColor: Colors.transparent,
        actions: [
          Padding(padding: EdgeInsets.all(10),
          child: Text('score:$score'),)
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            QuestionWidgets(_questions[index].title, index, _questions.length),
            const Divider(color: neutral,),
            const SizedBox(height: 25.0),
            for(int i=0; i< _questions[index].options.length; i++)
              GestureDetector(
                onTap: ()=>_questions[index].options.values.toList()[i]==true?checkAnswerandUpdate(_questions[index].options.values.toList()[i]): changeColor(),
                child: OptionCard(option: _questions[index].options.keys.toList()[i],
                color:isPressed? _questions[index].options.values.toList()[i]==true? correct: notCorrect : neutral,

                ),
              )


          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child:  nextButton(nextQuestion:nextQuestion),
      ) ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
