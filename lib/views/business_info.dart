import 'package:choco_app/const/const.dart';
import 'package:choco_app/views/bottom_navigation.dart';
import 'package:choco_app/widgets/buttons.dart';
import 'package:choco_app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BusinessInfoScreen extends StatefulWidget {
  const BusinessInfoScreen({super.key});

  @override
  State<BusinessInfoScreen> createState() => _BusinessInfoScreenState();
}

class _BusinessInfoScreenState extends State<BusinessInfoScreen> {
  final businessNameController = TextEditingController();
  final addressController = TextEditingController();

  gotoNextScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const BottomNavigation()));
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
            CustomStrings.whereDoYouWork,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            CustomStrings.thisInformationWill,
            style: GoogleFonts.openSans(
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 30),
          label(CustomStrings.businessName, '  *'),
          const SizedBox(height: 5),
          CustTextfield(
              controller: businessNameController,
              hint: CustomStrings.enterBusinessName),
          const SizedBox(height: 20),
          label(CustomStrings.deliveryAddress, '  *'),
          const SizedBox(height: 5),
          CustTextfield(
              controller: businessNameController,
              hint: CustomStrings.enterDeliveryAddress),
          const Spacer(),
          CustButton(
            btnText: 'CREATE BUSINESS',
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
}
