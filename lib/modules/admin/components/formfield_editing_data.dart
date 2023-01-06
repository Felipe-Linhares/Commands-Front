import 'package:flutter/material.dart';

class DataEditingFormField extends StatelessWidget {
  const DataEditingFormField({
    Key? key,
    this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.labelText,
  }) : super(key: key);

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        // validator: validator,
        maxLength: 50,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
