import 'dart:async';

import 'package:{{api_client_name}}_client/{{api_client_name}}_client.dart';

class AuthenticationRepository {
  AuthenticationRepository({
  {{#pascalCase}}{{api_client_name}}{{/pascalCase}}Client? {{#camelCase}}{{api_client_name}}{{/camelCase}}Client,
  }) : _{{#camelCase}}{{api_client_name}}{{/camelCase}}Client = {{#camelCase}}{{api_client_name}}{{/camelCase}}Client ?? {{#pascalCase}}{{api_client_name}}{{/pascalCase}}Client();

  final {{#pascalCase}}{{api_client_name}}{{/pascalCase}}Client _{{#camelCase}}{{api_client_name}}{{/camelCase}}Client;

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    return _{{#camelCase}}{{api_client_name}}{{/camelCase}}Client.logIn(
      email: email,
      password: password,
    );
  }

  Future<void> logOut() async {
    return _{{#camelCase}}{{api_client_name}}{{/camelCase}}Client.logOut();
  }
}
