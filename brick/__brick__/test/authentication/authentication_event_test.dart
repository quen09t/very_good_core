import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name.snakeCase()}}/authentication/authentication.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  group('AuthenticationEvent', () {
    group('LoggedOut', () {
      test('supports value comparisons', () {
        expect(
          AuthenticationLogoutRequested(),
          AuthenticationLogoutRequested(),
        );
      });
    });

    group('AuthenticationStatusChanged', () {
      test('supports value comparisons', () {
        expect(
          const UserAuthenticationStatusChanged(
            UserAuthenticationStatus.unknown,
          ),
          const UserAuthenticationStatusChanged(
            UserAuthenticationStatus.unknown,
          ),
        );
      });
    });
  });
}
