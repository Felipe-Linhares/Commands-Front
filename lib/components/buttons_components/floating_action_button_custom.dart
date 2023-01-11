import 'package:flutter/material.dart';

class FloatingActionButtomCustom extends StatelessWidget {
  const FloatingActionButtomCustom({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
