import 'package:formz/formz.dart';

enum PhoneInputError {
  invalid,
}

class Phone extends FormzInput<String, PhoneInputError> {
  const Phone.pure() : super.pure('');
  const Phone.dirty([String value = '']) : super.dirty(value);

  @override
  PhoneInputError? validator(String value) {
    final phoneRegex = RegExp(r'^\d{10}$');
    if (!phoneRegex.hasMatch(value)) {
      return PhoneInputError.invalid;
    }
    return null;
  }
}

enum PasswordInputError {
  invalid,
}

class Password extends FormzInput<String, PasswordInputError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordInputError? validator(String value) {
    if (value.length < 8) {
      return PasswordInputError.invalid;
    }
    return null;
  }
}
