 import 'package:flutter/material.dart';
import 'package:moviehub/views/Description/description.dart';
import 'package:moviehub/views/Home/home_screen.dart';
import 'package:moviehub/views/Settings/settings.dart';

Map<String, WidgetBuilder> get routes {
    return {
      'homescreen' : (context) => HomeScreen(),
      'description' : (context) => Description(),
      'settings' : (context) => SettingsScreen()
    };
  }