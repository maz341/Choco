import 'package:choco_app/const/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.formBgColor,
      body: _body(),
    );
  }

  _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        aboutYou(),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "1 team members",
            style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
          ),
        ),
        teamMembers(),
      ],
    );
  }

  teamMembers() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          color: AppColors.whiteColor,
          child: Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColorLight,
                ),
                child: const Center(
                    child: Icon(
                  Icons.person_add,
                  color: AppColors.whiteColor,
                  size: 30,
                )),
              ),
              const SizedBox(width: 15),
              Text(
                'Add team members',
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  color: AppColors.primaryColorLight,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          color: AppColors.whiteColor,
          child: Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.yellowColorLight,
                ),
                child: Center(
                  child: Text(
                    'Y',
                    style: GoogleFonts.openSans(
                      color: AppColors.yellowColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'You',
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Admin',
                    style: GoogleFonts.openSans(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  aboutYou() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      color: AppColors.whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColorSuperLight,
                ),
                child: Center(
                  child: Text(
                    'MC',
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                'Maaz CAFE',
                style: GoogleFonts.openSans(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => print(""),
            child: const Icon(
              Icons.arrow_forward_ios,
              weight: 4,
              color: AppColors.primaryColorLight,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}
