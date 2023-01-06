// Flutter imports:
// Project imports:
import 'package:commands/components/components.dart';
import 'package:flutter/material.dart';

class GestureButtonCustom extends StatelessWidget {
  const GestureButtonCustom(
      {super.key, this.onTap, this.title, this.textColor});

  final Function()? onTap;
  final String? title;
  final String? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: onTap,
        child: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                  text: title!,
                  style: TextStyle(
                    fontSize: Components.width(context) / 22,
                  )),
              TextSpan(
                  text: textColor,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Components.width(context) / 22,
                      color: Colors.orange)),
            ],
          ),
        ),
      ),
    );
  }
}
