import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    Key? key,
    required this.onChanged,
    this.errorText,
    this.initialValue,
    this.inputKey,
  }) : super(key: key);

  final void Function(String) onChanged;
  final String? errorText;
  final String? initialValue;
  final Key? inputKey;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: inputKey,
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
