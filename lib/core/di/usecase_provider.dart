import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:admin_dashboard/core/di/data_provider.dart';
import 'package:admin_dashboard/domain/usecase/add_post_usecase.dart';
import 'package:admin_dashboard/domain/usecase/delete_post_usecase.dart';
import 'package:admin_dashboard/domain/usecase/get_all_post_usecase.dart';
import 'package:admin_dashboard/domain/usecase/get_post_by_date_usecase.dart';
import 'package:admin_dashboard/domain/usecase/login_usecase.dart';
import 'package:admin_dashboard/domain/usecase/update_post_usecase.dart';

final loginUseCaseProvider = Provider((ref) {
  return LoginUseCase(dashboardRepository: ref.read(dashboardRepositoryProvider));
});

final getAllPostUseCaseProvider = Provider((ref) {
  return GetAllPostUseCase(
      dashboardRepository: ref.read(dashboardRepositoryProvider));
});

final getPostByDateUseCaseProvider = Provider((ref) {
  return GetPostByDateUseCase(
      dashboardRepository: ref.read(dashboardRepositoryProvider));
});

final addPostUseCaseProvider = Provider((ref) {
  return AddPostUseCase(dashboardRepository: ref.read(dashboardRepositoryProvider));
});

final deletePostUseCaseProvider = Provider((ref) {
  return DeletePostUseCase(
      dashboardRepository: ref.read(dashboardRepositoryProvider));
});

final updatePostUseCaseProvider = Provider((ref) {
  return UpdatePostUseCase(
      dashboardRepository: ref.read(dashboardRepositoryProvider));
});
