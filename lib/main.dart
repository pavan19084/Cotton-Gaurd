import "package:flutter/material.dart";
import "package:sgp/splash.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.teal,        
      ),
      debugShowCheckedModeBanner: false,
      home:  const SplashScreen(),
    );
  }
}