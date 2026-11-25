import 'package:material_ui/material_ui.dart';

import '../widgets/screen_widgets.dart';
import 'password_change_ui.dart';

class NewPasswordUI extends StatelessWidget {
  const NewPasswordUI({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const FormHeader(
            title: 'Create new password',
            description:
                'Your new password must be unique from those previously used.',
          ),
          const SizedBox(height: 32),
          // ช่องกรอกรหัสผ่านใหม่และช่องยืนยัน
          TextField(
            style: screenText(),
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            decoration: fieldDecoration(hint: 'New Password'),
          ),
          const SizedBox(height: 15),
          TextField(
            style: screenText(),
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: fieldDecoration(hint: 'Confirm Password'),
          ),
          const SizedBox(height: 38),
          PrimaryButton(
            label: 'Reset Password',
            onPressed: () {
              FocusScope.of(context).unfocus();
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const PasswordChangeUI(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
