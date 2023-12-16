import 'package:flutter/material.dart';
import 'package:admin_dashboard/presentation/feature/home/screen/home_screen.dart';
import 'package:admin_dashboard/presentation/feature/login/screen/login_screen.dart';

void navigateToHome(BuildContext context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
    return const HomeScreen();
  }));
}

void navigateToLogin(BuildContext context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
    return const LoginScreen();
  }));
}
