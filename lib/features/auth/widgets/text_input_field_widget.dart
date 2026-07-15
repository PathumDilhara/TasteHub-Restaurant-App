import 'package:flutter/material.dart';
import 'package:tastehub/core/utils/colors.dart';
import 'package:tastehub/core/utils/constants.dart';

Widget textInputFieldWidget({
  required BuildContext context,
  required TextEditingController controller,
  required String hintText,
  double borderRadius = 10,
  bool isVisible = false,
  bool isObscureText = false,
  required String? Function(String?)? validator,
}) {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(kTextInputBR),
    borderSide: BorderSide(color: Colors.grey),
  );

  final errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius),
    borderSide: BorderSide(color: Colors.red),
  );

  return TextFormField(
    controller: controller,
    maxLines: 1,
    style: Theme.of(context).textTheme.titleMedium,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: Theme.of(
        context,
      ).textTheme.bodyLarge!.copyWith(color: AppColors.primLightGrey),
      labelText: hintText,
      labelStyle: Theme.of(
        context,
      ).textTheme.bodyMedium!.copyWith(color: AppColors.primLightGrey),
      enabledBorder: border,
      focusedBorder: border,
      errorBorder: errorBorder,
      focusedErrorBorder: errorBorder,
      fillColor: AppColors.primWhite,
    ),
    keyboardType: TextInputType.text,
    obscureText: isObscureText,
    validator: validator,
  );
}
