// Mocks generated by Mockito 5.0.7 from annotations
// in fake_terminal/test/theme/providers/theme_provider_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:fake_terminal/theme/repositories/theme_repository.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

class _FakeStoredTheme extends _i1.Fake implements _i2.StoredTheme {}

/// A class which mocks [ThemeRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockThemeRepository extends _i1.Mock implements _i2.ThemeRepository {
  MockThemeRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i2.StoredTheme?> fetchThemeSettings() =>
      (super.noSuchMethod(Invocation.method(#fetchThemeSettings, []),
              returnValue: Future<_i2.StoredTheme?>.value(_FakeStoredTheme()))
          as _i3.Future<_i2.StoredTheme?>);
  @override
  _i3.Future<void> saveThemeSettings(_i2.StoredTheme? theme) =>
      (super.noSuchMethod(Invocation.method(#saveThemeSettings, [theme]),
          returnValue: Future<void>.value(null),
          returnValueForMissingStub: Future.value()) as _i3.Future<void>);
}
