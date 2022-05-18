import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:food_delivery/pages/cart/cart_history.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  // late PersistentTabController _controller;

  List pages = [
    MainFoodPage(),
    Container(
      child: Center(
        child: Text('Next Page'),
      ),
    ),
    CartHistory(),
    Container(
      child: Center(
        child: Text('Next Page 3'),
      ),
    ),
  ];

  void bottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: pages[_selectedIndex],
           bottomNavigationBar: SnakeNavigationBar.color(
             onTap: bottomNavTap,
             currentIndex: _selectedIndex,
             unselectedItemColor: AppColors.mainColor,
             showSelectedLabels: false,
             showUnselectedLabels: false,
             snakeViewColor: AppColors.mainColor,

            //  snakeShape: SnakeShape.rectangle,
             behaviour: SnakeBarBehaviour.floating,
             elevation: 10,
             items: [
               BottomNavigationBarItem(
                 icon: Icon(Icons.home_outlined),
                 label: 'home',
               ),
               BottomNavigationBarItem(
                 icon: Icon(Icons.archive),
                 label: 'history',
               ),
               BottomNavigationBarItem(
                 icon: Icon(Icons.shopping_cart),
                 label: 'cart',
               ),
               BottomNavigationBarItem(
                 icon: Icon(Icons.person),
                 label: 'My Account',
               ),
             ],
           ),
          //  bottomNavigationBar: BottomNavigationBar(
          //    currentIndex: _selectedIndex,
          //    selectedItemColor: AppColors.mainColor,
          //    unselectedItemColor: Color.fromARGB(255, 67, 67, 48),
          //    showSelectedLabels: false,
          //    showUnselectedLabels: false,
          //    selectedFontSize: 0.0,
          //    unselectedFontSize: 0.0,
          //    onTap: bottomNavTap,
          //    items: [
          //      BottomNavigationBarItem(
          //        icon: Icon(Icons.home_outlined),
          //        label: 'home',
          //      ),
          //      BottomNavigationBarItem(
          //        icon: Icon(Icons.archive),
          //        label: 'history',
          //      ),
          //      BottomNavigationBarItem(
          //        icon: Icon(Icons.shopping_cart),
          //        label: 'cart',
          //      ),
          //      BottomNavigationBarItem(
          //        icon: Icon(Icons.person),
          //        label: 'My Account',
          //      ),
          //    ],
          //  ),
       );
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _controller = PersistentTabController(initialIndex: 0);
  // }

  // List<Widget> _buildScreens() {
  //   return [
  //     MainFoodPage(),
  //   Container(
  //     child: Center(
  //       child: Text('Next Page'),
  //     ),
  //   ),
  //   Container(
  //     child: Center(
  //       child: Text('Next Page 2'),
  //     ),
  //   ),
  //   Container(
  //     child: Center(
  //       child: Text('Next Page 3'),
  //     ),
  //   ),
  //   ];
  // }

  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.home),
  //       title: ("Home"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.archivebox_fill),
  //       title: ("History"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.cart_fill),
  //       title: ("Cart"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.person),
  //       title: ("Account"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //   ];
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return PersistentTabView(
  //     context,
  //     controller: _controller,
  //     screens: _buildScreens(),
  //     items: _navBarsItems(),
  //     confineInSafeArea: true,
  //     backgroundColor: Colors.white, // Default is Colors.white.
  //     handleAndroidBackButtonPress: true, // Default is true.
  //     resizeToAvoidBottomInset:
  //         true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
  //     stateManagement: true, // Default is true.
  //     hideNavigationBarWhenKeyboardShows:
  //         true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
  //     decoration: NavBarDecoration(
  //       borderRadius: BorderRadius.circular(10.0),
  //       colorBehindNavBar: Colors.white,
  //     ),
  //     popAllScreensOnTapOfSelectedTab: true,
  //     popActionScreens: PopActionScreensType.all,
  //     itemAnimationProperties: ItemAnimationProperties(
  //       // Navigation Bar's items animation properties.
  //       duration: Duration(milliseconds: 200),
  //       curve: Curves.ease,
  //     ),
  //     screenTransitionAnimation: ScreenTransitionAnimation(
  //       // Screen transition animation on change of selected tab.
  //       animateTabTransition: true,
  //       curve: Curves.ease,
  //       duration: Duration(milliseconds: 200),
  //     ),
  //     navBarStyle:
  //         NavBarStyle.style5, // Choose the nav bar style with this property.
  //   );
  // }

  
}
