// Flutter imports:
import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {
  const CardCustom({
    Key? key,
    this.link,
    this.title,
    this.price,
  }) : super(key: key);
  final String? link;
  final String? title;
  final double? price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: Card(
            color: Colors.grey.shade200,
            elevation: 3,
            child: Image.network(
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                link!),
          ),
        ),
        Column(
          children: const [
            Text('sa'),
          ],
        ),
      ],
    );
  }
}
