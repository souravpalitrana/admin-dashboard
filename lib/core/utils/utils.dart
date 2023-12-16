import 'dart:io';
import 'package:flutter/material.dart';

bool isMobileView() {
  return Platform.isAndroid || Platform.isIOS;
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

Widget add8VerticalSpace() {
  return const SizedBox(height: 8,);
}

Widget add16VerticalSpace() {
  return const SizedBox(height: 16,);
}

Widget add24VerticalSpace() {
  return const SizedBox(height:24,);
}

Widget add32VerticalSpace() {
  return const SizedBox(height: 32,);
}

Widget add36VerticalSpace() {
  return const SizedBox(height: 36,);
}

Widget add64VerticalSpace() {
  return const SizedBox(height:64,);
}

Widget add8HorizontalSpace() {
  return const SizedBox(width: 8,);
}

Widget add16HorizontalSpace() {
  return const SizedBox(width: 16,);
}

Widget add24HorizontalSpace() {
  return const SizedBox(width:24,);
}

Widget add32HorizontalSpace() {
  return const SizedBox(width: 32,);
}

Widget add36HorizontalSpace() {
  return const SizedBox(width: 36,);
}

Widget add64HorizontalSpace() {
  return const SizedBox(width:64,);
}


