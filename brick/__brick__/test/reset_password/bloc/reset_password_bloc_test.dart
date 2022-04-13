import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{project_name.snakeCase()}}/reset_password/reset_password.dart';
import 'package:{{project_name.snakeCase()}}_library/validators/validators.dart';
import 'package:user_repository/user_repository.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late UserRepository userRepository;

  setUp(() {
    userRepository = MockUserRepository();
  });

  group('ResetPasswordBloc', () {
    test('initial state is ResetPasswordState', () {
      final resetPasswordBloc = ResetPasswordBloc(
        userRepository: userRepository,
      );
      expect(resetPasswordBloc.state, const ResetPasswordState());
    });

    group('ResetPasswordSubmitted', () {
      blocTest<ResetPasswordBloc, ResetPasswordState>(
        'emits [submissionInProgress, submissionSuccess] '
        'when reset password succeeds',
        setUp: () {
          when(
            () => userRepository.resetPassword(
              email: 'contact@codebuds.com',
            ),
          ).thenAnswer(
            (_) => Future.value(),
          );
        },
        build: () => ResetPasswordBloc(
          userRepository: userRepository,
        ),
        act: (bloc) {
          bloc
            ..add(const ResetPasswordEmailChanged('contact@codebuds.com'))
            ..add(const ResetPasswordSubmitted());
        },
        expect: () => const <ResetPasswordState>[
          ResetPasswordState(
            email: Email.dirty('contact@codebuds.com'),
            status: FormzStatus.valid,
          ),
          ResetPasswordState(
            email: Email.dirty('contact@codebuds.com'),
            status: FormzStatus.submissionInProgress,
          ),
          ResetPasswordState(
            email: Email.dirty('contact@codebuds.com'),
            status: FormzStatus.submissionSuccess,
          ),
        ],
      );

      blocTest<ResetPasswordBloc, ResetPasswordState>(
        'emits [submissionInProgress, submissionFailure] when logIn fails',
        setUp: () {
          when(
            () => userRepository.resetPassword(
              email: 'contact@codebuds.com',
            ),
          ).thenThrow(Exception('oops'));
        },
        build: () => ResetPasswordBloc(
          userRepository: userRepository,
        ),
        act: (bloc) {
          bloc
            ..add(const ResetPasswordEmailChanged('contact@codebuds.com'))
            ..add(const ResetPasswordSubmitted());
        },
        expect: () => const <ResetPasswordState>[
          ResetPasswordState(
            email: Email.dirty('contact@codebuds.com'),
            status: FormzStatus.valid,
          ),
          ResetPasswordState(
            email: Email.dirty('contact@codebuds.com'),
            status: FormzStatus.submissionInProgress,
          ),
          ResetPasswordState(
            email: Email.dirty('contact@codebuds.com'),
            status: FormzStatus.submissionFailure,
          ),
        ],
      );
    });
  });
}
