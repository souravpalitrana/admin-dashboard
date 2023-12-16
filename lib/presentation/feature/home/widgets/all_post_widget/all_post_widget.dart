import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:admin_dashboard/core/common/loading_dialog_manager.dart';
import 'package:admin_dashboard/core/constants/app_texts.dart';
import 'package:admin_dashboard/core/di/usecase_provider.dart';
import 'package:admin_dashboard/domain/entity/api_response.dart';
import 'package:admin_dashboard/domain/entity/post/post.dart';
import 'package:admin_dashboard/domain/entity/post/posts_response.dart';
import 'package:admin_dashboard/presentation/feature/home/widgets/post_by_date_widget/post_list_widget.dart';

class AllPostWidget extends ConsumerStatefulWidget {
  const AllPostWidget({super.key});

  @override
  ConsumerState<AllPostWidget> createState() => _ALlPostWidgetState();
}

class _ALlPostWidgetState extends ConsumerState<AllPostWidget> {
  final List<Post> postList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _fetchAllPost(context);
    });
  }

  void _fetchAllPost(BuildContext context) async {
    LoadingDialog.show(context, AppTexts.allPostLoadingMessage);
    final getAllPostUseCase = ref.read(getAllPostUseCaseProvider);
    final apiResponse = await getAllPostUseCase.execute();
    if (!mounted) {
      return;
    }
    LoadingDialog.hide(context);
    if (apiResponse is SuccessResponse) {
      final PostsResponse postsResponse =
          (apiResponse as SuccessResponse<PostsResponse>).data;
      postList.clear();
      setState(() {
        postList.addAll(postsResponse.posts);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 32, bottom: 0, left: 16, right: 16),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            PostListWidget(allPost: postList),
          ],
        ));
  }
}
