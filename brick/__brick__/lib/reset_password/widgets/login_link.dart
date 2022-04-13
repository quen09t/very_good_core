import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/l10n/l10n.dart';
import 'package:{{project_name.snakeCase()}}/login/view/login_page.dart';

class LoginLink extends StatelessWidget {
  const LoginLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(l10n.loginLinkText),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          key: const Key('forgotPasswordLoginLink'),
          child: Text(
            l10n.loginLinkActionText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          onTap: () => Navigator.push(context, LoginPage.route()),
        ),
      ],
    );
  }
}
