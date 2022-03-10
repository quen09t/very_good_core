part of 'reset_password_bloc.dart';

class ResetPasswordState extends Equatable {
  const ResetPasswordState({
    this.status = FormzStatus.pure,
    this.email = const Email.pure(),
  });

  final FormzStatus status;
  final Email email;

  ResetPasswordState copyWith({
    FormzStatus? status,
    Email? email,
  }) {
    return ResetPasswordState(
      status: status ?? this.status,
      email: email ?? this.email,
    );
  }

  @override
  List<Object> get props => [status, email];
}
