import 'package:admin_dashboard/domain/entity/api_response.dart';
import 'package:admin_dashboard/domain/entity/post/post_by_date_request.dart';
import 'package:admin_dashboard/domain/usecase/usecase.dart';

class GetPostByDateUseCase extends UseCase<PostByDateRequest> {
  GetPostByDateUseCase({required super.dashboardRepository});

  @override
  Future<ApiResponse> execute() {
    return dashboardRepository.getPostByDate(getParam()!);
  }
}
