import 'dart:async';
import 'package:flutter/material.dart';
import 'package:plusvalia/core/constant/app_assets.dart';
import 'package:plusvalia/core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Center(
          child: Image.asset(
            AppAssets.appLogo,
            width: 200,
          ),
        ),
      ),
    );
  }
}
