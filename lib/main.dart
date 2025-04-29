import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(TripWiseApp());
}

class TripWiseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TripWise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFFFEFDF7),
      ),
      home: SplashScreen(),
    );
  }
}
