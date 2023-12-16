import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:admin_dashboard/core/constants/app_texts.dart';
import 'package:admin_dashboard/core/constants/color_constants.dart';
import 'package:admin_dashboard/core/constants/image_constants.dart';
import 'package:admin_dashboard/core/utils/utils.dart';
import 'package:admin_dashboard/presentation/feature/login/widget/login_form.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 1000,
          height: 600,
          child: Card(
            surfaceTintColor: Colors.transparent,
            color: AppColors.splashBackground,
            shadowColor: AppColors.loginShadowColor,
            elevation: 8,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),),
            child: Row(
              children: [
                getLoginFormWidget(),
                getBrandLogoWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getLoginFormWidget() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(50),
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: const Center(
          child: LoginForm(),
        ),
      ),
    );
  }

  Widget getBrandLogoWidget() {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                AppTexts.adminDashboard,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              add24VerticalSpace(),
              const Image(
                image: AssetImage(ImageConstants.appLogo),
                width: 200,
                height: 200,
              ),
              add24VerticalSpace(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  AppTexts.splashTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.loginSubtextColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
