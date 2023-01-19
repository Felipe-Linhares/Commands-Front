// Flutter imports:
import 'package:flutter/material.dart';

class DividerCustom extends StatelessWidget {
  const DividerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 10,
      color: Colors.orange,
      thickness: 2,
    );
  }
}
