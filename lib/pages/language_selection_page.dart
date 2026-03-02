
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:histofish_app/core/i18n/app_language.dart';
import 'package:histofish_app/core/routing/app_paths.dart';
import 'package:histofish_app/core/settings/app_settings.dart';
import 'package:provider/provider.dart';

class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.read<AppSettings>();

    return Scaffold(
      appBar: AppBar(title: const Text('Linguagem')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Selecione o Idioma', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),

            const SizedBox(height: 16,),

            ElevatedButton(onPressed: () async {
              await settings.setLanguage(AppLanguage.pt);
              context.go(AppPaths.viewer);
            },
            child: Text('Português-BR')),

            const SizedBox(height: 16,),

            ElevatedButton(onPressed: () async {
              await settings.setLanguage(AppLanguage.en);
              context.go(AppPaths.viewer);
            },
            child: Text('English')
            ),
          ],
        )
      ),
    );
    
  }
}