import 'package:material_ui/material_ui.dart';

import '../widgets/screen_widgets.dart';
import 'forgot_ui.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  static const routeName = '/login';

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      footer: Text.rich(
        TextSpan(
          text: 'Don’t have an account? ',
          children: [
            TextSpan(
              text: 'Register Now',
              style: screenText(
                color: linkColor,
                weight: FontWeight.w700,
                height: 1.4,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
        style: screenText(height: 1.4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const FormHeader(title: 'Welcome to SAU! Glad to see you, Again!'),
          const SizedBox(height: 32),
          // ช่องอีเมลและรหัสผ่านพร้อมปุ่มแสดงหรือซ่อนรหัส
          TextField(
            style: screenText(),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: fieldDecoration(hint: 'Enter your email'),
          ),
          const SizedBox(height: 15),
          TextField(
            style: screenText(),
            obscureText: _hidePassword,
            enableSuggestions: false,
            autocorrect: false,
            decoration: fieldDecoration(
              hint: 'Enter your password',
              suffixIcon: IconButton(
                tooltip: _hidePassword ? 'Show password' : 'Hide password',
                color: secondaryColor,
                onPressed: () => setState(() => _hidePassword = !_hidePassword),
                icon: Icon(
                  _hidePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 20,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 42,
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  foregroundColor: secondaryColor,
                  textStyle: screenText(size: 14, weight: FontWeight.w600),
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(builder: (_) => const ForgotUI()),
                  );
                },
                child: const Text('Forgot Password?'),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Mockup แสดงปุ่มเข้าสู่ระบบโดยไม่มีปลายทางของการเข้าสู่ระบบ
          const PrimaryButton(label: 'Login'),
          const SizedBox(height: 35),
          Text(
            'Or Login with',
            textAlign: TextAlign.center,
            style: screenText(
              size: 14,
              color: secondaryColor,
              weight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 21),
          const Row(
            children: [
              Expanded(
                child: _SocialButton(
                  label: 'Facebook',
                  image: 'img_facebook.png',
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _SocialButton(label: 'Google', image: 'img_google.png'),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _SocialButton(label: 'Apple', image: 'img_apple.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.label, required this.image});

  final String label;
  final String image;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: null,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size(0, 56),
        side: const BorderSide(color: lightBorder),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Image.asset(
        'assets/images/$image',
        width: 24,
        height: 24,
        semanticLabel: label,
      ),
    );
  }
}
