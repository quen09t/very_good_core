import 'package:formz/formz.dart';

enum InputStringValidationError { empty }

class InputString extends FormzInput<String, InputStringValidationError> {
  const InputString.pure([String value = '']) : super.pure(value);
  const InputString.dirty([String value = '']) : super.dirty(value);

  @override
  InputStringValidationError? validator(String? value) {
    return value?.isNotEmpty ?? false ? null : InputStringValidationError.empty;
  }
}
