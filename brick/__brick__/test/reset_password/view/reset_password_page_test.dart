import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/reset_password/reset_password.dart';

import '../../helpers/helpers.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  group('ResetPasswordPage', () {
    test('is routable', () {
      expect(ResetPasswordPage.route(), isA<MaterialPageRoute>());
    });

    testWidgets('renders a LoginForm', (tester) async {
      await tester.pumpApp(
        const ResetPasswordPage(),
      );
      expect(find.byType(ResetPasswordForm), findsOneWidget);
    });
  });
}
