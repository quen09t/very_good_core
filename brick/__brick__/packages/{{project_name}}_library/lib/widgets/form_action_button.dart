import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class FormActionButton extends StatelessWidget {
  const FormActionButton({
    Key? key,
    required this.actionText,
    required this.status,
    required this.onPressed,
  }) : super(key: key);

  final String actionText;
  final FormzStatus status;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          onSurface: Colors.blue,
          primary: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: status.isValid ? onPressed : null,
        child: status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : Text(
                actionText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
      ),
    );
  }
}
