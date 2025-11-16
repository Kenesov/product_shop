import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/localization.dart';
import '../core/localization.dart' as loc;

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalizationProvider>(context);

    return PopupMenuButton<Locale>(
      icon: const Icon(Icons.language),
      onSelected: (locale) {
        provider.setLocale(locale);
      },
      itemBuilder: (context) => L10n.all.map((locale) {
        return PopupMenuItem(
          value: locale,
          child: Text(L10n.getFlag(locale.languageCode)),
        );
      }).toList(),
    );
  }
}