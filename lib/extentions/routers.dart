 import 'package:flutter/material.dart';
import 'package:moviehub/views/Home/home_screen.dart';

Map<String, WidgetBuilder> get routes {
    return {
      'homescreen' : (context) => HomeScreen()
    };
  }