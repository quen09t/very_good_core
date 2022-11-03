import 'dart:convert' as convert;

import 'package:{{api_client_name}}_client/models/models.dart';
import 'package:{{api_client_name}}_client/responses/responses.dart';
import 'package:{{api_client_name}}_client/src/{{api_client_name}}_client_storage.dart';
import 'package:dio/dio.dart';
import 'package:fresh_dio/fresh_dio.dart';


class {{api_client_name.pascalCase()}}Client {
  {{api_client_name.pascalCase()}}Client({Dio? httpClient})
      : _httpClient = (httpClient ?? Dio())
          ..options.baseUrl = '{{{api_url}}}'
          ..interceptors.add(_fresh)
          ..interceptors.add(LogInterceptor(
            request: false,
            responseHeader: false,
          ),);


  static final _fresh = Fresh<Authentication>(
    refreshToken: (token, client) async {
      try { 

        return await CodebudsClient().refreshToken(token!.refreshToken);

      } catch (e) {
        throw RevokeTokenException();
      }
    },
    tokenStorage: {{api_client_name.pascalCase()}}ClientStorage(),
    tokenHeader: (token) {
      return {
        'Authorization':'{{#is_bearer?}}Bearer{{/is_bearer?}} ${token.accessToken}',
      };
    },
    shouldRefresh: (response) {
      return response?.statusCode == 401 &&
          response?.requestOptions.path != '{{{refresh_token_endpoint}}}';
    },
  );

  final Dio _httpClient;

  Stream<AuthenticationStatus> get authenticationStatus =>
      _fresh.authenticationStatus;

  Future logIn({
    required String email,
    required String password,
  }) async {
    final response = await _httpClient.post<Map<String, dynamic>>(
      '{{{login_endpoint}}}',
      data: convert.jsonEncode(
        {'email': email, 'password': password,},
      ),
    );

    final body = Authentication.fromJson(response.data!);

    await _fresh.setToken(
      Authentication(
        accessToken: body.accessToken,
        refreshToken: body.refreshToken,
      ),
    );
  }

  Future<Authentication> refreshToken(String refreshToken) async {
      final response = await _httpClient.post<Map<String, dynamic>>(
      '{{{refresh_token_endpoint}}}',
      data: convert.jsonEncode({'refreshToken': refreshToken}),
    );
    return Authentication.fromJson(response.data!);
  }

  Future logOut() async {
    return _fresh.clearToken();
  }

  Future<User> getUser() async {
    final response = await _httpClient.get<Map<String, dynamic>>(
      '{{{get_user_endpoint}}}',
    );

    return User.fromJson(response.data!);
  }


  Future<void> resetPassword({
    required String email,
  }) async {
    await _httpClient.put<Map<String, dynamic>>(
      '{{{forgot_password_endpoint}}}',
      data: convert.jsonEncode({'email': email}),
    );
  }

}
