// Flutter imports:
// Project imports:
import 'package:commands/components/components.dart';
import 'package:flutter/material.dart';

class ElevateButtonCustom extends StatelessWidget {
  const ElevateButtonCustom({
    Key? key,
    this.onPressed,
    this.title,
    required this.width,
  }) : super(key: key);

  final Function()? onPressed;
  final String? title;
  final int width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: onPressed,
        child: SizedBox(
          width: Components.width(context) / width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title!,
                style: TextStyle(fontSize: Components.width(context) / 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
