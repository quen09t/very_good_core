import 'dart:convert' as convert;

import 'package:{{api_client_name}}_client/responses/responses.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fresh/fresh.dart';


class {{api_client_name.pascalCase()}}ClientStorage implements TokenStorage<Authentication> {
  final storage = const FlutterSecureStorage();

  @override
  Future<void> delete() async {
    await storage.deleteAll();
  }

  @override
  Future<Authentication?> read() async {
    final token = await storage.read(key: 'token');

    if (token?.isNotEmpty ?? false) {
      return Authentication.fromJson(
        convert.jsonDecode(token!) as Map<String, dynamic>,
      );
    }

    return null;
  }

  @override
  Future<void> write(Authentication token) async {
    await storage.write(
      key: 'token',
      value: convert.jsonEncode(
        token.toJson(),
      ),
    );
  }
}
