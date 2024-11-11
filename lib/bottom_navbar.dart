import 'package:flutter/material.dart';
import 'package:imaginarium/profile/profileScreen.dart';
import 'package:imaginarium/seetings/settings.dart';
import 'favorite/favoritescreen.dart';
import 'homescreen/homescreen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  // List of screens for navigation
  final List<Widget> screens = [
    HomeScreenPage(),
    FavoriteScreen(),
    SettingsScreen(),
    ProfileScreen(),
  ];

  // List of icons for the bottom navigation
  final List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        height: size.width * .155,
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent.withOpacity(0.1), // Light background for the nav bar
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)), // Rounded corners
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: size.width * .024),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index; // Set selected index
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon with dynamic color based on selection
                    Icon(
                      listOfIcons[index],
                      size: size.width * .076,
                      color: currentIndex == index ? Colors.deepPurple : Colors.grey,
                    ),
                    SizedBox(height: 5),
                    // Animated bar showing under selected icon
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      margin: EdgeInsets.only(
                        top: currentIndex == index ? 5 : 0,
                      ),
                      width: size.width * .153,
                      height: currentIndex == index ? 5 : 0,
                      decoration: BoxDecoration(
                        color: currentIndex == index ? Colors.deepPurple : Colors.transparent,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
