import 'package:choco_app/const/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchSuppliers extends StatefulWidget {
  const SearchSuppliers({super.key});

  @override
  State<SearchSuppliers> createState() => _SearchSuppliersState();
}

class _SearchSuppliersState extends State<SearchSuppliers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.supplierBg,
      appBar: AppBar(
        // elevation: 1,
        foregroundColor: Colors.red,
        backgroundColor: AppColors.whiteColor,
        shadowColor: AppColors.bgGreyColor,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryColorLight,
          ),
        ),
        title: const TextField(
          style: TextStyle(fontSize: 12),
          autofocus: true,
          scrollPadding: EdgeInsets.all(0),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            hintText: 'Search...',
            fillColor: AppColors.whiteColor,
            filled: true,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              CustomStrings.searchForYour,
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              CustomStrings.searchForYourExisting,
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 14,
                color: AppColors.greyTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
