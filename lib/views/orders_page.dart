import 'package:choco_app/const/const.dart';
import 'package:choco_app/views/orders/past_orders.dart';
import 'package:choco_app/views/orders/upcoming_orders.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> with TickerProviderStateMixin {
  int myIndex = 0;
  late Size screenSize;
  late TabController _controller;

  List<Widget> widgets = [
    const UpcomingOrders(),
    const PastOrders(),
  ];

  @override
  void initState() {
    super.initState();

    _controller = TabController(
      length: 2,
      vsync: this,
      animationDuration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: _body(),
    );
  }

  _body() {
    return SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: Column(
        children: [
          _tabBars(),
          const SizedBox(height: 20),
          _tabViews(),
          startOrderWidget(),
        ],
      ),
    );
  }

  _tabBars() {
    return Container(
      height: 30.0,
      margin: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.bgGreyColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: DefaultTabController(
          length: 2,
          initialIndex: myIndex,
          child: TabBar(
            controller: _controller,

            labelStyle: const TextStyle(
              fontSize: 12.0,
              fontFamily: 'Cairo-SemiBold',
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelColor: const Color.fromARGB(255, 39, 26, 26),
            labelColor: Colors.black,
            indicatorColor: AppColors.greyTextColor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: AppColors.whiteColor,
              border: Border.all(
                color: AppColors.bgGreyColor,
                style: BorderStyle.solid,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            tabs: const [
              Tab(text: "Upcoming"),
              Tab(text: "Past"),
            ],
            onTap: (index) {
              myIndex = index;
              setState(() {});
            },
          ),
        ),
      ),
    );
  }

  _tabViews() {
    return Expanded(
      child: TabBarView(
        controller: _controller,
        children: widgets,
      ),
    );
  }

  startOrderWidget() {
    return Container(
      height: 60,
      width: screenSize.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: AppColors.primaryColorLight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            CustomStrings.startOrder,
            style: GoogleFonts.openSans(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          GestureDetector(
            onTap: () => print(""),
            child: const Icon(
              Icons.arrow_forward_ios,
              weight: 4,
              color: AppColors.whiteColor,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}
