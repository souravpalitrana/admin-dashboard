import 'package:flutter_riverpod/flutter_riverpod.dart';

enum DashboardMenu {
  home("Home"),
  allPost('All Post'),
  addPost('AddPost');

  const DashboardMenu(this._text);

  final String _text;

  @override
  String toString() => _text;
}
