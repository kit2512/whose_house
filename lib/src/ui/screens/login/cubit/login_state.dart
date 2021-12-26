part of 'login_cubit.dart';

class LoginState extends Equatable {
  final Phone phone;
  final Password password;
  final String? errorMessage;
  final FormzStatus status;

  const LoginState({
    this.phone = const Phone.pure(),
    this.password = const Password.pure(),
    this.errorMessage,
    this.status = FormzStatus.pure,
  });

  LoginState copyWith({
    Phone? phone,
    Password? password,
    String? errorMessage,
    FormzStatus? status,
  }) =>
      LoginState(
        phone: phone ?? this.phone,
        password: password ?? this.password,
        errorMessage: errorMessage ?? this.errorMessage,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [phone, password, errorMessage, status];
}
