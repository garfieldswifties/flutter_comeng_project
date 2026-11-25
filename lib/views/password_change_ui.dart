import 'package:material_ui/material_ui.dart';

import '../widgets/screen_widgets.dart';
import 'login_ui.dart';

class PasswordChangeUI extends StatelessWidget {
  const PasswordChangeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      centerVertically: true,
      top: 20,
      bottom: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ภาพและข้อความยืนยันตามหน้าสุดท้ายของ Mockup
          Center(
            child: Image.asset(
              'assets/images/img_correct.png',
              width: 100,
              height: 100,
              excludeFromSemantics: true,
            ),
          ),
          const SizedBox(height: 36),
          Text(
            'Password Changed!',
            textAlign: TextAlign.center,
            style: screenText(size: 26, weight: FontWeight.w700, height: 1.3),
          ),
          const SizedBox(height: 8),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 240),
              child: Text(
                'Your password has been changed successfully.',
                textAlign: TextAlign.center,
                style: screenText(color: descriptionColor, height: 1.5),
              ),
            ),
          ),
          const SizedBox(height: 38),
          // กลับ Login และปิดหน้าที่อยู่ใน flow รีเซ็ตรหัสผ่าน
          PrimaryButton(
            label: 'Back to Login',
            onPressed: () =>
                Navigator.of(context)
                    .popUntil(ModalRoute.withName(LoginUI.routeName)),
          ),
        ],
      ),
    );
  }
}
