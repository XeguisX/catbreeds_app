import 'package:catbreeds_app/presentation/ui/widgets/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SearchInput muestra correctamente', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchInput(onChanged: (value) {}),
        ),
      ),
    );

    expect(find.text('Buscar'), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
  });

  testWidgets('SearchInput llama al callback onChanged',
      (WidgetTester tester) async {
    String? searchText;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchInput(
            onChanged: (value) {
              searchText = value;
            },
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField), 'Texto de prueba');
    expect(searchText, 'Texto de prueba');
  });
}
