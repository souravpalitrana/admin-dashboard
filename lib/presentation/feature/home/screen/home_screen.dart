import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:admin_dashboard/core/constants/app_constants.dart';
import 'package:admin_dashboard/core/constants/app_texts.dart';
import 'package:admin_dashboard/core/constants/color_constants.dart';
import 'package:admin_dashboard/core/constants/image_constants.dart';
import 'package:admin_dashboard/core/di/session_provider.dart';
import 'package:admin_dashboard/core/utils/utils.dart';
import 'package:admin_dashboard/presentation/feature/home/model/dashboard_menu.dart';
import 'package:admin_dashboard/presentation/feature/home/provider/dashboard_menu_selection_provider.dart';
import 'package:admin_dashboard/presentation/feature/home/widgets/all_post_widget/all_post_widget.dart';
import 'package:admin_dashboard/presentation/feature/home/widgets/post_by_date_widget/posts_by_date_widget.dart';
import 'package:admin_dashboard/presentation/feature/home/widgets/post_details_widget/post_details_widget.dart';
import 'package:admin_dashboard/core/routing/routes.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late DashboardMenuSelectionNotifier menuSelectionNotifier;
  late bool isSuperAdmin;

  @override
  void initState() {
    menuSelectionNotifier =
        ref.read(menuSelectionStateNotifierProvider.notifier);
    isSuperAdmin = ref.read(sessionState.notifier).isSuperAdmin;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(menuSelectionProvider);
    DashboardMenu selectedMenu = ref.read(menuSelectionProvider);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Row(
          children: [
            SizedBox(
              width: kLeftMenuWidth,
              child: Column(
                children: [
                  add64VerticalSpace(),
                  _getAppLogo(),
                  add16VerticalSpace(),
                  _getAdminTitle(),
                  add24VerticalSpace(),
                  getMenuItem(AppTexts.menuHome, selectedMenu == DashboardMenu.home, () {
                    menuSelectionNotifier.selectMenu(DashboardMenu.home);
                  }),
                  add8VerticalSpace(),
                  getMenuItem(AppTexts.menuAllPost, selectedMenu == DashboardMenu.allPost,
                      () {
                    menuSelectionNotifier.selectMenu(DashboardMenu.allPost);
                  }),
                  add8VerticalSpace(),
                  getAddPostItem(isSuperAdmin, selectedMenu),
                  const Spacer(),
                  getLogoutButton(),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 100),
                color: AppColors.background,
                width: double.infinity,
                child: getWidgetByMenuSelection(selectedMenu),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getAdminTitle() {
    return Text(
      AppTexts.superAdmin,
      style: TextStyle(
        color: Colors.black.withOpacity(0.6),
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
    );
  }

  Widget _getAppLogo() {
    return const Image(
      image: AssetImage(ImageConstants.appLogo),
      width: 80,
      height: 80,
    );
  }

  Widget getAddPostItem(bool isSuperAdmin, DashboardMenu selectedMenu) {
    if (isSuperAdmin) {
      return getMenuItem(AppTexts.menuAddPost, selectedMenu == DashboardMenu.addPost, () {
        menuSelectionNotifier.selectMenu(DashboardMenu.addPost);
      });
    } else {
      return const SizedBox();
    }
  }

  Widget getMenuItem(String name, bool isSelected, void Function() onPressed) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          surfaceTintColor: Colors.transparent,
          backgroundColor: isSelected ? AppColors.background : Colors.white,
          side: BorderSide.none,
          minimumSize: const Size.fromHeight(60),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
      onPressed: onPressed,
      child: Text(
        name,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black.withOpacity(0.6),
        ),
      ),
    );
  }

  Widget getLogoutButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
          side: BorderSide.none,
          minimumSize: Size.fromHeight(60),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
      onPressed: () {
        ref.read(sessionState.notifier).clearSession();
        navigateToLogin(context);
      },
      child: const Text(
        AppTexts.logout,
        style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 62, 10, 10),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget getWidgetByMenuSelection(DashboardMenu menu) {
    switch (menu) {
      case DashboardMenu.home:
        return const PostByDateWidget();
      case DashboardMenu.allPost:
        return const AllPostWidget();
      case DashboardMenu.addPost:
        return Container(
          padding: const EdgeInsets.only(top: 56, bottom: 56, left: 56, right: 56),
          height: double.infinity,
          child: PostDetailsWidget(),
        );
    }
  }
}
