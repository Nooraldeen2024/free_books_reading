import 'package:flutter/material.dart';
import 'package:free_books_reading/core/utils/style.dart';

class CustomErroWidget extends StatelessWidget {
  const CustomErroWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Text(errMessage, style: Styles.txtStyle18);
  }
}
