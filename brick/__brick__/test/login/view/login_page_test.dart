import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{project_name.snakeCase()}}/login/login.dart';

import '../../helpers/helpers.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  group('LoginPage', () {
    late AuthenticationRepository authenticationRepository;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
    });

    test('is routable', () {
      expect(LoginPage.route(), isA<MaterialPageRoute>());
    });

    testWidgets('renders a LoginForm', (tester) async {
      await tester.pumpApp(
        RepositoryProvider.value(
          value: authenticationRepository,
          child: const LoginPage(),
        ),
      );
      expect(find.byType(LoginForm), findsOneWidget);
    });
  });
}
