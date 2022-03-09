part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class UserAuthenticationStatusChanged extends AuthenticationEvent {
  const UserAuthenticationStatusChanged(this.userAuthenticationStatus);

  final UserAuthenticationStatus userAuthenticationStatus;

  @override
  List<Object> get props => [userAuthenticationStatus];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}
