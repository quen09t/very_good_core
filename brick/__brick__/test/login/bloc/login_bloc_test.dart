import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/login/bloc/login_bloc.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}_library/validators/validators.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late AuthenticationRepository authenticationRepository;

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
  });

  group('LoginBloc', () {
    test('initial state is LoginState', () {
      final loginBloc = LoginBloc(
        authenticationRepository: authenticationRepository,
      );
      expect(loginBloc.state, const LoginState());
    });

    group('LoginSubmitted', () {
      blocTest<LoginBloc, LoginState>(
        'emits [submissionInProgress, submissionSuccess] '
        'when login succeeds',
        setUp: () {
          when(
            () => authenticationRepository.logIn(
              email: 'contact@codebuds.com',
              password: 'password',
            ),
          ).thenAnswer(
            (_) => Future.value('user'),
          );
        },
        build: () => LoginBloc(
          authenticationRepository: authenticationRepository,
        ),
        act: (bloc) {
          bloc
            ..add(const LoginEmailChanged(email: 'contact@codebuds.com'))
            ..add(const LoginPasswordChanged(password: 'password'))
            ..add(const LoginSubmitted());
        },
        expect: () => const <LoginState>[
          LoginState(
            email: Email.dirty('contact@codebuds.com'),
            status: FormzStatus.invalid,
          ),
          LoginState(
            email: Email.dirty('contact@codebuds.com'),
            password: InputString.dirty('password'),
            status: FormzStatus.valid,
          ),
          LoginState(
            email: Email.dirty('contact@codebuds.com'),
            password: InputString.dirty('password'),
            status: FormzStatus.submissionInProgress,
          ),
          LoginState(
            email: Email.dirty('contact@codebuds.com'),
            password: InputString.dirty('password'),
            status: FormzStatus.submissionSuccess,
          ),
        ],
      );

      blocTest<LoginBloc, LoginState>(
        'emits [LoginInProgress, LoginFailure] when logIn fails',
        setUp: () {
          when(
            () => authenticationRepository.logIn(
              email: 'contact@codebuds.com',
              password: 'password',
            ),
          ).thenThrow(Exception('oops'));
        },
        build: () => LoginBloc(
          authenticationRepository: authenticationRepository,
        ),
        act: (bloc) {
          bloc
            ..add(const LoginEmailChanged(email: 'contact@codebuds.com'))
            ..add(const LoginPasswordChanged(password: 'password'))
            ..add(const LoginSubmitted());
        },
        expect: () => const <LoginState>[
          LoginState(
            email: Email.dirty('contact@codebuds.com'),
            status: FormzStatus.invalid,
          ),
          LoginState(
            email: Email.dirty('contact@codebuds.com'),
            password: InputString.dirty('password'),
            status: FormzStatus.valid,
          ),
          LoginState(
            email: Email.dirty('contact@codebuds.com'),
            password: InputString.dirty('password'),
            status: FormzStatus.submissionInProgress,
          ),
          LoginState(
            email: Email.dirty('contact@codebuds.com'),
            password: InputString.dirty('password'),
            status: FormzStatus.submissionFailure,
          ),
        ],
      );
    });
  });
}
