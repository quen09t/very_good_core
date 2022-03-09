import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/authentication/bloc/authentication_bloc.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<AuthenticationBloc>().add(
            AuthenticationLogoutRequested(),
          ),
      child: const Text('Disconnect'),
    );
  }
}
