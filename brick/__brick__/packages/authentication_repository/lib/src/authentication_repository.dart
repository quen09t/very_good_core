import 'dart:async';

import 'package:{{api_client_name}}_client/{{api_client_name}}_client.dart';

class AuthenticationRepository {
  AuthenticationRepository({
  {{api_client_name.pascalCase()}}Client? {{api_client_name.camelCase()}}Client,
  }) : _{{api_client_name.camelCase()}}Client = {{api_client_name.camelCase()}}Client ?? {{api_client_name.pascalCase()}}Client();

  final {{api_client_name.pascalCase()}}Client _{{api_client_name.camelCase()}}Client;

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    return _{{api_client_name.camelCase()}}Client.logIn(
      email: email,
      password: password,
    );
  }

  Future logOut() async {
    return _{{api_client_name.camelCase()}}Client.logOut();
  }
}
