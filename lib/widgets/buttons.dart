import 'package:choco_app/const/const.dart';
import 'package:flutter/material.dart';

class CustButton extends StatelessWidget {
  Function()? onPressed;
  String btnText;
  Color txtColor, bgColor;
  double radius;
  CustButton({
    this.onPressed,
    required this.btnText,
    this.radius = 8.0,
    this.bgColor = AppColors.primaryColorLight,
    this.txtColor = AppColors.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(bgColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
      child: Center(
        child: Text(
          btnText,
          style: TextStyle(color: txtColor),
        ),
      ),
    );
  }
}
