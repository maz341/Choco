import 'package:choco_app/const/const.dart';
import 'package:choco_app/views/orders_page.dart';
import 'package:choco_app/views/supplier_page.dart';
import 'package:choco_app/views/team_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    SupplierPage(),
    OrdersPage(),
    TeamPage(),
  ];

  @override
  void initState() {
    creatingNotification();

    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      appBar: custAppbar(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          bottomNavItem(
            'Suppliers',
            Icons.chat_rounded,
            Icons.chat_outlined,
          ),
          bottomNavItem(
            'Orders',
            Icons.shopping_cart,
            Icons.shopping_cart_outlined,
          ),
          bottomNavItem(
            'Team',
            Icons.people,
            Icons.people_alt_outlined,
          ),
        ],
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(color: AppColors.primaryColor),
        selectedItemColor: AppColors.primaryColor,
        iconSize: 40,
        unselectedLabelStyle: TextStyle(color: Colors.grey.withOpacity(0.3)),
        onTap: _onItemTapped,
        elevation: 5,
      ),
    );
  }

  custAppbar() {
    const String assetName = 'assets/images/logo.svg';
    final Widget logo = Container(
      margin: const EdgeInsets.only(left: 15),
      child: SvgPicture.asset(
        assetName,
        semanticsLabel: 'Choco Logo',
        color: AppColors.primaryColor,
        height: 30,
        width: 50,
      ),
    );
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      leading: logo,
      leadingWidth: 100,
      elevation: 3,
      shadowColor: AppColors.bgGreyColor,
      actions: [
        IconButton(
          onPressed: () => print(""),
          icon: const Icon(
            Icons.search,
            color: AppColors.primaryColorLight,
          ),
        ),
        IconButton(
          onPressed: () => print(""),
          icon: const Icon(
            Icons.question_mark_sharp,
            color: AppColors.primaryColorLight,
          ),
        ),
        IconButton(
          onPressed: () => print(""),
          icon: const Icon(
            Icons.settings,
            color: AppColors.primaryColorLight,
          ),
        ),
      ],
    );
  }

  bottomNavItem(String name, IconData active, IconData inActive) {
    return BottomNavigationBarItem(
      icon: Icon(
        inActive,
        size: 22,
        color: Colors.grey.withOpacity(0.3),
      ),
      label: name,
      activeIcon: Icon(
        active,
        size: 25,
        color: AppColors.primaryColor,
      ),
    );
  }

  void creatingNotification() {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    String title = "", description = "";

    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsDarwin,
        macOS: initializationSettingsDarwin);

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onSelectNotification: onSelectNotification,
    );

    flutterLocalNotificationsPlugin.show(
      title.hashCode,
      title,
      description,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "10007",
          "Flutter_Provider_Notifications",
          channelDescription: "My Channel Description",
          // icon: 'launch_background',
          playSound: true,
          // sound: RawResourceAndroidNotificationSound('new_ride'),
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
  }

  // FirebaseMessaging.onMessageOpenedApp.listen(
  //   (RemoteMessage message) {},
  // );

  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
}

void onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload) async {
  // display a dialog with the notification details, tap ok to go to another page
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) => CupertinoAlertDialog(
  //       title: Text(title),
  //       content: Text(body),
  //       actions: [
  //         CupertinoDialogAction(
  //           isDefaultAction: true,
  //           child: Text('Ok'),
  //           onPressed: () async {
  //             Navigator.of(context, rootNavigator: true).pop();
  //             await Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) => SecondScreen(payload),
  //               ),
  //             );
  //           },
  //         )
  //       ],
  //     ),
  //   );
}
