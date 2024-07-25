import 'package:choco_app/const/const.dart';
import 'package:flutter/material.dart';

class CustTextfield extends StatelessWidget {
  Function()? onChange;
  TextEditingController controller;
  String? hint;

  CustTextfield({
    required this.controller,
    this.onChange,
    this.hint,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(fontSize: 12),
      autofocus: true,
      scrollPadding: const EdgeInsets.all(0),
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        hintText: hint,
        fillColor: AppColors.whiteColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
