
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'simple_state_provider.g.dart';

final riverPodCountState = StateProvider<int>((ref) {
  return 0;
});

@riverpod
class Counter extends _$Counter {
  @override
  int build() {
    return 0;
  }

  void increment() => state++;
  void decrement() => state--;

}