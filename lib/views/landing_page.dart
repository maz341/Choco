import 'package:choco_app/const/const.dart';
import 'package:choco_app/utils/utils.dart';
import 'package:choco_app/views/login.dart';
import 'package:choco_app/widgets/buttons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _controller = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            myViewPage(),
            footer(),
          ],
        ),
      ),
    );
  }

  myViewPage() {
    return Expanded(
      child: PageView(
        controller: _controller,
        children: [
          pages(
            imagePath: ImagePaths.landingImage1,
            name: CustomStrings.orderingBut,
            description: CustomStrings.ordersAreConvertedInto,
          ),
          pages(
            imagePath: ImagePaths.landingImage2,
            name: CustomStrings.everythingInOnePlace,
            description: CustomStrings.orderGuidesPurchase,
          ),
          pages(
            imagePath: ImagePaths.landingImage3,
            name: CustomStrings.freeForRestaurants,
            description: CustomStrings.suppliersRecieveOrders,
          ),
        ],
      ),
    );
  }

  Widget pages({
    required String imagePath,
    required String name,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 80),
        Center(
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: GoogleFonts.passionOne(
              fontSize: 55,
              height: 0.8,
              fontWeight: FontWeight.bold,
              color: AppColors.backgroundColor,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            height: 1.2,
            color: AppColors.backgroundColor,
          ),
        ),
        const SizedBox(height: 20),
        const Spacer(),
        Center(
          child: Image(
            image: AssetImage(imagePath),
            height: 250,
            fit: BoxFit.cover,
          ),
        ),
        const Spacer(),
        PageViewDotIndicator(
          currentItem: _currentPage,
          count: 3,
          unselectedColor: Colors.grey,
          unselectedSize: const Size(5, 5),
          selectedColor: Colors.white,
        ),
      ],
    );
  }

  footer() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          CustButton(
            btnText: "Log in",
            onPressed: () => loginMethod(),
          ),
          const SizedBox(height: 5),
          CustButton(
            btnText: "Sign up",
            onPressed: () => signupMethod(),
            txtColor: AppColors.blackColor,
            bgColor: AppColors.backgroundColor,
          ),
          const SizedBox(height: 10),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
              children: <TextSpan>[
                const TextSpan(text: CustomStrings.byContinuingAndUsing),
                TextSpan(
                  text: CustomStrings.termsAndConditions,
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Utility().launchUrlMethod(Const.termsAndConditions);
                    },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  loginMethod() {
    debugPrint("Login - Do Something");
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ));
  }

  signupMethod() {}
}
