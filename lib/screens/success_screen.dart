import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../l10n/app_localizations.dart';
import '../widgets/primary_button.dart';
import 'login_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                color: AppColors.shapeOrange,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150)),
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            left: -100,
            child: Container(
              width: 350,
              height: 350,
              decoration: const BoxDecoration(
                color: AppColors.shapeYellow,
                borderRadius: BorderRadius.only(topRight: Radius.circular(200)),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(t.congratulations, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                  const SizedBox(height: 16),
                  Text(t.accountCreated, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                  const SizedBox(height: 40),
                  PrimaryButton(
                    text: t.signIn,
                    onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const LoginScreen()), (route) => false),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}