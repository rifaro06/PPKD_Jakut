import 'package:flutter_test/flutter_test.dart';
import 'package:tugas/main.dart';

void main() {
  testWidgets('Login page tampil ketika belum login', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MyApp(),
    );

    expect(find.text('Selamat Datang'), findsOneWidget);
    expect(find.text('ALAMAT EMAIL'), findsOneWidget);
    expect(find.text('PASSWORD'), findsOneWidget);
    expect(find.text('LOGIN'), findsOneWidget);
  });
}