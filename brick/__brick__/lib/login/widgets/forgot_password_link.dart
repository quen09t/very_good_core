import 'package:flutter/material.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/l10n/l10n.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/reset_password/view/view.dart';

class ForgotPasswordLink extends StatelessWidget {
  const ForgotPasswordLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return GestureDetector(
      key: const Key('loginForgotPasswordLink'),
      onTap: () {
        Navigator.push(
          context,
          ResetPasswordPage.route(),
        );
      },
      child: Text(
        l10n.forgotPasswordLinkText,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
