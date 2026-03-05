import 'package:flutter/material.dart';
import 'package:histofish_app/core/i18n/app_language.dart';
import 'package:histofish_app/core/settings/app_settings.dart';
import 'package:provider/provider.dart';

class SettingsPage  extends StatelessWidget{
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<AppSettings>();
    final current = settings.currentLanguage;

    String label(AppLanguage lang) => lang == AppLanguage.pt ? "Português (BR)" : "English";

    return Scaffold(  
      appBar: AppBar(title: const Text("Settings"),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Current Language: ${current == null ? 'Not set' : label(current)}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),

            ElevatedButton(onPressed: () => context.read<AppSettings>().setLanguage(AppLanguage.pt),
             child: const Text("Português (BR)")),
            
            const SizedBox(height: 12,),

            ElevatedButton(onPressed: () => context.read<AppSettings>().setLanguage(AppLanguage.en),
             child: const Text("English")),
          ],
        )
      ),
    );
  }
}