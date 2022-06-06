import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:stockbit_coin_submission/view/Scanner.dart';
import 'package:stockbit_coin_submission/view/akun.dart';
import 'package:stockbit_coin_submission/view/ScannerWidget.dart';
import 'package:stockbit_coin_submission/view/session.dart';

class menumain extends StatefulWidget {
  @override
  _menumainState createState() => _menumainState();
}

class _menumainState extends State<menumain> {



  List<Widget> _buildScreens() {

    return [
      session(),
      // ScannerWidget(),
      Scanner(),
      akun()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_outlined),
        title: ("Session"),
        activeColorPrimary: Colors.deepOrangeAccent,
        inactiveColorPrimary: Colors.deepOrange,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.photo_camera_outlined),
        title: ("Scan"),
        activeColorPrimary: Colors.deepOrangeAccent,
        inactiveColorPrimary: Colors.deepOrange,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_add_outlined),
        title: ("Account List"),
        activeColorPrimary: Colors.deepOrangeAccent,
        inactiveColorPrimary: Colors.deepOrange,
      ),
    ];
  }



  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    );

  }
}

