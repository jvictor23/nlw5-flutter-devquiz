import 'package:flutter/material.dart';

import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:devquiz/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel quesiton;
  final ValueChanged<bool> onSelected;
  const QuizWidget({
    Key? key,
    required this.quesiton,
    required this.onSelected,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();

  toList() {}
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AnswerModel answer(int index) => widget.quesiton.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          Text(
            widget.quesiton.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          for (var i = 0; i < widget.quesiton.answers.length; i++)
            AnswerWidget(
              disabled: indexSelected != -1,
              onTap: (value) {
                indexSelected = i;
                
                setState(() {});
                Future.delayed(Duration(seconds: 1)).then((_) => widget.onSelected(value));
              },
              isSelected: indexSelected == i,
              answerModel: answer(i),
            )
        ],
      ),
    );
  }
}
