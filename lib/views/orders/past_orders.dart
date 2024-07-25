import 'package:choco_app/const/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PastOrders extends StatefulWidget {
  const PastOrders({super.key});

  @override
  State<PastOrders> createState() => _PastOrdersState();
}

class _PastOrdersState extends State<PastOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Center(
            child: Image(
              image: AssetImage(ImagePaths.landingImage2),
              height: 200,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            CustomStrings.noOrdersYet,
            style: GoogleFonts.openSans(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            CustomStrings.tapBelowToPlace,
            style: GoogleFonts.openSans(
              fontSize: 14,
              color: AppColors.greyTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
