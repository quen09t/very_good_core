import 'dart:async';

import 'package:{{api_client_name}}_client/{{api_client_name}}_client.dart';

enum UserAuthenticationStatus {
  unknown,
  signedIn,
  signedOut,
}

class UserRepository {
  UserRepository({
  {{#pascalCase}}{{api_client_name}}{{/pascalCase}}Client? {{#camelCase}}{{api_client_name}}{{/camelCase}}Client,
  }) : _{{#camelCase}}{{api_client_name}}{{/camelCase}}Client = {{#camelCase}}{{api_client_name}}{{/camelCase}}Client ?? {{#pascalCase}}{{api_client_name}}{{/pascalCase}}Client();

  final {{#pascalCase}}{{api_client_name}}{{/pascalCase}}Client _{{#camelCase}}{{api_client_name}}{{/camelCase}}Client;

  Stream<UserAuthenticationStatus> get userAuthenticationStatus {
    return  _{{#camelCase}}{{api_client_name}}{{/camelCase}}Client.authenticationStatus.map((status) {
      switch (status) {
        case AuthenticationStatus.authenticated:
          return UserAuthenticationStatus.signedIn;
        case AuthenticationStatus.unauthenticated:
          return UserAuthenticationStatus.signedOut;
        case AuthenticationStatus.initial:
        // ignore: no_default_cases
        default:
          return UserAuthenticationStatus.unknown;
      }
    });
  }

  Future<User?> getUser() async {
    try {
      return _{{#camelCase}}{{api_client_name}}{{/camelCase}}Client.getUser();
    } catch (e) {
      return null;
    }
  }

  Future<void> resetPassword({
    required String email,
  }) async {
    await _{{#camelCase}}{{api_client_name}}{{/camelCase}}Client.resetPassword(email: email);
  }
}
