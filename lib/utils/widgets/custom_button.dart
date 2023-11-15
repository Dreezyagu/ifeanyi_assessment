import 'package:eden_assessment/utils/components/colors.dart';
import 'package:eden_assessment/utils/components/extensions.dart';
import 'package:flutter/material.dart';

class CustomContinueButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final bool isActive;
  final Color bgColor;
  final Color? textColor;
  final Color? borderColor;
  final double? textSize;
  final double? topPadding;
  final double? innerTopPadding;
  final bool enabled;
  final double? sidePadding;
  final double? elevation;
  final FontWeight? fontWeight;

  const CustomContinueButton(
      {Key? key,
      required this.onPressed,
      this.fontWeight,
      this.title = 'Continue',
      this.sidePadding,
      this.topPadding,
      this.textColor,
      this.borderColor,
      this.textSize,
      this.elevation,
      this.bgColor = AppColors.primary600,
      this.isActive = true,
      this.enabled = true,
      this.innerTopPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: sidePadding ?? 0, vertical: topPadding ?? 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            elevation: elevation,
            shape: RoundedRectangleBorder(
                side: enabled
                    ? isActive
                        ? BorderSide(color: borderColor ?? bgColor)
                        : BorderSide.none
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(10.0)),
          ),
          onPressed: enabled
              ? isActive
                  ? onPressed
                  : null
              : null,
          child: isActive
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: context.height(.02)),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: textColor ?? AppColors.white,
                        fontFamilyFallback: const ["Work Sans"],
                        fontSize: textSize ?? 18.0,
                        fontWeight: fontWeight ?? FontWeight.w500),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * .025),
                  child: const ButtonCircularLoadingIndicator(),
                ),
        ),
      ),
    );
  }
}

class ButtonCircularLoadingIndicator extends StatelessWidget {
  const ButtonCircularLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: AppColors.primary500)),
      child: const SizedBox(
        width: 10.0,
        height: 10.0,
        child: CircularProgressIndicator(
          color: AppColors.primary500,
        ),
      ),
    );
  }
}
