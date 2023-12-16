import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:admin_dashboard/data/repository/dashboard_repository_impl.dart';
import 'package:admin_dashboard/core/di/network_provider.dart';

final dashboardRepositoryProvider = Provider((ref) {
  final dio = ref.read(dioClientProvider);
  return DashboardRepositoryImpl(client: dio);
});
