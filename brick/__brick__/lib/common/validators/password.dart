import 'package:formz/formz.dart';

enum PasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure([String value = '']) : super.pure(value);
  const Password.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegex = RegExp(
    '^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#%^&?;/*])(?=.{8,})',
  );

  @override
  PasswordValidationError? validator(String? value) {
    return _passwordRegex.hasMatch(value ?? '')
        ? null
        : PasswordValidationError.invalid;
  }
}
