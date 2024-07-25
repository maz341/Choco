import 'package:choco_app/const/const.dart';
import 'package:choco_app/views/business_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  String workplace = "restaurant";

  gotoNextScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BusinessInfoScreen(),
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
            CustomStrings.whatWouldYou,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            CustomStrings.createYourBusiness,
            style: GoogleFonts.openSans(
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 30),
          selectionPanel(CustomStrings.createMyBusiness,
              CustomStrings.iWantToGetSetup, ImagePaths.landingImage2),
          const SizedBox(height: 20),
          selectionPanel(CustomStrings.joinMyTeam,
              CustomStrings.myTeamIsAlreadyOrder, ImagePaths.landingImage3),
        ],
      ),
    );
  }

  selectionPanel(firstString, secondString, image) {
    return GestureDetector(
      onTap: gotoNextScreen,
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: Colors.grey.withOpacity(0.3), width: 2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(children: [
          Image(
            image: AssetImage(image),
            height: 100,
          ),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                firstString,
                style: GoogleFonts.openSans(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                secondString,
                style: GoogleFonts.openSans(
                  fontSize: 11,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
