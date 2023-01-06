// Flutter imports:
// Project imports:
import 'package:commands/components/components.dart';
import 'package:flutter/material.dart';

class ElevateButtonLoadingCustom extends StatelessWidget {
  const ElevateButtonLoadingCustom({
    Key? key,
    this.onPressed,
    this.isLoader,
    this.title,
  }) : super(key: key);

  final Function()? onPressed;
  final bool? isLoader;
  final String? title;
  f() {
    Future.delayed(const Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: isLoader!
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(),
            )
          : Text(
              title!,
              style: TextStyle(fontSize: Components.width(context) / 16),
            ),
    );
  }
}
