// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/app/app.dart';
import 'package:{{#snakeCase}}{{project_name}}{{/snakeCase}}/authentication/authentication.dart';

import '../../helpers/helpers.dart';

void main() {
  late MockAuthenticationRepository authenticationRepository;
  late MockUserRepository userRepository;

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
    userRepository = MockUserRepository();
    when(() => userRepository.userAuthenticationStatus)
        .thenAnswer((_) => const Stream.empty());
  });
  group('App', () {
    testWidgets('renders base elements correctly', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(MultiRepositoryProvider), findsOneWidget);

      await tester.pumpWidget(
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => authenticationRepository,
            ),
            RepositoryProvider(create: (context) => userRepository),
          ],
          child: BlocProvider<AuthenticationBloc>(
            create: (BuildContext context) => AuthenticationBloc(
              authenticationRepository:
                  context.read<MockAuthenticationRepository>(),
              userRepository: context.read<MockUserRepository>(),
            ),
            child: const AppView(),
          ),
        ),
      );

      expect(find.byType(AppView), findsOneWidget);
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
