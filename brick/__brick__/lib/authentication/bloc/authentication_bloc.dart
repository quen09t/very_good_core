import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const AuthenticationState.unknown()) {
    on<UserAuthenticationStatusChanged>(_onUserAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    _userAuthenticationSubscription =
        _userRepository.userAuthenticationStatus.listen((status) {
      add(UserAuthenticationStatusChanged(status));
    });
  }

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  late StreamSubscription<UserAuthenticationStatus>
      _userAuthenticationSubscription;

  Future<void> _onUserAuthenticationStatusChanged(
    UserAuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    switch (event.userAuthenticationStatus) {
      case UserAuthenticationStatus.signedIn:
        final user = await _userRepository.getUser();
        return emit(AuthenticationState.authenticated(user));
      case UserAuthenticationStatus.signedOut:
        return emit(const AuthenticationState.unauthenticated());
      case UserAuthenticationStatus.unknown:
        return emit(const AuthenticationState.unauthenticated());
    }
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logOut();
  }

  @override
  Future<void> close() async {
    await _userAuthenticationSubscription.cancel();
    return super.close();
  }
}
