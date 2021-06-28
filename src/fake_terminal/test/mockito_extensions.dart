import 'package:mockito/mockito.dart';

extension MockitoX on PostExpectation {
  void thenAnswerStateToListener<T>(T state) {
    this.thenAnswer((invocation) {
      final listener = invocation.positionalArguments[0] as void Function(T state);
      listener(state);
      return () {};
    });
  }
}
