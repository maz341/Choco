import 'package:choco_app/const/const.dart';
import 'package:choco_app/models/supplier_type_model.dart';
import 'package:choco_app/views/search_suppliers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';

class SupplierPage extends StatefulWidget {
  const SupplierPage({super.key});

  @override
  State<SupplierPage> createState() => _SupplierPageState();
}

class _SupplierPageState extends State<SupplierPage> {
  List<SupplierTypeModel> supplierTypeList = [
    SupplierTypeModel(
      name: CustomStrings.general,
      image: ImagePaths.carIcon,
    ),
    SupplierTypeModel(
      name: CustomStrings.produce,
      image: ImagePaths.tomatoIcon,
    ),
    SupplierTypeModel(
      name: CustomStrings.meat,
      image: ImagePaths.meatIcon,
    ),
    SupplierTypeModel(
      name: CustomStrings.fish,
      image: ImagePaths.fishIcon,
    ),
    SupplierTypeModel(
      name: CustomStrings.drinks,
      image: ImagePaths.canIcon,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.supplierBg,
      body: _body(),
    );
  }

  _body() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchSuppliers(),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  CustomStrings.addSupplier,
                  style: GoogleFonts.openSans(
                    color: AppColors.primaryColorLight,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
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
          ),
          const SizedBox(height: 25),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemCount: supplierTypeList.length,
                itemBuilder: (context, index) =>
                    supplierItem(supplierTypeList[index])),
          )
        ],
      ),
    );
  }

  supplierItem(SupplierTypeModel model) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SearchSuppliers())),
      child: DottedBorder(
        color: AppColors.primaryColorLight,
        strokeWidth: 1,
        child: Container(
          height: 70,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColorSuperLight,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryColorLight.withOpacity(0.2),
                      ),
                    ),
                    child: Image(
                      image: AssetImage(model.image!),
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name!,
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        CustomStrings.addYourSupplier,
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                          letterSpacing: 0.6,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => print("Plus"),
                child: const Icon(
                  Icons.add,
                  color: AppColors.primaryColorLight,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
