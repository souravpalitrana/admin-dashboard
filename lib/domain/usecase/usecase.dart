import 'package:admin_dashboard/domain/entity/api_response.dart';
import 'package:admin_dashboard/domain/repository/dashboard_repository.dart';

abstract class UseCase<T> {
  UseCase({required this.dashboardRepository});
  final DashboardRepository dashboardRepository;
  // ignore: unused_field
  T? _param;

  void setParam(T param) {
    this._param = param;
  }

  T? getParam() {
    return _param;
  }

  Future<ApiResponse> execute();
}
