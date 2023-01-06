import 'package:flutter/material.dart';

class ButtonActionLists extends StatelessWidget {
  const ButtonActionLists({
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
      ),
    );
  }
}
