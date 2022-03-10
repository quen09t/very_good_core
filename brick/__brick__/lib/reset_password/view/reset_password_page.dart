import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/l10n/l10n.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/reset_password/bloc/reset_password_bloc.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/reset_password/view/view.dart';
import 'package:user_repository/user_repository.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({
    Key? key,
  }) : super(key: key);

  static Route<ResetPasswordPage> route() {
    return MaterialPageRoute<ResetPasswordPage>(
      builder: (_) => const ResetPasswordPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                l10n.forgotPasswordLinkText,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                l10n.forgotPasswordDescription,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              BlocProvider(
                create: (context) {
                  return ResetPasswordBloc(
                    userRepository: context.read<UserRepository>(),
                  );
                },
                child: const ResetPasswordForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
