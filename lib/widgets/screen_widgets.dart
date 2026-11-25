import 'dart:math' as math;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';

const inkColor = Color(0xFF1E232C);
const linkColor = Color(0xFF35C2C1);
const secondaryColor = Color(0xFF6A707C);
const descriptionColor = Color(0xFF838BA1);
const hintColor = Color(0xFF8391A1);
const lightBorder = Color(0xFFE8ECF4);
const fieldColor = Color(0xFFF7F8F9);
const fieldBorder = Color(0xFF73767A);

TextStyle screenText({
  double size = 15,
  FontWeight weight = FontWeight.w500,
  Color color = inkColor,
  double height = 1.25,
  double letterSpacing = 0,
}) {
  return GoogleFonts.urbanist(
    fontSize: size,
    fontWeight: weight,
    color: color,
    height: height,
    letterSpacing: letterSpacing,
  ).copyWith(fontFamilyFallback: const ['Noto Sans Thai']);
}

// พื้นที่หน้าจอและการเลื่อนเมื่อมีคีย์บอร์ดหรือพื้นที่แนวตั้งไม่พอ
class ScreenLayout extends StatelessWidget {
  const ScreenLayout({
    super.key,
    required this.child,
    this.footer,
    this.top = 56,
    this.bottom = 21,
    this.centerVertically = false,
  });

  final Widget child;
  final Widget? footer;
  final double top;
  final double bottom;
  final bool centerVertically;

  @override
  Widget build(BuildContext context) {
    final insets = MediaQuery.paddingOf(context);
    final padding = EdgeInsets.fromLTRB(
      22,
      math.max(top, insets.top + 8),
      22,
      math.max(bottom, insets.bottom + 8),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        bottom: false,
        child: LayoutBuilder(
          builder: (context, viewport) {
            return SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 440),
                  child: Padding(
                    padding: padding,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: math.max(
                          0,
                          viewport.maxHeight - padding.vertical,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: centerVertically
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          child,
                          if (footer != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: footer,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// หัวหน้าฟอร์มและปุ่มย้อนกลับที่ใช้ร่วมกันใน Mockup
class FormHeader extends StatelessWidget {
  const FormHeader({super.key, required this.title, this.description});

  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 41,
          height: 41,
          child: IconButton(
            tooltip: 'Back',
            onPressed: () => Navigator.of(context).pop(),
            padding: EdgeInsets.zero,
            style: IconButton.styleFrom(
              foregroundColor: inkColor,
              side: const BorderSide(color: lightBorder),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const FaIcon(FontAwesomeIcons.angleLeft, size: 19),
          ),
        ),
        const SizedBox(height: 28),
        Semantics(
          header: true,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 315),
            child: Text(
              title,
              style: screenText(
                size: 30,
                weight: FontWeight.w700,
                height: 1.3,
                letterSpacing: -0.3,
              ),
            ),
          ),
        ),
        if (description != null) ...[
          const SizedBox(height: 10),
          Text(
            description!,
            style: screenText(size: 16, color: descriptionColor, height: 1.5),
          ),
        ],
      ],
    );
  }
}

// ปุ่มหลักและรูปแบบช่องกรอกตาม Figma
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.label, this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: inkColor,
        disabledBackgroundColor: inkColor,
        foregroundColor: Colors.white,
        disabledForegroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.transparent,
        minimumSize: const Size.fromHeight(56),
        textStyle: screenText(weight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(label),
    );
  }
}

InputDecoration fieldDecoration({String? hint, Widget? suffixIcon}) {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: fieldBorder),
  );

  return InputDecoration(
    hintText: hint,
    hintStyle: screenText(color: hintColor),
    suffixIcon: suffixIcon,
    counterText: '',
    filled: true,
    fillColor: fieldColor,
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18.5),
    constraints: const BoxConstraints(minHeight: 56),
    border: border,
    enabledBorder: border,
    focusedBorder: border.copyWith(
      borderSide: const BorderSide(color: linkColor, width: 1.5),
    ),
  );
}
