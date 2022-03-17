import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/login/login.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/reset_password/reset_password.dart';

import '../../helpers/helpers.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('Forgot password link', () {
    late MockNavigatorObserver mockObserver;

    setUp(() {
      mockObserver = MockNavigatorObserver();
    });

    testWidgets('Button is present and triggers navigation after tapped',
        (tester) async {
      await tester.pumpApp(
        const LoginPage(),
      );
      expect(find.byKey(const Key('loginForgotPasswordLink')), findsOneWidget);

      await tester.tap(
        find.byKey(const Key('loginForgotPasswordLink')),
      );

      await tester.pumpAndSettle();

      verifyNever(() => mockObserver.didPush(ResetPasswordPage.route(), null));

      expect(find.byType(ResetPasswordPage), findsOneWidget);
    });
  });
}
