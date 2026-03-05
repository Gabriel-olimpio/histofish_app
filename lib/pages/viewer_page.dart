import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:histofish_app/core/i18n/app_language.dart';
import 'package:histofish_app/core/routing/app_paths.dart';
import 'package:histofish_app/core/settings/app_settings.dart';
import 'package:provider/provider.dart';

class ViewerPage extends StatelessWidget {
  const ViewerPage({super.key});

    // adicionar logica para mudar o idioma dos textos

  @override
  Widget build(BuildContext context) {
    final langCode = context.select(
      (AppSettings s) => s.currentLanguage?.code ?? 'pt'
    );
    
    final presentationLabel = langCode == 'pt' ? "Apresentação" : "Presentation";
    final organsLabel = langCode == 'pt' ? "Órgãos Alvo" : "Target Organs";
    final settingsLabel = langCode == 'pt' ? "Configurações" : "Settings";


    return Scaffold(
      appBar: AppBar(title: Text("HistoFish App"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),

            ElevatedButton(onPressed: () => context.push(AppPaths.presentation), child: Text(presentationLabel)),
          
            const SizedBox(height: 12),

            ElevatedButton(onPressed: () => context.push(AppPaths.organs), child: Text(organsLabel)),

            const SizedBox(height: 12),

            ElevatedButton(onPressed: () => context.push(AppPaths.settings), child: Text(settingsLabel)),
          ],
        ),
      ),
    );
  }
}