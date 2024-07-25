import 'package:choco_app/const/const.dart';
import 'package:choco_app/widgets/buttons.dart';
import 'package:flutter/material.dart';

import 'create_profile.dart';

class OTPScreen extends StatefulWidget {
  String phoneNumber;
  OTPScreen({required this.phoneNumber, super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final firstCharController = TextEditingController();
  final secondCharController = TextEditingController();
  final thirdCharController = TextEditingController();
  final forthCharController = TextEditingController();
  final fifthCharController = TextEditingController();
  final sixCharController = TextEditingController();

  continueMethod() {
    String firstChar = firstCharController.text;
    String secondChar = secondCharController.text;
    String thirdChar = thirdCharController.text;
    String forthChar = forthCharController.text;
    String fifthChar = fifthCharController.text;
    String sixChar = sixCharController.text;
    if (firstChar.isEmpty ||
        secondChar.isEmpty ||
        thirdChar.isEmpty ||
        forthChar.isEmpty ||
        fifthChar.isEmpty ||
        sixChar.isEmpty) {
      _showMyDialog();
      return;
    }

    String otpCode =
        firstChar + secondChar + thirdChar + forthChar + fifthChar + sixChar;
    debugPrint(otpCode);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateProfile(),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Please Enter OTP',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Please enter the OTP first'),
              TextButton(
                child: const Text('Okay'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(),
    );
  }

  _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          const Text(
            CustomStrings.weJustSentYou,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "${CustomStrings.weSendThe}${widget.phoneNumber}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 20),
          otpFields(),
          const Spacer(),
          CustButton(
            btnText: "Continue",
            onPressed: continueMethod,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  otpFields() {
    return Container(
      width: 300,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          singleOtpField(firstCharController),
          const SizedBox(width: 10),
          singleOtpField(secondCharController),
          const SizedBox(width: 10),
          singleOtpField(thirdCharController),
          const SizedBox(width: 10),
          singleOtpField(forthCharController),
          const SizedBox(width: 10),
          singleOtpField(fifthCharController),
          const SizedBox(width: 10),
          singleOtpField(sixCharController),
        ],
      ),
    );
  }

  singleOtpField(TextEditingController myController) {
    return Flexible(
      child: TextField(
        controller: myController,
        style: const TextStyle(fontSize: 12),
        autofocus: true,
        maxLength: 1,
        textAlign: TextAlign.center,
        scrollPadding: const EdgeInsets.all(0),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        onChanged: (value) {
          FocusScope.of(context).nextFocus();
        },
        decoration: InputDecoration(
          counterText: "",
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.grey.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: AppColors.primaryColorLight,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
