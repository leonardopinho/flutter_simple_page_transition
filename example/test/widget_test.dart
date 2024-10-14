import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_page_transition/simple_page_transition.dart';

void main() {
  testWidgets('Fade transition test', (WidgetTester tester) async {
    final firstPage = Scaffold(appBar: AppBar(title: Text('First Page')));
    final secondPage = Scaffold(appBar: AppBar(title: Text('Second Page')));

    await tester.pumpWidget(
      MaterialApp(
        home: firstPage,
      ),
    );

    // Verificar que a primeira página está sendo exibida
    expect(find.text('First Page'), findsOneWidget);
    expect(find.text('Second Page'), findsNothing);

    // Simular navegação para a segunda página usando a transição Fade
    Navigator.of(tester.element(find.text('First Page'))).push(
      Fade(page: secondPage),
    );

    // Iniciar o teste de animação
    await tester.pump();
    expect(find.text('First Page'), findsOneWidget);
    expect(find.text('Second Page'), findsNothing);

    // Avançar na animação de transição para verificar a segunda página
    await tester.pumpAndSettle();

    expect(find.text('First Page'), findsNothing);
    expect(find.text('Second Page'), findsOneWidget);
  });
}
