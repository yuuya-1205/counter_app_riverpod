import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = NotifierProvider.autoDispose<CounterNotifier, int>(
  () => CounterNotifier(),
);

class CounterNotifier extends AutoDisposeNotifier<int> {
  @override
  int build() {
    debugPrint('counterProvider: build() が実行された。');

    ref.onCancel(() {
      debugPrint('counterProvider: onCancel された（listener が 0）。');
    });

    ref.onResume(() {
      debugPrint('counterProvider: onResume された（listener が復活）。');
    });

    ref.onDispose(() {
      debugPrint('counterProvider: onDispose された。');
    });
    return 0;
  }

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}
