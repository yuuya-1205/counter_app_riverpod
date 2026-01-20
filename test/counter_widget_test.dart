import 'package:counter_app_riverpod/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> pumpApp(WidgetTester tester) async {
    // これを設定する理由がわからない。
    // Widgetテストって画面遷移を確認するテストって認識であってますか？
    await tester.pumpWidget(ProviderScope(child: MyApp()));
    await tester.pump();
  }

  testWidgets('初期表示で Counter と CounterSecond が 0 である。', (tester) async {
    await pumpApp(tester);

    expect(find.text('Counter Page'), findsOneWidget);
    expect(find.text('Counter: 0'), findsOneWidget);
  });
  testWidgets('CounterSecondPage に遷移できる。', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.text('CounterSecondPage'));
    await tester.pump();

    expect(find.text('Counter Page'), findsOneWidget);
  });
}
