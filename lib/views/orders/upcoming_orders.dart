import 'package:choco_app/const/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpcomingOrders extends StatefulWidget {
  const UpcomingOrders({super.key});

  @override
  State<UpcomingOrders> createState() => _UpcomingOrdersState();
}

class _UpcomingOrdersState extends State<UpcomingOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Image(
              image: AssetImage(ImagePaths.landingImage2),
              height: 200,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            CustomStrings.noUpcomingOrders,
            style: GoogleFonts.openSans(
              fontSize: 16,
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
