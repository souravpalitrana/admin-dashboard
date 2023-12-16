import 'dart:async';

import 'package:flutter/material.dart';
import 'package:admin_dashboard/core/constants/app_constants.dart';
import 'package:admin_dashboard/core/constants/app_texts.dart';
import 'package:admin_dashboard/core/constants/image_constants.dart';
import 'package:admin_dashboard/core/routing/routes.dart';
import 'package:admin_dashboard/core/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() async {
    Timer(const Duration(seconds: kSplashDurationInSeconds), () {
      navigateToLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _splashLogo(),
                add24VerticalSpace(),
                _appTitle()
              ],
            ),
          ),
          Center(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Image(
                  image:
                      const AssetImage(ImageConstants.companyLogo),
                  width: isMobileView() ? 150 : 250,
                  height: isMobileView() ? 150 : 250,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _splashLogo() {
    return Image(
      image: const AssetImage(ImageConstants.appLogo),
      width: isMobileView() ? 200 : 400,
      height: isMobileView() ? 200 : 400,
    );
  }

  Widget _appTitle() {
    return const Text(
      AppTexts.appName,
      style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
      ),
    );
  }
}
