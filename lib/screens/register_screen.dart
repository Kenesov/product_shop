import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../l10n/app_localizations.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';
import 'success_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              Text(t.signUp, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
              const SizedBox(height: 40),
              CustomTextField(hintText: t.name),
              const SizedBox(height: 16),
              CustomTextField(hintText: t.email),
              const SizedBox(height: 16),
              CustomTextField(hintText: t.password, obscureText: true),
              const SizedBox(height: 16),
              CustomTextField(hintText: t.confirmPassword, obscureText: true),
              const SizedBox(height: 24),
              PrimaryButton(
                text: t.signUp,
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SuccessScreen())),
              ),
              const SizedBox(height: 24),
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(t.alreadyHaveAccount, style: const TextStyle(color: AppColors.textPrimary)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}