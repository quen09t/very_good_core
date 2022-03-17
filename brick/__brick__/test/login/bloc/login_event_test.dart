// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/login/bloc/login_bloc.dart';

void main() {
  const email = 'mock-email';
  const password = 'mock-password';
  group('LoginEvent', () {
    group('LoginEmailChanged', () {
      test('supports value comparisons', () {
        expect(
          LoginEmailChanged(email: email),
          LoginEmailChanged(email: email),
        );
      });
    });

    group('LoginPasswordChanged', () {
      test('supports value comparisons', () {
        expect(
          LoginPasswordChanged(password: password),
          LoginPasswordChanged(password: password),
        );
      });
    });

    group('LoginSubmitted', () {
      test('supports value comparisons', () {
        expect(LoginSubmitted(), LoginSubmitted());
      });
    });
  });
}
