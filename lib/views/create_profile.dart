import 'package:choco_app/const/const.dart';
import 'package:choco_app/views/selection_screen.dart';
import 'package:choco_app/widgets/buttons.dart';
import 'package:choco_app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  String workplace = "restaurant";

  gotoNextScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SelectionScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.formBgColor,
      body: _body(),
    );
  }

  _body() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            CustomStrings.letsCreateProfile,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            CustomStrings.yourProfileIs,
            style: GoogleFonts.openSans(fontSize: 12),
          ),
          const SizedBox(height: 20),
          label(CustomStrings.fullName, '  *'),
          const SizedBox(height: 5),
          CustTextfield(
              controller: nameController, hint: CustomStrings.johnSmith),
          const SizedBox(height: 20),
          label(CustomStrings.emailAddress, '  *'),
          const SizedBox(height: 5),
          CustTextfield(
              controller: emailController, hint: CustomStrings.johnSmithEmail),
          const SizedBox(height: 20),
          label(CustomStrings.myWorkplace, '  *'),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border.all(color: Colors.grey.withOpacity(0.5), width: 2),
            ),
            child: Column(
              children: [
                singleRadioWidget(CustomStrings.aRestaurantCafe, 'restaurant'),
                const Divider(
                  height: 1,
                  indent: 2,
                  endIndent: 2,
                ),
                singleRadioWidget(CustomStrings.aSupplierProducer, 'supplier'),
              ],
            ),
          ),
          const Spacer(),
          CustButton(
            btnText: 'CREATE PROFILE',
            bgColor: AppColors.primaryColorLight,
            radius: 20,
            onPressed: gotoNextScreen,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  label(firstString, secondString) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: GoogleFonts.openSans(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor,
        ),
        children: <TextSpan>[
          TextSpan(text: firstString),
          TextSpan(
            text: secondString,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  singleRadioWidget(text, value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: GoogleFonts.openSans(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 35,
            child: RadioListTile(
              value: value,
              groupValue: workplace,
              onChanged: (value) {
                debugPrint(value);
                setState(() {
                  workplace = value.toString();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
