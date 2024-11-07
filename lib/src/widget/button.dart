import 'package:flutter/material.dart';

class CutomButtom extends StatelessWidget {
  const CutomButtom(
      {super.key,
      required this.onTap,
      required this.text,
      required this.color,
      required this.textColor,
      required this.borderColor,
      required this.radius,
      this.size,
      this.padding});
  final void Function()? onTap;
  final String text;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final double radius;
  final double? size;
  final double? padding;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: padding ?? 10.0, vertical: 10),
        child: Container(
          height: size ?? 65,
          width: double.maxFinite,
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: borderColor),
              borderRadius: BorderRadius.circular(radius),
              color: color),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "ReadexPro",
                  color: textColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
