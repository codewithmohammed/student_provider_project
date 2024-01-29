import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

final navBarItem = [
  PersistentBottomNavBarItem(icon: const Icon(CupertinoIcons.home),title: 'Home'),
   PersistentBottomNavBarItem(icon: const Icon(CupertinoIcons.add_circled),title: 'Add'),
  PersistentBottomNavBarItem(icon: const Icon(CupertinoIcons.search),title: 'Search'),
  PersistentBottomNavBarItem(icon: const Icon(CupertinoIcons.settings),title: 'Settings')
];
