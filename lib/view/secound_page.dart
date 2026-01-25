import 'package:counter_app_riverpod/view/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecondPage extends ConsumerWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Column(
        children: [
          Text('Second Page'),
          ElevatedButton(
            onPressed: () {
              // Navigator.pushだと前の画面が消えないため、Disposeされない。
              // メモリーの解放まで行いたいのであれば、Navigator.pushReplacementを使用する。
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CounterPage()),
              );
            },
            child: const Text('Counter Page'),
          ),
        ],
      ),
    );
  }
}
