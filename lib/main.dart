import 'package:eden_assessment/screens/login_screen.dart';
import 'package:eden_assessment/utils/components/colors.dart';
import 'package:flutter/material.dart';

void main() async {
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eden Assessment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        scaffoldBackgroundColor: AppColors.white,
        fontFamily: "Poppins",
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
