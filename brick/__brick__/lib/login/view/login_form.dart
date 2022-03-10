import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/l10n/l10n.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/login/bloc/login_bloc.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/login/widgets/forgot_password_link.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}_library/widgets/widgets.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _EmailInput(),
        SizedBox(
          height: 20,
        ),
        _PasswordInput(),
        SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ForgotPasswordLink(),
        ),
        SizedBox(
          height: 20,
        ),
        _FormActionButton(),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class _FormActionButton extends StatelessWidget {
  const _FormActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final status = context.watch<LoginBloc>().state.status;

    return FormActionButton(
      actionText: l10n.loginLinkActionText,
      status: status,
      onPressed: () => context.read<LoginBloc>().add(const LoginSubmitted()),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final email = context.select((LoginBloc bloc) => bloc.state.email);
    return EmailInput(
      initialValue: email.value,
      onChanged: (newEmail) => context.read<LoginBloc>().add(
            LoginEmailChanged(email: newEmail.trim()),
          ),
      errorText: email.invalid ? 'Invalid email' : null,
    );
  }
}

class _PasswordInput extends StatefulWidget {
  const _PasswordInput({
    Key? key,
  }) : super(key: key);

  @override
  PasswordInputState createState() => PasswordInputState();
}

class PasswordInputState extends State<_PasswordInput> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (password) => context.read<LoginBloc>().add(
            LoginPasswordChanged(password: password),
          ),
      obscureText: _obscureText,
      style: const TextStyle(fontWeight: FontWeight.normal),
      decoration: InputDecoration(
        icon: const Icon(
          Icons.lock,
        ),
        hintText: 'Password*',
        suffixIcon: InkWell(
          onTap: _toggle,
          child: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      ),
    );
  }
}
