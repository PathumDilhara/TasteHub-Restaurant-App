import 'package:flutter/material.dart';
import 'package:tastehub/core/utils/colors.dart';
import 'package:tastehub/core/utils/constants.dart';

Widget customButton({
  required BuildContext context,
  required String title,
  required Color bgColor,
  required Color titleColor,
  double borderRadius = kButtonBR,
  double width = 100,
  double height = 40,
  required VoidCallback onTap,
}) {
  return Material(
    borderRadius: BorderRadius.circular(borderRadius),
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: bgColor,
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: AppColors.primWhite),
          ),
        ),
      ),
    ),
  );
}
