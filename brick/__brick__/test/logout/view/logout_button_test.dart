import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/authentication/authentication.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/counter/counter.dart';

import '../../helpers/helpers.dart';

class MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

void main() {
  group('Logout', () {
    late MockAuthenticationBloc authenticationBloc;

    setUp(() {
      authenticationBloc = MockAuthenticationBloc();
    });

    testWidgets('Press the logout button and call the bloc', (tester) async {
      await tester.pumpApp(
        Scaffold(
          body: BlocProvider<AuthenticationBloc>.value(
            value: authenticationBloc,
            child: const CounterPage(),
          ),
        ),
      );
      await tester.tap(find.byType(ElevatedButton));
      verify(
        () => authenticationBloc.add(AuthenticationLogoutRequested()),
      ).called(1);
    });
  });
}
