import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{project_name.snakeCase()}}/login/login.dart';
import 'package:{{project_name.snakeCase()}}/reset_password/reset_password.dart';

import '../../helpers/helpers.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('Login link', () {
    late MockNavigatorObserver mockObserver;

    setUp(() {
      mockObserver = MockNavigatorObserver();
    });

    testWidgets('Button is present and triggers navigation after tapped',
        (tester) async {
      await tester.pumpApp(
        const ResetPasswordPage(),
      );
      expect(find.byKey(const Key('forgotPasswordLoginLink')), findsOneWidget);

      await tester.tap(
        find.byKey(const Key('forgotPasswordLoginLink')),
      );

      await tester.pumpAndSettle();

      verifyNever(() => mockObserver.didPush(LoginPage.route(), null));

      expect(find.byType(LoginPage), findsOneWidget);
    });
  });
}
