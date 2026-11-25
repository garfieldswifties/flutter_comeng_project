import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';

import 'views/home_ui.dart';
import 'views/login_ui.dart';
import 'widgets/screen_widgets.dart';

// โหลด Urbanist จาก assets ก่อนแสดงหน้าจอแรก
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadScreenFonts();
  runApp(const FlutterComengProject());
}

Future<void> loadScreenFonts() async {
  GoogleFonts.config.allowRuntimeFetching = false;
  await GoogleFonts.pendingFonts([
    for (final weight in [
      FontWeight.w400,
      FontWeight.w500,
      FontWeight.w600,
      FontWeight.w700,
      FontWeight.w800,
    ])
      screenText(weight: weight),
  ]);
}

// Widget หลักของแอปและหน้าจอเริ่มต้น
class FlutterComengProject extends StatelessWidget {
  const FlutterComengProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAU Deverloper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: linkColor),
        scaffoldBackgroundColor: Colors.white,
        textSelectionTheme: const TextSelectionThemeData(cursorColor: inkColor),
      ),
      home: const HomeUI(),
      routes: {LoginUI.routeName: (_) => const LoginUI()},
    );
  }
}
