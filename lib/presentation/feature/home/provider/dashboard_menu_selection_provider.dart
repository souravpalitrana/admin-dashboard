import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:admin_dashboard/presentation/feature/home/model/dashboard_menu.dart';

class DashboardMenuSelectionNotifier extends StateNotifier<DashboardMenu> {
  DashboardMenuSelectionNotifier() : super(DashboardMenu.home);

  void selectMenu(DashboardMenu menu) {
    state = menu;
  }
}

final menuSelectionStateNotifierProvider =
    StateNotifierProvider<DashboardMenuSelectionNotifier, DashboardMenu>(
        (ref) => DashboardMenuSelectionNotifier());

final menuSelectionProvider =
    Provider((ref) => ref.watch(menuSelectionStateNotifierProvider));
