import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shop_app/main.dart' as app;
import 'package:shop_app/tutorial/tutorialAdditionals.dart' as tutorialKeys;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("run app", (WidgetTester tester) async {
    app.main();

    //splashScreen
    await tester.pumpAndSettle();

    final continueButtonFinder = find.byKey(Key('continueButton'));
    expect(continueButtonFinder, findsOneWidget);
    await tester.tap(continueButtonFinder);

    //sign in
    await tester.pumpAndSettle();

    final signInEmailFormFinder = find.byKey(Key('signInEmailFormField'));
    final signInPasswordFormFinder = find.byKey(Key('signInPasswordFormField'));
    final signInButtonFinder = find.byKey(Key('signInButton'));

    await tester.enterText(signInEmailFormFinder, "customer@gmail.com");
    await tester.enterText(signInPasswordFormFinder, "customer123");
    await tester.tap(signInButtonFinder);

    //homePage ideally
    await tester.pumpAndSettle(Duration(seconds: 2));

    final generalCategoryFinder = find.byKey(Key('general'));
    expect(generalCategoryFinder, findsOneWidget);
    await tester.tap(generalCategoryFinder);

    //inside general category
    await tester.pumpAndSettle();

    final firstMedicineFinder = find.byType(ListTile).first;
    expect(firstMedicineFinder, findsOneWidget);
    await tester.tap(firstMedicineFinder);

    //inside medicine page
    await tester.pumpAndSettle(Duration(milliseconds: 500));

  });
}
