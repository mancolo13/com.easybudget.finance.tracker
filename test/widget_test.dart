import 'package:flutter_test/flutter_test.dart';
import 'package:app9/main.dart';

void main() {
  testWidgets('EasyBudget renders app correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const EasyBudgetApp());
    expect(find.byType(EasyBudgetApp), findsOneWidget);
  });
}
