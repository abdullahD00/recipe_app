import 'package:flutter/material.dart';
import 'package:recipe/core/constant/color/color_const.dart';

class GeneralButton extends StatefulWidget {
  GeneralButton({
    super.key,
    required this.onPressedFun,
    required this.buttonWidget,
    required this.heightButton,
    required this.widthButton,
    this.buttonColor,
  });

  VoidCallback? onPressedFun;
  Widget? buttonWidget;
  double? heightButton;
  double? widthButton;
  Color? buttonColor;
  @override
  State<GeneralButton> createState() => _GeneralButtonState();
}

class _GeneralButtonState extends State<GeneralButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: SizedBox(
        height: widget.heightButton,
        width: widget.widthButton,
        child: ElevatedButton(
          onPressed: widget.onPressedFun,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.buttonColor ?? RecipeColor.myPink,
            shape: const StadiumBorder(),
          ),
          child: widget.buttonWidget,
        ),
      ),
    );
  }
}
