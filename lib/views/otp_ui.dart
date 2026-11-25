import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';

import '../widgets/screen_widgets.dart';
import 'new_password_ui.dart';

class OtpUI extends StatefulWidget {
  const OtpUI({super.key});

  @override
  State<OtpUI> createState() => _OtpUIState();
}

class _OtpUIState extends State<OtpUI> {
  final _digitFocus = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final focus in _digitFocus) {
      focus.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const FormHeader(
            title: 'OTP Verification',
            description: 'Enter the verification code we just sent on your email address.',
          ),
          const SizedBox(height: 32),
          // รับตัวเลขหนึ่งหลักต่อช่องและเลื่อนโฟกัสไปช่องถัดไป
          Row(
            children: [
              for (var index = 0; index < _digitFocus.length; index++) ...[
                if (index != 0) const SizedBox(width: 17),
                Expanded(
                  child: Semantics(
                    label: 'Verification code digit ${index + 1}',
                    child: TextField(
                      focusNode: _digitFocus[index],
                      style: screenText(size: 22, weight: FontWeight.w700),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      textInputAction: index == _digitFocus.length - 1
                          ? TextInputAction.done
                          : TextInputAction.next,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(1),
                      ],
                      decoration: fieldDecoration().copyWith(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.25,
                        ),
                        constraints: const BoxConstraints(minHeight: 60),
                      ),
                      onChanged: (digit) {
                        if (digit.isNotEmpty &&
                            index + 1 < _digitFocus.length) {
                          _digitFocus[index + 1].requestFocus();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 38),
          PrimaryButton(
            label: 'Verify',
            onPressed: () {
              FocusScope.of(context).unfocus();
              Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (_) => const NewPasswordUI()),
              );
            },
          ),
        ],
      ),
    );
  }
}
