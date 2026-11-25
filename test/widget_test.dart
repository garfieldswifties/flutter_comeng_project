import 'package:flutter_comeng_project/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void setViewport(WidgetTester tester, Size size) {
  tester.view.devicePixelRatio = 1;
  tester.view.physicalSize = size;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

Future<void> tapLabel(WidgetTester tester, String label) async {
  final target = find.text(label);
  await tester.ensureVisible(target);
  await tester.tap(target);
  await tester.pumpAndSettle();
}

Future<void> tapBack(WidgetTester tester) async {
  await tester.tap(find.byTooltip('Back'));
  await tester.pumpAndSettle();
}

Future<void> openLogin(WidgetTester tester) async {
  await tester.pumpWidget(const FlutterComengProject());
  await tester.pumpAndSettle();
  await tapLabel(tester, 'Login');
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(loadScreenFonts);

  testWidgets('Navigates all six screens and all documented return links', (
    tester,
  ) async {
    setViewport(tester, const Size(375, 812));
    await openLogin(tester);
    expect(
      find.text('Welcome to SAU! Glad to see you, Again!'),
      findsOneWidget,
    );
    await tapBack(tester);
    expect(find.text('Register'), findsOneWidget);

    await tapLabel(tester, 'Login');
    await tapLabel(tester, 'Forgot Password?');
    await tapBack(tester);
    expect(find.text('Or Login with'), findsOneWidget);
    await tapLabel(tester, 'Forgot Password?');
    await tapLabel(tester, 'Login');
    expect(find.text('Or Login with'), findsOneWidget);

    await tapLabel(tester, 'Forgot Password?');
    await tapLabel(tester, 'Send Code');
    expect(find.text('OTP Verification'), findsOneWidget);
    await tapBack(tester);
    expect(find.text('Send Code'), findsOneWidget);

    await tapLabel(tester, 'Send Code');
    await tapLabel(tester, 'Verify');
    expect(find.text('Create new password'), findsOneWidget);
    await tapBack(tester);
    expect(find.text('OTP Verification'), findsOneWidget);

    await tapLabel(tester, 'Verify');
    await tapLabel(tester, 'Reset Password');
    expect(find.text('Password Changed!'), findsOneWidget);
    await tapLabel(tester, 'Back to Login');
    expect(find.text('Or Login with'), findsOneWidget);
    await tapBack(tester);
    expect(find.text('Register'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Password visibility and OTP input are local to the form', (
    tester,
  ) async {
    setViewport(tester, const Size(440, 956));
    await openLogin(tester);
    expect(
      tester.widget<TextField>(find.byType(TextField).last).obscureText,
      isTrue,
    );
    await tester.tap(find.byTooltip('Show password'));
    await tester.pumpAndSettle();
    expect(
      tester.widget<TextField>(find.byType(TextField).last).obscureText,
      isFalse,
    );
    await tester.tap(find.byTooltip('Hide password'));
    await tester.pumpAndSettle();
    expect(
      tester.widget<TextField>(find.byType(TextField).last).obscureText,
      isTrue,
    );

    await tapLabel(tester, 'Forgot Password?');
    await tapLabel(tester, 'Send Code');
    final fields = find.byType(EditableText);
    expect(fields, findsNWidgets(4));
    await tester.enterText(fields.first, 'a7b8');
    await tester.pump();
    expect(tester.widget<EditableText>(fields.first).controller.text, '7');
    expect(
      tester.widget<EditableText>(fields.at(1)).focusNode.hasFocus,
      isTrue,
    );
    await tapLabel(tester, 'Verify');
    await tapLabel(tester, 'Reset Password');
    expect(find.text('Password Changed!'), findsOneWidget);
    await tapLabel(tester, 'Back to Login');
    expect(find.text('Or Login with'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Login remains accessible when the web app is reloaded', (
    tester,
  ) async {
    tester.platformDispatcher.defaultRouteNameTestValue = '/login';
    addTearDown(tester.platformDispatcher.clearDefaultRouteNameTestValue);
    await tester.pumpWidget(const FlutterComengProject());
    await tester.pumpAndSettle();
    expect(find.text('Or Login with'), findsOneWidget);
    await tapBack(tester);
    expect(find.text('Register'), findsOneWidget);
  });

  testWidgets(
    'Small viewport can scroll past forms with the keyboard visible',
    (tester) async {
      setViewport(tester, const Size(320, 640));
      addTearDown(tester.view.resetViewInsets);
      await openLogin(tester);

      for (final action in [
        'Forgot Password?',
        'Send Code',
        'Verify',
        'Reset Password',
      ]) {
        await tester.ensureVisible(find.byType(TextField).last);
        await tester.showKeyboard(find.byType(TextField).last);
        tester.view.viewInsets = const FakeViewPadding(bottom: 290);
        await tester.pumpAndSettle();
        await tester.ensureVisible(find.text(action));
        expect(find.text(action).hitTestable(), findsOneWidget);
        expect(tester.takeException(), isNull);
        tester.view.resetViewInsets();
        await tester.pumpAndSettle();
        await tapLabel(tester, action);
      }
      expect(find.text('Password Changed!'), findsOneWidget);
    },
  );
}
