import 'package:admin_dashboard/domain/entity/api_response.dart';
import 'package:admin_dashboard/domain/entity/login/login_request.dart';
import 'package:admin_dashboard/domain/usecase/usecase.dart';

class LoginUseCase extends UseCase<LoginRequest> {
  LoginUseCase({required super.dashboardRepository});

  @override
  Future<ApiResponse> execute() {
    return dashboardRepository.login(getParam()!);
  }
}
