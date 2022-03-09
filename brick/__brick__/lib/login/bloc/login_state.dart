part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.email = const Email.pure(),
    this.password = const InputString.pure(),
  });

  final FormzStatus status;
  final Email email;
  final InputString password;

  LoginState copyWith({
    FormzStatus? status,
    Email? email,
    InputString? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, email, password];
}
