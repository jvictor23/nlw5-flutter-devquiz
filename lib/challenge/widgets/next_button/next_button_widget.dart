import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backGroundColor;
  final Color fontColor;
  final Color borderColor;
  final Color overlayColor;
  final VoidCallback onTap;
  const NextButtonWidget(
      {Key? key,
      required this.label,
      required this.backGroundColor,
      required this.fontColor,
      required this.borderColor,
      required this.overlayColor,
      required this.onTap})
      : super(key: key);

  NextButtonWidget.green({required String label, required VoidCallback onTap})
      : this.backGroundColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.green,
        this.overlayColor = Colors.teal,
        this.onTap = onTap,
        this.label = label;

  NextButtonWidget.white({required String label, required VoidCallback onTap})
      : this.backGroundColor = AppColors.white,
        this.fontColor = AppColors.grey,
        this.borderColor = AppColors.border,
        this.overlayColor = AppColors.lightGrey,
        this.onTap = onTap,
        this.label = label;

  NextButtonWidget.purple({required String label, required VoidCallback onTap})
      : this.backGroundColor = AppColors.purple,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.border,
        this.overlayColor = AppColors.lightGrey,
        this.onTap = onTap,
        this.label = label;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        child: TextButton(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(overlayColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                side: MaterialStateProperty.all(BorderSide(color: borderColor)),
                backgroundColor: MaterialStateProperty.all(backGroundColor)),
            onPressed: onTap,
            child: Text(
              label,
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w600, fontSize: 15, color: fontColor),
            )));
  }
}
