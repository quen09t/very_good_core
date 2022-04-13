// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name.snakeCase()}}/reset_password/reset_password.dart';

void main() {
  const email = 'contact@codebuds.com';
  group('ResetPasswordEvent', () {
    group('ResetPasswordEmailChanged', () {
      test('supports value comparisons', () {
        expect(
          ResetPasswordEmailChanged(email),
          ResetPasswordEmailChanged(email),
        );
      });
    });

    group('ResetPasswordSubmitted', () {
      test('supports value comparisons', () {
        expect(ResetPasswordSubmitted(), ResetPasswordSubmitted());
      });
    });
  });
}
