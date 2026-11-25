import 'package:material_ui/material_ui.dart';

import '../widgets/screen_widgets.dart';
import 'login_ui.dart';

class HomeUI extends StatelessWidget {
  const HomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).height < 750;

    return ScreenLayout(
      top: compact ? 36 : 108,
      bottom: 25,
      footer: Text(
        'Created by SAU Dev Team\nมหาวิทยาลัยเอเชียอาคเนย์',
        textAlign: TextAlign.center,
        style: screenText(
          color: linkColor,
          weight: FontWeight.w700,
          height: 1.2,
        ),
      ),
      // ภาพประกอบและตราสัญลักษณ์จาก Mockup
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Image.asset(
              'assets/images/img_dev1.png',
              width: 253,
              height: 253,
              fit: BoxFit.contain,
              semanticLabel: 'SAU developer team illustration',
            ),
          ),
          SizedBox(height: compact ? 32 : 73),
          Center(
            child: Image.asset(
              'assets/images/img_dev2.png',
              width: 70,
              height: 70,
              excludeFromSemantics: true,
            ),
          ),
          const SizedBox(height: 18),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'SAU',
                  style: screenText(size: 30, weight: FontWeight.w800),
                ),
                TextSpan(
                  text: 'Developer',
                  style: screenText(size: 30, weight: FontWeight.w400),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 31),
          // ปุ่ม Login เปิดหน้าที่ลูกศรใน Mockup ระบุ
          PrimaryButton(
            label: 'Login',
            onPressed: () =>
                Navigator.of(context).pushNamed<void>(LoginUI.routeName),
          ),
          const SizedBox(height: 15),
          OutlinedButton(
            onPressed: null,
            style: OutlinedButton.styleFrom(
              disabledForegroundColor: inkColor,
              minimumSize: const Size.fromHeight(56),
              side: const BorderSide(color: inkColor),
              textStyle: screenText(weight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}
