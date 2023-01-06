// Flutter imports:
import 'package:flutter/material.dart';

class FormFieldCustom extends StatelessWidget {
  const FormFieldCustom(
      {Key? key,
      this.controller,
      this.osbcured,
      this.textInputType,
      this.prefixIcon,
      this.labelText,
      // this.onChanged,
      this.validator})
      : super(key: key);

  final TextEditingController? controller;
  final bool? osbcured;
  final TextInputType? textInputType;
  final IconData? prefixIcon;
  final String? labelText;
  // final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        // onChanged: onChanged,
        obscureText: osbcured!,
        keyboardType: textInputType,
        validator: validator,
        maxLength: 50,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          labelText: labelText!,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
