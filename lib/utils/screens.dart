import 'package:flutter/material.dart';
import 'package:student_provider_project/features/add/presentation/add_screen.dart';
import 'package:student_provider_project/features/home/presentation/home_screen.dart';
import 'package:student_provider_project/features/search/presentation/search_screen.dart';
import 'package:student_provider_project/features/settings/presentation/setting_screen.dart';

const List<Widget> screens = [
  HomeScreen(),
  AddScreen(),
  SearchScreen(),
  SettingScreen(),
];
