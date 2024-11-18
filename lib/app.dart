import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:travel_journal/screens/home/home.dart';
import 'package:travel_journal/screens/myTrips/myTrips.dart';
import 'package:travel_journal/screens/profile/profile.dart';

class App extends StatefulWidget {
  App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final NotchBottomBarController _notchBottomBarController =
      NotchBottomBarController();

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _notchBottomBarController,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        kIconSize: 24.0,
        kBottomRadius: 12.0,
        bottomBarItems: [
          // home nav item
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.home_filled,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.home_filled,
              color: Colors.blueAccent,
            ),
            itemLabel: 'Home',
          ),
          // my trips nav item
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.travel_explore,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.travel_explore,
              color: Colors.blueAccent,
            ),
            itemLabel: 'My Trips',
          ),
          // profile nav item
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.person,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.person,
              color: Colors.blueAccent,
            ),
            itemLabel: 'Profile',
          ),
        ],
      ),
      body: // add home if index is 0
          pageIndex == 0
              ? HomeScreen()
              // add my trips if index is 1
              : pageIndex == 1
                  ? MyTrips()
                  // add profile if index is 2
                  : Profile(),
    );
  }
}
