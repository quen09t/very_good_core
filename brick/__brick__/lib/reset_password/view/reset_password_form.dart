import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/l10n/l10n.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/login/login.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/reset_password/bloc/reset_password_bloc.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/reset_password/widgets/login_link.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}_library/widgets/widgets.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocListener<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  l10n.forgotPasswordApiError,
                ),
              ),
            );
        }
        if (state.status.isSubmissionSuccess) {
          Navigator.push(context, LoginPage.route());
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  l10n.forgotPasswordApiSuccess,
                ),
              ),
            );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
            buildWhen: (previous, current) => previous.email != current.email,
            builder: (context, state) {
              return EmailInput(
                onChanged: (email) => context.read<ResetPasswordBloc>().add(
                      ResetPasswordEmailChanged(email.trim()),
                    ),
                errorText: state.email.invalid ? l10n.emailRequired : null,
              );
            },
          ),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
            builder: (context, state) {
              return FormActionButton(
                actionText: l10n.forgotPasswordButtonText,
                status: state.status,
                onPressed: () => context.read<ResetPasswordBloc>().add(
                      const ResetPasswordSubmitted(),
                    ),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          const LoginLink()
        ],
      ),
    );
  }
}
