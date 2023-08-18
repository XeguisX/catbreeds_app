import 'package:catbreeds_app/presentation/ui/widgets/cat_attribute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CatAttribute muestra correctamente',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CatAttribute(
            attribute: 'Breed',
            description: 'Abyssinian',
          ),
        ),
      ),
    );

    expect(find.text('Breed: Abyssinian'), findsOneWidget);
  });
}
