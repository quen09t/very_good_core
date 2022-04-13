import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{project_name.snakeCase()}}/reset_password/reset_password.dart';

import '../../helpers/helpers.dart';

class MockResetPasswordBloc
    extends MockBloc<ResetPasswordEvent, ResetPasswordState>
    implements ResetPasswordBloc {}

void main() {
  group('ResetPasswordForm', () {
    late ResetPasswordBloc resetPasswordBloc;

    setUp(() {
      resetPasswordBloc = MockResetPasswordBloc();
    });

    testWidgets(
        '''adds ResetPasswordEmailChanged to ResetPassw''ordBloc when email is updated''',
        (tester) async {
      const email = 'contact@codebuds.com';
      when(() => resetPasswordBloc.state)
          .thenReturn(const ResetPasswordState());
      await tester.pumpApp(
        Scaffold(
          body: BlocProvider.value(
            value: resetPasswordBloc,
            child: const ResetPasswordForm(),
          ),
        ),
      );

      await tester.enterText(
        find.byKey(const Key('resetPasswordForm_emailInput_textField')),
        email,
      );
      verify(
        () => resetPasswordBloc.add(const ResetPasswordEmailChanged(email)),
      ).called(1);
    });

    testWidgets('reset password button is disabled by default', (tester) async {
      when(() => resetPasswordBloc.state)
          .thenReturn(const ResetPasswordState());
      await tester.pumpApp(
        Scaffold(
          body: BlocProvider.value(
            value: resetPasswordBloc,
            child: const ResetPasswordForm(),
          ),
        ),
      );
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.enabled, isFalse);
    });

    testWidgets(
        'loading indicator is shown when status is submission in progress',
        (tester) async {
      when(() => resetPasswordBloc.state).thenReturn(
        const ResetPasswordState(status: FormzStatus.submissionInProgress),
      );
      await tester.pumpApp(
        Scaffold(
          body: BlocProvider.value(
            value: resetPasswordBloc,
            child: const ResetPasswordForm(),
          ),
        ),
      );
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('continue button is enabled when status is validated',
        (tester) async {
      when(() => resetPasswordBloc.state).thenReturn(
        const ResetPasswordState(status: FormzStatus.valid),
      );
      await tester.pumpApp(
        Scaffold(
          body: BlocProvider.value(
            value: resetPasswordBloc,
            child: const ResetPasswordForm(),
          ),
        ),
      );
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.enabled, isTrue);
    });

    testWidgets(
        '''ResetPasswordSubmitted is added to ResetPasswordBloc when continue is tapped''',
        (tester) async {
      when(() => resetPasswordBloc.state).thenReturn(
        const ResetPasswordState(status: FormzStatus.valid),
      );
      await tester.pumpApp(
        Scaffold(
          body: BlocProvider.value(
            value: resetPasswordBloc,
            child: const ResetPasswordForm(),
          ),
        ),
      );
      await tester.tap(find.byType(ElevatedButton));
      verify(() => resetPasswordBloc.add(const ResetPasswordSubmitted()))
          .called(1);
    });

    testWidgets('shows SnackBar when status is submission failure',
        (tester) async {
      whenListen(
        resetPasswordBloc,
        Stream.fromIterable([
          const ResetPasswordState(status: FormzStatus.submissionInProgress),
          const ResetPasswordState(status: FormzStatus.submissionFailure),
        ]),
      );
      when(() => resetPasswordBloc.state).thenReturn(
        const ResetPasswordState(status: FormzStatus.submissionFailure),
      );
      await tester.pumpApp(
        Scaffold(
          body: BlocProvider.value(
            value: resetPasswordBloc,
            child: const ResetPasswordForm(),
          ),
        ),
      );
      await tester.pump();
      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('shows SnackBar when status is submission failure',
        (tester) async {
      whenListen(
        resetPasswordBloc,
        Stream.fromIterable([
          const ResetPasswordState(status: FormzStatus.submissionInProgress),
          const ResetPasswordState(status: FormzStatus.submissionSuccess),
        ]),
      );
      when(() => resetPasswordBloc.state).thenReturn(
        const ResetPasswordState(status: FormzStatus.submissionSuccess),
      );
      await tester.pumpApp(
        Scaffold(
          body: BlocProvider.value(
            value: resetPasswordBloc,
            child: const ResetPasswordForm(),
          ),
        ),
      );
      await tester.pump();
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
