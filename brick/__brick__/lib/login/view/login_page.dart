import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/l10n/l10n.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/login/bloc/login_bloc.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/login/view/view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  static Route<LoginPage> route() {
    return MaterialPageRoute<LoginPage>(
      builder: (_) => const LoginPage(),
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
                l10n.loginLinkActionText,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              BlocProvider(
                create: (context) => LoginBloc(
                  authenticationRepository:
                      context.read<AuthenticationRepository>(),
                ),
                child: const LoginForm(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
