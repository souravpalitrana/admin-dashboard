import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:admin_dashboard/core/constants/app_texts.dart';
import 'package:admin_dashboard/domain/entity/post/post.dart';
import 'package:admin_dashboard/core/common/dialog_helper.dart';
import 'package:admin_dashboard/core/utils/utils.dart';

class PostListWidget extends ConsumerStatefulWidget {
  const PostListWidget({super.key, this.allPost});

  final List<Post>? allPost;

  @override
  ConsumerState<PostListWidget> createState() => _PostListWidgetState();
}

class _PostListWidgetState extends ConsumerState<PostListWidget> {
  final List<Post> _filteredPost = [];
  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isEmpty) {
        setState(() {
          _filteredPost.clear();
          _filteredPost.addAll(widget.allPost!);
        });
        return;
      }
      final List<Post> searchedItems = [];
      for (Post post in _filteredPost) {
        if (post.title.contains(query) ||
            post.description.contains(query) ||
            post.date.contains(query)) {
          searchedItems.add(post);
        }
      }

      setState(() {
        _filteredPost.clear();
        _filteredPost.addAll(searchedItems);
      });
    });
  }

  void _openEditPostDialog(context, Post post, int index) async {
    Post? updatedPost = await showPostUpdateDialog(context, post);
    if (updatedPost != null) {
      showSnackBar(context, 'Post "${updatedPost.title}" has been updated');
      setState(() {
        _filteredPost[index] = updatedPost;
      });
    }
  }

  Widget getNoPostWidget() {
    return const Center(
      child: Text(
        AppTexts.noPostAvailable,
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
      ),
    );
  }

  Widget getPostListWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        getSearchBar(),
        getListHeader(),
        getListContent(context),
      ],
    );
  }

  Widget getSearchBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: TextFormField(
        keyboardType: TextInputType.text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
        decoration: InputDecoration(
          fillColor: const Color(0xffF6F8FB).withOpacity(0.5),
          filled: true,
          border: const OutlineInputBorder(),
          label: const Text(
            AppTexts.postFilterHints,
            style: TextStyle(color: Colors.black),
          ),
        ),
        onChanged: (value) {
          _onSearchChanged(value);
        },
      ),
    );
  }

  Widget getListHeader() {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          getTableColumnTitle(1, AppTexts.id),
          getTableColumnTitle(4, AppTexts.title),
          getTableColumnTitle(4, AppTexts.description),
          getTableColumnTitle(2, AppTexts.date),
          getTableColumnTitle(3, AppTexts.coverImageUrl),
          getTableColumnTitle(3, AppTexts.postMobileUrl),
        ],
      ),
    );
  }

  Widget getListContent(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _filteredPost.length,
        itemBuilder: (ctx, index) => getListItem(context, index),
      ),
    );
  }

  Widget getListItem(BuildContext context, int index) {
    Post post = _filteredPost[index];
    bool isOdd = index % 2 != 0;
    return InkWell(
      onDoubleTap: () {
        _openEditPostDialog(context, _filteredPost[index], index);
      },
      child: SizedBox(
        child: Row(
          children: [
            getCellContent(1, post.id.toString(), isOdd),
            getCellContent(4, post.title, isOdd),
            getCellContent(4, post.description, isOdd),
            getCellContent(2, post.date, isOdd),
            getCellContent(3, post.coverImageUrl, isOdd),
            getCellContent(3, post.postMobileUrl, isOdd),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget content;
    if (widget.allPost == null || widget.allPost!.isEmpty) {
      content = getNoPostWidget();
    } else if (widget.allPost != null && _filteredPost.isEmpty) {
      _filteredPost.clear();
      _filteredPost.addAll(widget.allPost ?? []);
      content = getPostListWidget(context);
    } else {
      content = getPostListWidget(context);
    }

    return Expanded(
      child: SizedBox(
        height: double.infinity,
        child: content,
      ),
    );
  }

  Widget getTableColumnTitle(int flex, String title) {
    return Expanded(
      flex: flex,
      child: Container(
        height: 56,
        decoration: getCellBorderDecoration(),
        child: getHeaderTitle(title),
      ),
    );
  }

  BoxDecoration getCellBorderDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.grey.withOpacity(0.5),
        width: 1,
      ),
    );
  }

  Widget getHeaderTitle(String title) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
      ),
    );
  }

  Widget getCellContent(int flex, String value, bool isOdd) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 56,
        decoration: BoxDecoration(
          color: isOdd ? Colors.white : Colors.black.withOpacity(0.05),
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            value,
            maxLines: 2,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
