import 'package:flutter/material.dart';
import 'package:histofish_app/core/i18n/app_language.dart';
import 'package:provider/provider.dart';

import 'package:histofish_app/core/settings/app_settings.dart';
import 'package:histofish_app/data/repositories/content_repository.dart';
import 'package:histofish_app/data/models/normal_tissue_model.dart';

class NormalTissuePage extends StatelessWidget {
  final String organId;
  const NormalTissuePage({super.key, required this.organId});

  @override
  Widget build(BuildContext context) {
    // Rebuild quando idioma muda
    final langCode = context.select(
      (AppSettings s) => s.currentLanguage?.code ?? 'pt',
    );

    final normalLabel = langCode == 'pt' ? "Tecido Normal" : "Normal Tissue";

    final repo = context.read<ContentRepository>();

    return FutureBuilder<NormalTissueModel>(
      future: repo.getNormalTissue(langCode, organId),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: Text(normalLabel)),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Erro ao carregar conteúdo: ${snapshot.error}'),
            ),
          );
        }

        final data = snapshot.data!;
        return Scaffold(
          appBar: AppBar(title: Text(data.title.isEmpty ? 'Tecido Normal' : data.title)),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [

              if (data.caption.isNotEmpty) ...[
                Text(
                  data.caption,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 12),
              ],

              // Imagem (só mostra se você colocou um path válido no JSON)
              if (data.image.isNotEmpty) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    data.image,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Imagem não encontrada (verifique assets e pubspec.yaml).'),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],


              // Meta (label / magnification / stain)
              if (data.imageMeta.label.isNotEmpty ||
                  data.imageMeta.magnification.isNotEmpty ||
                  data.imageMeta.stain.isNotEmpty) ...[
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    if (data.imageMeta.label.isNotEmpty)
                      Chip(label: Text(data.imageMeta.label)),
                    if (data.imageMeta.magnification.isNotEmpty)
                      Chip(label: Text(data.imageMeta.magnification)),
                    if (data.imageMeta.stain.isNotEmpty)
                      Chip(label: Text(data.imageMeta.stain)),
                  ],
                ),
                const SizedBox(height: 16),
              ],

              // Key features
              
              const SizedBox(height: 8),

              ...data.keyFeatures.map(
                (f) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('•  '),
                      Expanded(child: Text(f)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}