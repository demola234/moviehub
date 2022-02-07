import 'package:flutter/material.dart';
import 'package:moviehub/views/Home/home_screen.dart';
import 'extentions/routers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieHub',
      initialRoute: "/",
      routes: routes,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
