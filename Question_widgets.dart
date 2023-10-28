import 'package:flutter/cupertino.dart';
import 'package:myquiz/constants.dart';

class QuestionWidgets extends StatelessWidget {
  QuestionWidgets(this.question, this.indexAction, this.TotalQuestion);


  String? question;
  int? indexAction;
  int? TotalQuestion;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text('Question ${indexAction!+1}/$TotalQuestion:$question',
      style: TextStyle(fontSize: 24, color:Color(0xff000000) ),
      ),
    );
  }




}
