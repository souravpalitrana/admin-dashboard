import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/domain/entity/post/post.dart';
import 'package:admin_dashboard/presentation/feature/home/widgets/post_details_widget/post_details_widget.dart';

void showConfirmationDialog(
    {required BuildContext context,
    required String title,
    required String message,
    required String positiveBtnText,
    required String negativeBtnText,
    required void Function() positiveAction}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    animType: AnimType.rightSlide,
    width: 500,
    btnCancelText: negativeBtnText,
    btnOkText: positiveBtnText,
    title: title,
    desc: message,
    btnCancelOnPress: () => null,
    btnOkOnPress: () {
      positiveAction();
    },
  ).show();
}

void showInfoDialog(
    {required BuildContext context,
    required String title,
    required String message}) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.rightSlide,
    width: 500,
    btnOkText: "OK",
    title: title,
    desc: message,
    btnOkOnPress: () => null,
  ).show();
}

Future<Post?> showPostUpdateDialog(BuildContext context, Post post) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0xffF7FCFF),
        surfaceTintColor: Colors.transparent,
        contentTextStyle: const TextStyle(color: Colors.red),
        title: _addAlertDialogTitle(context),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        content: Builder(builder: (context) {
          var width = MediaQuery.of(context).size.width;
          var height = MediaQuery.of(context).size.height;
          var newWidth = width - width * .25;
          var newHeight = height > 700.0 ? 700.0 : height;
          return Container(
            height: newHeight,
            width: newWidth,
            padding:
                const EdgeInsets.only(left: 36, right: 36, top: 24, bottom: 24),
            child: _addDialogContent(post),
          );
        }),
      );
    },
  );
}

Widget _addAlertDialogTitle(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Edit or Delete Post',
        style: TextStyle(color: Colors.grey),
      ),
      FloatingActionButton.small(
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.close,
          size: 24,
          color: Colors.grey,
        ),
      )
    ],
  );
}

Widget _addDialogContent(Post post) {
  return SingleChildScrollView(
    child: PostDetailsWidget(
      post: post,
    ),
  );
}
