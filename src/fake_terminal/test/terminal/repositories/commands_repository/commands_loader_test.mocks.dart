// Mocks generated by Mockito 5.0.7 from annotations
// in fake_terminal/test/terminal/repositories/commands_repository/commands_loader_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:fake_terminal/terminal/models/fake_data.dart' as _i2;
import 'package:fake_terminal/terminal/repositories/commands_repository/code_repository_executor.dart'
    as _i8;
import 'package:fake_terminal/terminal/repositories/commands_repository/exit_executor.dart'
    as _i6;
import 'package:fake_terminal/terminal/repositories/commands_repository/javascript_executor.dart'
    as _i7;
import 'package:fake_terminal/terminal/repositories/content_repository/content_repository.dart'
    as _i5;
import 'package:fake_terminal/terminal/repositories/fake_data_repository/fake_data_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

class _FakeFakeData extends _i1.Fake implements _i2.FakeData {}

/// A class which mocks [FakeDataRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockFakeDataRepository extends _i1.Mock
    implements _i3.FakeDataRepository {
  MockFakeDataRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.FakeData> load() =>
      (super.noSuchMethod(Invocation.method(#load, []),
              returnValue: Future<_i2.FakeData>.value(_FakeFakeData()))
          as _i4.Future<_i2.FakeData>);
}

/// A class which mocks [ContentRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockContentRepository extends _i1.Mock implements _i5.ContentRepository {
  MockContentRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<String> load(String? url) =>
      (super.noSuchMethod(Invocation.method(#load, [url]),
          returnValue: Future<String>.value('')) as _i4.Future<String>);
}

/// A class which mocks [ExitExecutor].
///
/// See the documentation for Mockito's code generation for more information.
class MockExitExecutor extends _i1.Mock implements _i6.ExitExecutor {
  MockExitExecutor() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool hasExitCommand() =>
      (super.noSuchMethod(Invocation.method(#hasExitCommand, []),
          returnValue: false) as bool);
  @override
  void executeExitCommand() =>
      super.noSuchMethod(Invocation.method(#executeExitCommand, []),
          returnValueForMissingStub: null);
}

/// A class which mocks [JavascriptExecutor].
///
/// See the documentation for Mockito's code generation for more information.
class MockJavascriptExecutor extends _i1.Mock
    implements _i7.JavascriptExecutor {
  MockJavascriptExecutor() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String execute(String? expression) =>
      (super.noSuchMethod(Invocation.method(#execute, [expression]),
          returnValue: '') as String);
}

/// A class which mocks [CodeRepositoryExecutor].
///
/// See the documentation for Mockito's code generation for more information.
class MockCodeRepositoryExecutor extends _i1.Mock
    implements _i8.CodeRepositoryExecutor {
  MockCodeRepositoryExecutor() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void executeOpenTerminalRepositoryCommand() => super.noSuchMethod(
      Invocation.method(#executeOpenTerminalRepositoryCommand, []),
      returnValueForMissingStub: null);
  @override
  void executeOpenPersonalRepositoryCommand() => super.noSuchMethod(
      Invocation.method(#executeOpenPersonalRepositoryCommand, []),
      returnValueForMissingStub: null);
}
