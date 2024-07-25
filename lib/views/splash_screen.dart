import 'package:choco_app/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'landing_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotoLandingPage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/images/logo.svg';
    final Widget logo = SvgPicture.asset(assetName, semanticsLabel: 'Logo');

    return Scaffold(
      backgroundColor: AppColors.primaryColorLight,
      body: Stack(
        children: [
          Center(
            child: logo,
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Text(
                "By Maaz Kamal",
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void gotoLandingPage() {
    Future.delayed(const Duration(seconds: 3)).then((value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LandingPage(),
        )));
  }
}
