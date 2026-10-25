import 'package:flutter_test/flutter_test.dart';
import 'package:food_menu_app/main.dart';

void main() {
  testWidgets('App load test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MenuApp());

    // Verify that the title is present on screen
    expect(find.text('Restaurant Menu'), findsOneWidget);
  });
}