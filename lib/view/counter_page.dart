import 'package:counter_app_riverpod/logic/counter_notifier.dart';
import 'package:counter_app_riverpod/view/counter_second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    ref.listen(counterProvider, (_, next) {
      /// 5の倍数の時、アラートを表示させる。
      if (next % 5 == 0) {
        showDialog(
          context: context,
          builder: (context) =>
              const AlertDialog(title: Text('5の倍数'), content: Text('5の倍数です')),
        );
      }
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Page')),
      body: Column(
        children: [
          Text('Counter: $counter'),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).increment();
                },
                child: const Text('Increment'),
              ),
              SizedBox(width: 30),
              ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).decrement();
                },
                child: const Text('Decrement'),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CounterSecondPage()),
              );
            },
            child: const Text('CounterSecondPage'),
          ),
        ],
      ),
    );
  }
}
