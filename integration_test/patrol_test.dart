import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_example/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  patrolTest('Patrol Test', ($) async {
    app.main();

    await $.pumpAndSettle();

    final card1Finder = $(app.K.card0);

    expect(card1Finder, findsOneWidget);

    await card1Finder.tap();
  });
}
