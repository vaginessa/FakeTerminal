// Mocks generated by Mockito 5.0.7 from annotations
// in fake_terminal/test/terminal/repositories/fake_data_repository/fake_data_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:fake_terminal/terminal/repositories/fake_data_repository/asset_text_loader.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

/// A class which mocks [AssetTextLoader].
///
/// See the documentation for Mockito's code generation for more information.
class MockAssetTextLoader extends _i1.Mock implements _i2.AssetTextLoader {
  MockAssetTextLoader() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<String> loadString(String? key) =>
      (super.noSuchMethod(Invocation.method(#loadString, [key]),
          returnValue: Future<String>.value('')) as _i3.Future<String>);
}
