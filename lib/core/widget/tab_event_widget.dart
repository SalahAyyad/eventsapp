import 'package:ecom/core/utlis/app_colors.dart';
import 'package:flutter/material.dart';

class Tabeeventwidget extends StatelessWidget {
  const Tabeeventwidget(
      {super.key,
      required this.eventname,
      required this.isSelected,
      required this.isInCreate});

  final String eventname;
  final bool isSelected;
  final bool isInCreate;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: () {
            if (isSelected == true && isInCreate == false) {
              return AppColors.whiteColor;
            } else if (isSelected == true && isInCreate == true) {
              return AppColors.primaryLight;
            } else if (isSelected == false && isInCreate == true) {
              return AppColors.whiteColor;
            } else {
              return AppColors.transparentColor;
            }
          }(),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: isInCreate ? AppColors.primaryLight : AppColors.whiteColor,
              width: 2)),
      child: Text(
        eventname,
        style: TextStyle(
          color: () {
            if (isSelected == true && isInCreate == false) {
              return AppColors.primaryLight;
            } else if (isSelected == true && isInCreate == true) {
              return AppColors.whiteColor;
            } else if (isSelected == false && isInCreate == true) {
              return AppColors.primaryLight;
            } else {
              return AppColors.whiteColor;
            }
          }(),
        ),
      ),
    );
  }
}
