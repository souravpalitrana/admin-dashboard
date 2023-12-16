import 'package:admin_dashboard/domain/entity/api_response.dart';
import 'package:admin_dashboard/domain/entity/post/post.dart';
import 'package:admin_dashboard/domain/usecase/usecase.dart';

class UpdatePostUseCase extends UseCase<Post> {
  UpdatePostUseCase({required super.dashboardRepository});

  @override
  Future<ApiResponse> execute() {
    return dashboardRepository.updatePost(getParam()!);
  }
}
