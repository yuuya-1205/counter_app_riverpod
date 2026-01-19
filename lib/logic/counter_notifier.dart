import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = NotifierProvider<CounterNotifier, int>(
  () => CounterNotifier(),
);

class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    debugPrint('SwitchNotifierSecond: build() が実行された。');

    ref.onCancel(() {
      debugPrint('SwitchNotifierSecond: onCancel された（listener が 0）。');
    });

    ref.onResume(() {
      debugPrint('SwitchNotifierSecond: onResume された（listener が復活）。');
    });

    ref.onDispose(() {
      debugPrint('SwitchNotifierSecond: onDispose された。');
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
