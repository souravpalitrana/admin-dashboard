import 'package:dio/dio.dart';
import 'package:admin_dashboard/domain/entity/login/login_request.dart';
import 'package:admin_dashboard/domain/entity/login/login_response.dart';
import 'package:admin_dashboard/domain/entity/post/post.dart';
import 'package:admin_dashboard/domain/entity/post/post_by_date_request.dart';
import 'package:admin_dashboard/domain/entity/api_response.dart';
import 'package:admin_dashboard/domain/entity/post/post_operation_response.dart';
import 'package:admin_dashboard/domain/entity/post/posts_response.dart';
import 'package:admin_dashboard/domain/repository/dashboard_repository.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  DashboardRepositoryImpl({required this.client});

  final Dio client;

  @override
  Future<ApiResponse> addPost(Post post) async {
    try {
      final postJson = post.toJson();
      final response = await client.post("/add_posts", data: postJson);
      print(response.data);
      final statusCode = response.statusCode ?? 500;
      if (statusCode >= 200 && statusCode < 400) {
        final postOperationResponse =
            PostOperationResponse.fromJson(response.data);
        return SuccessResponse<PostOperationResponse>(
            statusCode: statusCode, data: postOperationResponse);
      }
    } catch (e) {
      print(e.toString());
    }

    return const ErrorResponse(
        statusCode: 200, errorMessage: "Something went wrong. Try later.");
  }

  @override
  Future<ApiResponse> deletePost(int id) async {
    try {
      //final response = await client.delete("/posts/${id}");
      // For mock api purpose
      final response = await client.delete("/posts");
      final statusCode = response.statusCode ?? 500;
      if (statusCode >= 200 && statusCode < 400) {
        final postOperationResponse =
            PostOperationResponse.fromJson(response.data);
        return SuccessResponse<PostOperationResponse>(
            statusCode: statusCode, data: postOperationResponse);
      }
    } catch (e) {
      print(e.toString());
    }

    return const ErrorResponse(
        statusCode: 200, errorMessage: "Something went wrong. Try later.");
  }

  @override
  Future<ApiResponse> getAllPost() async {
    try {
      final response = await client.get("/posts");
      final statusCode = response.statusCode ?? 500;
      if (statusCode >= 200 && statusCode < 400) {
        final postsResponse = PostsResponse.fromJson(response.data);
        return SuccessResponse<PostsResponse>(
            statusCode: statusCode, data: postsResponse);
      } else {
        return ErrorResponse(
            statusCode: statusCode, errorMessage: "Something went wrong");
      }
    } catch (e) {
      print(e.toString());
    }

    return const ErrorResponse(
        statusCode: 500, errorMessage: "Something went wrong");
  }

  @override
  Future<ApiResponse> getPostByDate(PostByDateRequest postByDateRequest) async {
    try {
      final requestBody = postByDateRequest.toJson();
      final response = await client.post("/posts", data: requestBody);
      final statusCode = response.statusCode ?? 500;
      if (statusCode >= 200 && statusCode < 400) {
        final postsResponse = PostsResponse.fromJson(response.data);
        return SuccessResponse<PostsResponse>(
            statusCode: statusCode, data: postsResponse);
      }
    } catch (e) {
      print(e.toString());
    }

    return const ErrorResponse(
        statusCode: 200, errorMessage: "Something went wrong. Try later.");
  }

  @override
  Future<ApiResponse> getPostById(int id) {
    // TODO: implement getPostById
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> login(LoginRequest loginRequest) async {
    try {
      final data = loginRequest.toJson();
      final response = await client.post("/login", data: data);
      final statusCode = response.statusCode ?? 500;
      if (statusCode >= 200 && statusCode < 400) {
        final loginResponse = LoginResponse.fromJson(response.data);
        return SuccessResponse<LoginResponse>(
            statusCode: statusCode, data: loginResponse);
      }
    } catch (e) {
      print(e.toString());
    }

    return const ErrorResponse(
        statusCode: 200, errorMessage: "Invalid Credential");
  }

  @override
  Future<ApiResponse> updatePost(Post post) async {
    try {
      final postJson = post.toJson();
      //final response = await client.put("/posts/${post.id}", data: postJson);
      // For Testing Purpose
      final response = await client.put("/posts");
      final statusCode = response.statusCode ?? 500;
      if (statusCode >= 200 && statusCode < 400) {
        final postOperationResponse =
            PostOperationResponse.fromJson(response.data);
        return SuccessResponse<PostOperationResponse>(
            statusCode: statusCode, data: postOperationResponse);
      }
    } catch (e) {
      print(e.toString());
    }

    return const ErrorResponse(
        statusCode: 200, errorMessage: "Something went wrong. Try later.");
  }
}
