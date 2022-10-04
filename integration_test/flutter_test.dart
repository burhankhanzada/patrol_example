import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:patrol_example/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Flutter test',
    (tester) async {
      app.main();

      await tester.pumpAndSettle();

      final card0Finder = find.byKey(app.K.card0);

      expect(card0Finder, findsOneWidget);

      await tester.ensureVisible(card0Finder);

      await tester.pumpAndSettle();

      await tester.tap(card0Finder);

      await tester.pumpAndSettle();
    },
  );
}
