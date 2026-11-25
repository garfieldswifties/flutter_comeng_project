# flutter_comeng_project

Assignment 03 ฝึกสร้าง UI 6 หน้าของแอป **SAU Deverloper** ด้วย Flutter และ Dart
ตาม Mockup ของการเข้าสู่ระบบและกู้รหัสผ่าน

## ภาพหน้าจอ

ภาพจากแอปเวอร์ชันสุดท้ายที่ขนาด 375 × 812 logical pixels ตามเฟรม Figma

<table>
  <tr>
    <td align="center"><strong>Home</strong><br><img src="docs/screenshots/01-home.png" alt="Home" width="200"></td>
    <td align="center"><strong>Login</strong><br><img src="docs/screenshots/02-login.png" alt="Login" width="200"></td>
    <td align="center"><strong>Forgot Password</strong><br><img src="docs/screenshots/03-forgot-password.png" alt="Forgot Password" width="200"></td>
  </tr>
  <tr>
    <td align="center"><strong>OTP Verification</strong><br><img src="docs/screenshots/04-otp-verification.png" alt="OTP Verification" width="200"></td>
    <td align="center"><strong>New Password</strong><br><img src="docs/screenshots/05-new-password.png" alt="New Password" width="200"></td>
    <td align="center"><strong>Password Changed</strong><br><img src="docs/screenshots/06-password-changed.png" alt="Password Changed" width="200"></td>
  </tr>
</table>

## ไฟล์หน้าจอ

| ไฟล์ใน `lib/views/` | Class | หน้าจอ |
|---|---|---|
| `home_ui.dart` | `HomeUI` | Home |
| `login_ui.dart` | `LoginUI` | Login |
| `forgot_ui.dart` | `ForgotUI` | Forgot Password |
| `otp_ui.dart` | `OtpUI` | OTP Verification |
| `new_password_ui.dart` | `NewPasswordUI` | New Password |
| `password_change_ui.dart` | `PasswordChangeUI` | Password Changed |

เปิด Terminal ที่โฟลเดอร์โปรเจกต์ แล้วรัน

```sh
flutter pub get
flutter run -d chrome
```

ใช้ Device Toolbar ใน Chrome DevTools แล้วกำหนด viewport เป็น 375 × 812 เพื่อเทียบกับเฟรม Figma
หรือ 440 × 956 เพื่อตรวจเลย์เอาต์ที่ขนาด iPhone 16 Pro Max

รูปประกอบอยู่ใน `assets/images/` ใช้โลโก้ `assets/images/img_dev2.png`
เป็นรูปต้นทางของ Launcher Icon ที่ตั้งค่าไว้ใน `pubspec.yaml`
