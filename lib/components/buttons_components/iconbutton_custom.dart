// Flutter imports:
// Project imports:
import 'package:commands/components/components.dart';
import 'package:flutter/material.dart';

class IconButtomCustom extends StatelessWidget {
  const IconButtomCustom({
    Key? key,
    this.onPressed,
    this.icon,
    this.color,
  }) : super(key: key);

  final Function()? onPressed;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color,
        size: Components.width(context) / 010,
      ),
    );
  }
}
