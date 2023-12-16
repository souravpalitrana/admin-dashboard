import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:admin_dashboard/core/common/form_validators.dart';
import 'package:admin_dashboard/core/common/loading_dialog_manager.dart';
import 'package:admin_dashboard/core/constants/app_constants.dart';
import 'package:admin_dashboard/core/constants/app_texts.dart';
import 'package:admin_dashboard/core/di/session_provider.dart';
import 'package:admin_dashboard/core/di/usecase_provider.dart';
import 'package:admin_dashboard/domain/entity/api_response.dart';
import 'package:admin_dashboard/domain/entity/post/post.dart';
import 'package:admin_dashboard/domain/entity/post/post_operation_response.dart';
import 'package:admin_dashboard/core/utils/utils.dart';
import 'package:admin_dashboard/core/common/dialog_helper.dart';

class PostDetailsWidget extends ConsumerWidget {
  PostDetailsWidget({this.post, super.key});

  final _formKey = GlobalKey<FormState>();
  final Post? post;
  String _enteredTitle = '';
  String _enteredDescription = '';
  String _enteredCoverImageUrl = '';
  String _enteredPostMobileUrl = "";
  String _enteredActive = "";
  String _enteredViewCount = "";

  TextEditingController dateInputController = TextEditingController();
  late WidgetRef _ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;
    return getPostForm(
        context, post, ref.read(sessionState.notifier).isSuperAdmin);
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    showConfirmationDialog(
        context: context,
        title: AppTexts.deletePost,
        message: AppTexts.deleteConfirmationMessage,
        positiveBtnText: AppTexts.delete,
        negativeBtnText: AppTexts.cancel,
        positiveAction: () {
          _deletePost(context);
        });
  }

  void _deletePost(BuildContext context) async {
    int id = post?.id ?? 0;
    LoadingDialog.show(context, AppTexts.deletePostMessage);
    final deletePostUseCase = _ref.read(deletePostUseCaseProvider);
    deletePostUseCase.setParam(id);
    ApiResponse apiResponse = await deletePostUseCase.execute();
    if (!context.mounted) {
      return;
    }

    LoadingDialog.hide(context);
    if (apiResponse is SuccessResponse) {
      PostOperationResponse response =
          (apiResponse as SuccessResponse<PostOperationResponse>).data;
      showSnackBar(context, response.message);
      Navigator.pop(context);
    } else {
      showSnackBar(context, (apiResponse as ErrorResponse).errorMessage);
    }
  }

  void _showSaveOrUpdateConfirmationDialog(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    showConfirmationDialog(
        context: context,
        title:
            "${post == null ? AppTexts.save : AppTexts.update} ${AppTexts.post}!",
        message:
            "Are you sure you want to ${post == null ? "save" : "update"} this post",
        positiveBtnText: post == null ? AppTexts.save : AppTexts.update,
        negativeBtnText: AppTexts.cancel,
        positiveAction: () {
          (post == null) ? _savePost(context) : _updatePost(context);
        });
  }

  void _savePost(BuildContext context) async {
    final newPost = Post(
      title: _enteredTitle,
      description: _enteredDescription,
      date: dateInputController.text,
      active: int.parse(_enteredActive),
      coverImageUrl: _enteredCoverImageUrl,
      postWebUrl: _enteredPostMobileUrl,
      postMobileUrl: _enteredPostMobileUrl,
      viewCount: int.parse(_enteredViewCount),
    );
    LoadingDialog.show(context, AppTexts.savingPostWait);
    final addPostUseCase = _ref.read(addPostUseCaseProvider);
    addPostUseCase.setParam(newPost);
    ApiResponse apiResponse = await addPostUseCase.execute();
    if (!context.mounted) {
      return;
    }

    LoadingDialog.hide(context);
    if (apiResponse is SuccessResponse) {
      PostOperationResponse response =
          (apiResponse as SuccessResponse<PostOperationResponse>).data;
      showSnackBar(context, response.message);
      _formKey.currentState?.reset();
    } else {
      showSnackBar(context, (apiResponse as ErrorResponse).errorMessage);
    }
  }

  void _updatePost(BuildContext context) async {
    final updatedPost = Post(
      id: post?.id,
      title: _enteredTitle,
      description: _enteredDescription,
      date: dateInputController.text,
      active: int.parse(_enteredActive),
      coverImageUrl: _enteredCoverImageUrl,
      postWebUrl: _enteredPostMobileUrl,
      postMobileUrl: _enteredPostMobileUrl,
      viewCount: int.parse(_enteredViewCount),
    );
    LoadingDialog.show(context, AppTexts.updatingPostWait);
    final updatePostUseCase = _ref.read(updatePostUseCaseProvider);
    updatePostUseCase.setParam(updatedPost);
    ApiResponse apiResponse = await updatePostUseCase.execute();
    if (!context.mounted) {
      return;
    }
    LoadingDialog.hide(context);
    if (apiResponse is SuccessResponse) {
      Navigator.of(context).pop(updatedPost);
    } else {
      showSnackBar(context, (apiResponse as ErrorResponse).errorMessage);
    }
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
      dateInputController.text = formattedDate;
    }
  }

  Widget getPostForm(
      BuildContext context, Post? post, bool shouldShowActionBtns) {
    dateInputController.text = post?.date ?? kEmptyString;
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Visibility(
              visible: (post != null),
              child: _getIDTextField(),
            ),
            add16VerticalSpace(),
            _getTitleTextField(),
            add16VerticalSpace(),
            _getDescriptionTextField(),
            add16VerticalSpace(),
            _getCoverImageUrlTextField(),
            add16VerticalSpace(),
            _getPostMobileUrlTextField(),
            add16VerticalSpace(),
            Row(
              children: [
                SizedBox(
                  width: 160,
                  height: 50,
                  child: _getDateField(context),
                ),
                add24HorizontalSpace(),
                SizedBox(
                  width: 70,
                  height: 50,
                  child: _getStatusField(),
                ),
                add24HorizontalSpace(),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: _getCountField(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (shouldShowActionBtns) _getActionButtons(context)
          ],
        ));
  }

  Widget _getIDTextField() {
    return TextFormField(
      initialValue: "${post?.id}",
      keyboardType: TextInputType.text,
      maxLength: 100,
      readOnly: true,
      style: inputFieldTextStyle,
      decoration: _getInputDecoration(AppTexts.id),
    );
  }

  Widget _getTitleTextField() {
    return TextFormField(
      initialValue: post?.title,
      keyboardType: TextInputType.text,
      maxLength: 100,
      style: inputFieldTextStyle,
      decoration: _getInputDecoration(AppTexts.title),
      validator:
          FormValidators.getLeastValueValidator(5, AppTexts.titleErrorMessage),
      onSaved: (value) {
        _enteredTitle = value!;
      },
    );
  }

  Widget _getDescriptionTextField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      initialValue: post?.description,
      maxLength: 500,
      maxLines: 3,
      style: inputFieldTextStyle,
      decoration: _getInputDecoration(AppTexts.description),
      validator: FormValidators.getLeastValueValidator(
          10, AppTexts.descriptionErrorMessage),
      onSaved: (value) => _enteredDescription = value!,
    );
  }

  Widget _getCoverImageUrlTextField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      initialValue: post?.coverImageUrl,
      maxLength: 500,
      style: inputFieldTextStyle,
      decoration: _getInputDecoration(AppTexts.coverImageUrl),
      validator: FormValidators.getLeastValueValidator(
          10, AppTexts.coverImageUrlErrorMessage),
      onSaved: (value) => _enteredCoverImageUrl = value!,
    );
  }

  Widget _getDateField(BuildContext context) {
    return TextFormField(
      onTap: () {
        _showDatePicker(context);
      },
      readOnly: true,
      controller: dateInputController,
      style: inputFieldTextStyle,
      decoration: const InputDecoration(
        fillColor: Colors.white,
        filled: true,
        suffixIcon: Icon(Icons.calendar_month_sharp),
        border: OutlineInputBorder(),
        label: Text(
          AppTexts.selectDate,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _getStatusField() {
    return TextFormField(
      onTap: () {},
      readOnly: false,
      initialValue: post != null ? post?.active.toString() : "1",
      style: inputFieldTextStyle,
      decoration: _getInputDecoration(AppTexts.active),
      validator: FormValidators.getEmptyValueValidator(
          AppTexts.activeStatusErrorMessage),
      onSaved: (value) => _enteredActive = value!,
    );
  }

  Widget _getCountField() {
    return TextFormField(
      onTap: () {},
      initialValue: post != null ? post?.viewCount.toString() : "0",
      style: const TextStyle(color: Colors.black, fontSize: 16),
      decoration: const InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(),
        label: Text(
          AppTexts.count,
          style: TextStyle(color: Colors.black87),
        ),
      ),
      validator:
          FormValidators.getEmptyValueValidator(AppTexts.countErrorMessage),
      onSaved: (value) => _enteredViewCount = value!,
    );
  }

  Widget _getPostMobileUrlTextField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      initialValue: post?.postMobileUrl,
      maxLength: 500,
      style: inputFieldTextStyle,
      decoration: _getInputDecoration(AppTexts.postMobileUrl),
      validator: FormValidators.getLeastValueValidator(
          10, AppTexts.postMobileUrlErrorMessage),
      onSaved: (value) => _enteredPostMobileUrl = value!,
    );
  }

  Widget _getActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (post != null) ...[
          _getButton(
            Colors.red,
            AppTexts.delete,
            () {
              _showDeleteConfirmationDialog(context);
            },
          ),
          add16HorizontalSpace()
        ],
        _getButton(Colors.black, post == null ? AppTexts.save : AppTexts.update,
            () {
          _showSaveOrUpdateConfirmationDialog(context);
        })
      ],
    );
  }

  var inputFieldTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );

  InputDecoration _getInputDecoration(String text) {
    return InputDecoration(
      fillColor: Colors.white, //const Color(0xffF6F8FB).withOpacity(0.5),
      filled: true,
      border: const OutlineInputBorder(),
      label: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _getButton(
      Color backgroundColor, String text, void Function() onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
