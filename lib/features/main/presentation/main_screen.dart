import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:student_provider_project/utils/navbar_item.dart';
import 'package:student_provider_project/utils/screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    PersistentTabController persistentTabController = PersistentTabController();
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: PersistentTabView(
            context,
            items: navBarItem,
            screens: screens,
            controller: persistentTabController,
            hideNavigationBarWhenKeyboardShows: true,
            navBarStyle: NavBarStyle.style9,
          )),
    );
  }
}
