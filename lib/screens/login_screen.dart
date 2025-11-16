import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../l10n/app_localizations.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';
import '../widgets/social_button.dart';
import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(t.signIn, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
              const SizedBox(height: 40),
              CustomTextField(hintText: t.email),
              const SizedBox(height: 16),
              CustomTextField(hintText: t.password, obscureText: true),
              const SizedBox(height: 24),
              PrimaryButton(
                text: t.signIn,
                onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const HomeScreen()), (route) => false),
              ),
              const SizedBox(height: 16),
              SocialButton(text: t.signInWithFacebook, color: AppColors.facebookBlue, onPressed: () {}),
              const SizedBox(height: 24),
              Center(
                child: TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterScreen())),
                  child: Text(t.dontHaveAccount, style: const TextStyle(color: AppColors.textPrimary)),
                ),
              ),
              const Spacer(),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(t.forgotPassword, style: const TextStyle(color: AppColors.textPrimary)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}