import 'package:material_ui/material_ui.dart';

import '../widgets/screen_widgets.dart';
import 'otp_ui.dart';

class ForgotUI extends StatelessWidget {
  const ForgotUI({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      footer: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 4,
        children: [
          Text('Remember Password?', style: screenText()),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              minimumSize: const Size(0, 32),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              foregroundColor: linkColor,
              textStyle: screenText(weight: FontWeight.w700),
            ),
            child: const Text('Login'),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const FormHeader(
            title: 'Forgot Password?',
            description: "Don't worry! It occurs. Please enter the email address linked with your account.",
          ),
          const SizedBox(height: 32),
          TextField(
            style: screenText(),
            keyboardType: TextInputType.emailAddress,
            decoration: fieldDecoration(hint: 'Enter your email'),
          ),
          const SizedBox(height: 38),
          // ปุ่มนี้เปิดหน้า OTP ตาม Mockup โดยจำลองเพียงการเปลี่ยนหน้า
          PrimaryButton(
            label: 'Send Code',
            onPressed: () {
              FocusScope.of(context).unfocus();
              Navigator.of(context)
                  .push(MaterialPageRoute<void>(builder: (_) => const OtpUI()));
            },
          ),
        ],
      ),
    );
  }
}
