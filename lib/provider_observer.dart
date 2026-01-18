import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoggerObserver extends ProviderObserver {
  @override
  /// この関数について教えて
  void didAddProvider(
    // 参照しているProviderの情報
    ProviderBase provider,
    // 初期値
    Object? value,
    ProviderContainer container,
  ) {
    /// 参照しているProviderの情報 全てのProviderを参照している。
    debugPrint('$provider was added');
    debugPrint('didAddProvider: $provider value=$value');
  }

  @override
  // これがわからない。何をするのかな？
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    debugPrint(
      'didUpdateProvider: $provider prev=$previousValue next=$newValue',
    );
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    debugPrint('didDisposeProvider: $provider');
  }
}
