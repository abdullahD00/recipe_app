import 'package:flutter/material.dart';
import 'package:recipe/core/constant/color/color_const.dart';

class Gradienttextfield extends StatefulWidget {
  Gradienttextfield(
      {Key? key,
      required this.height,
      required this.width,
      required this.colors,
      required this.hintText,
      this.radius,
      required this.controller,
      required this.inputType,
      this.fontColor,
      this.fontWeight,
      this.fontSize})
      : super(key: key);

  double? height;
  double? width;
  List<Color> colors;
  String? hintText;
  double? radius;
  TextEditingController? controller;
  Color? fontColor;
  FontWeight? fontWeight;
  double? fontSize;
  TextInputType inputType;
  @override
  _GradienttextfieldState createState() => _GradienttextfieldState();
}

class _GradienttextfieldState extends State<Gradienttextfield> {
  @override
  Widget build(BuildContext context) {
    print("textfield log");
    print(widget.fontSize);
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 15),
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: widget.colors,
          ),
          borderRadius: BorderRadius.circular(widget.radius ?? 20.0),
        ),
        child: TextField(
          controller: widget.controller,
          minLines: 2,
          maxLines: 5,
          keyboardType: widget.inputType,
          cursorColor: RecipeColor.darkPink,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
                color: widget.fontColor ?? RecipeColor.black,
                fontSize: widget.fontSize ?? 18,
                fontWeight: widget.fontWeight ?? FontWeight.bold),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: RecipeColor.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: RecipeColor.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
