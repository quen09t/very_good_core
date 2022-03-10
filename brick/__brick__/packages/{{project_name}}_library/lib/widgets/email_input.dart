import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    Key? key,
    required this.onChanged,
    this.errorText,
    this.initialValue,
  }) : super(key: key);

  final void Function(String) onChanged;
  final String? errorText;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
      style: const TextStyle(fontWeight: FontWeight.normal),
      decoration: InputDecoration(
        icon: const Icon(
          Icons.email,
        ),
        hintText: 'Email*',
        errorText: errorText,
      ),
    );
  }
}
