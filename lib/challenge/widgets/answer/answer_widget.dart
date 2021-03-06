import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answerModel;
  final bool isSelected;
  final bool disabled;
  final ValueChanged<bool> onTap;
  const AnswerWidget(
      {Key? key,
      required this.answerModel,
      required this.onTap,
      this.disabled = false,
      this.isSelected = false})
      : super(key: key);

  Color get _selectedColorRight =>
      answerModel.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      answerModel.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      answerModel.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      answerModel.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight => answerModel.isRight
      ? AppTextStyles.bodyDarkGreen
      : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight =>
      answerModel.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: (){
            onTap(answerModel.isRight);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: isSelected ? _selectedColorCardRight : AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(BorderSide(
                  color:
                      isSelected ? _selectedBorderCardRight : AppColors.white,
                ))),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  answerModel.title,
                  style:
                      isSelected ? _selectedTextStyleRight : AppTextStyles.body,
                )),
                Container(
                  decoration: BoxDecoration(
                      color: isSelected ? _selectedColorRight : AppColors.white,
                      borderRadius: BorderRadius.circular(500),
                      border: Border.fromBorderSide(
                          BorderSide(color: AppColors.border))),
                  width: 24,
                  height: 24,
                  child: isSelected
                      ? Icon(_selectedIconRight, size: 16, color: Colors.white)
                      : null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
