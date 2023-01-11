import 'package:commands/components/components.dart';
import 'package:flutter/material.dart';

class TextViewCustom extends StatelessWidget {
  const TextViewCustom({
    Key? key,
    this.title,
    this.fontSize,
  }) : super(key: key);

  final String? title;
  final int? fontSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Text(
        '$title',
        // textAlign: TextAlign.center,
        style: TextStyle(fontSize: Components.width(context) / fontSize),
      ),
    );
  }
}
