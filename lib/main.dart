import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:admin_dashboard/core/constants/color_constants.dart';
import 'package:admin_dashboard/presentation/feature/splash/screen/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: DashboardApp()));
}

class DashboardApp extends StatelessWidget {
  const DashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.themeColor,
            surface: AppColors.splashBackground,
          ),
          scaffoldBackgroundColor: AppColors.splashBackground,
          useMaterial3: true,
        ),
        home: const SplashScreen()

    );
  }
}
