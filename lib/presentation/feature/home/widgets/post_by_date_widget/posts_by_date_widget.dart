import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:admin_dashboard/core/common/loading_dialog_manager.dart';
import 'package:admin_dashboard/core/constants/app_texts.dart';
import 'package:admin_dashboard/core/di/usecase_provider.dart';
import 'package:admin_dashboard/domain/entity/api_response.dart';
import 'package:admin_dashboard/domain/entity/post/post.dart';
import 'package:admin_dashboard/domain/entity/post/post_by_date_request.dart';
import 'package:admin_dashboard/domain/entity/post/posts_response.dart';
import 'package:admin_dashboard/presentation/feature/home/widgets/post_by_date_widget/post_list_widget.dart';
import 'package:admin_dashboard/core/common/dialog_helper.dart';
import 'package:admin_dashboard/core/constants/app_constants.dart';

class PostByDateWidget extends ConsumerStatefulWidget {
  const PostByDateWidget({super.key});

  @override
  ConsumerState<PostByDateWidget> createState() => _PostByDateWidgetState();
}

class _PostByDateWidgetState extends ConsumerState<PostByDateWidget> {
  TextEditingController _dateInputController = TextEditingController();
  late TextEditingController _maxInputController;
  final List<Post> _filteredPost = [];

  @override
  void initState() {
    _maxInputController = TextEditingController(text: "30");
    super.initState();
  }

  void _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.white, // <-- SEE HERE
              onPrimary: Color.fromARGB(255, 9, 107, 187), // <-- SEE HERE
              onSurface: Colors.black, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat(kDateFormat).format(pickedDate);
      _dateInputController.text = formattedDate;
    }
  }

  void _fetchPostByDate() async {
    if (_dateInputController.text.isEmpty) {
      showInfoDialog(
          context: context,
          title: AppTexts.wait,
          message: AppTexts.dateNotSelectedErrorMessage);
      return;
    } else if (_maxInputController.text.isEmpty) {
      showInfoDialog(
          context: context,
          title: AppTexts.wait,
          message: AppTexts.maxValueNotEnteredErrorMessage
      );
      return;
    }
    LoadingDialog.show(context, AppTexts.loadingPostMessage);
    final PostByDateRequest postByDateRequest = PostByDateRequest(
        date: _dateInputController.text,
        max: int.parse(_maxInputController.text));
    final getPostByDateUseCase = ref.read(getPostByDateUseCaseProvider);
    getPostByDateUseCase.setParam(postByDateRequest);
    final ApiResponse apiResponse = await getPostByDateUseCase.execute();
    if (!mounted) {
      return;
    }
    LoadingDialog.hide(context);
    if (apiResponse is SuccessResponse) {
      final PostsResponse postsResponse =
          (apiResponse as SuccessResponse<PostsResponse>).data;
      _filteredPost.clear();
      setState(() {
        _filteredPost.addAll(postsResponse.posts);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
          top: 32,
          bottom: 0,
          left: 16,
          right: 16,
        ),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 150,
                  height: 50,
                  child: TextFormField(
                    onTap: () {
                      _showDatePicker(context);
                    },
                    readOnly: true,
                    controller: _dateInputController,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: Icon(Icons.calendar_month_sharp),
                      border: OutlineInputBorder(),
                      label: Text(
                        AppTexts.selectDate,
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                SizedBox(
                  width: 70,
                  height: 40,
                  child: TextFormField(
                    controller: _maxInputController,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      label: Text(
                        AppTexts.max,
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    _fetchPostByDate();
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text(
                    AppTexts.getPostByDate,
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(height: 32),
            PostListWidget(allPost: _filteredPost),
          ],
        ));
  }
}
