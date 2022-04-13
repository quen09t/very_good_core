// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:{{project_name.snakeCase()}}/reset_password/reset_password.dart';
import 'package:{{project_name.snakeCase()}}_library/validators/validators.dart';

void main() {
  const email = Email.dirty('email@toto.fr');
  group('Reset password state', () {
    test('supports value comparisons', () {
      expect(ResetPasswordState(), ResetPasswordState());
    });

    test('returns same object when no properties are passed', () {
      expect(ResetPasswordState().copyWith(), ResetPasswordState());
    });

    test('returns object with updated status when status is passed', () {
      expect(
        ResetPasswordState().copyWith(status: FormzStatus.pure),
        ResetPasswordState(),
      );
    });

    test('returns object with updated email when email is passed', () {
      expect(
        ResetPasswordState().copyWith(email: email),
        ResetPasswordState(email: email),
      );
    });
  });
}
