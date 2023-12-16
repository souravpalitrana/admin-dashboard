import 'package:admin_dashboard/domain/entity/login/login_request.dart';
import 'package:admin_dashboard/domain/entity/post/post.dart';
import 'package:admin_dashboard/domain/entity/post/post_by_date_request.dart';
import 'package:admin_dashboard/domain/entity/api_response.dart';

abstract class DashboardRepository {
  Future<ApiResponse> login(LoginRequest loginRequest);
  Future<ApiResponse> getAllPost();
  Future<ApiResponse> getPostByDate(PostByDateRequest postByDateRequest);
  Future<ApiResponse> addPost(Post post);
  Future<ApiResponse> updatePost(Post post);
  Future<ApiResponse> deletePost(int id);
  Future<ApiResponse> getPostById(int id);
}
