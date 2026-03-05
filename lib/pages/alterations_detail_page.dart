import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:histofish_app/core/i18n/app_language.dart';
import 'package:provider/provider.dart';

import 'package:histofish_app/core/routing/app_paths.dart';
import 'package:histofish_app/core/settings/app_settings.dart';
import 'package:histofish_app/data/models/alterations_catalog_model.dart';
import 'package:histofish_app/data/models/alterations_item_model.dart';
import 'package:histofish_app/data/repositories/content_repository.dart';

class AlterationsDetailPage extends StatelessWidget {
  final String organId;
  final String alterationId;

  const AlterationsDetailPage({
    super.key,
    required this.organId,
    required this.alterationId,
  });

  @override
  Widget build(BuildContext context) {
    final langCode = context.select(
      (AppSettings s) => s.currentLanguage?.code ?? 'pt',
    );
    final repo = context.read<ContentRepository>();

    return FutureBuilder<AlterationsCatalogModel>(
      future: repo.getAlterationsCatalog(langCode, organId),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Erro ao carregar detalhe: ${snapshot.error}'),
            ),
          );
        }

        final catalog = snapshot.data!;
        final items = catalog.items;

        // achar índice do item atual
        final currentIndex = items.indexWhere((e) => e.id == alterationId);

        if (currentIndex == -1) {
          return Scaffold(
            appBar: AppBar(title: const Text('Not found')),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                langCode == 'pt'
                    ? 'Alteração "$alterationId" não encontrada.'
                    : 'Alteration "$alterationId" not found.',
              ),
            ),
          );
        }

        final AlterationsItemModel current = items[currentIndex];

        final bool hasPrev = currentIndex > 0;
        final bool hasNext = currentIndex < items.length - 1;

        final String? prevId = hasPrev ? items[currentIndex - 1].id : null;
        final String? nextId = hasNext ? items[currentIndex + 1].id : null;

        void goTo(String targetId) {
          // Importante: use GO (replace) para não empilhar histórico
          context.pushReplacement(AppPaths.alterationsDetail(organId, targetId));
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(
              current.title.isNotEmpty ? current.title : '(${current.id})',
            ),
            actions: [
              IconButton(
                tooltip: langCode == 'pt' ? 'Anterior' : 'Previous',
                onPressed: hasPrev ? () => goTo(prevId!) : null,
                icon: const Icon(Icons.chevron_left),
              ),
              IconButton(
                tooltip: langCode == 'pt' ? 'Próximo' : 'Next',
                onPressed: hasNext ? () => goTo(nextId!) : null,
                icon: const Icon(Icons.chevron_right),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [

              if (current.caption.isNotEmpty) ...[
                Text(current.caption),
                const SizedBox(height: 12),
              ],

              if (current.image.isNotEmpty) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    current.image,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Imagem não encontrada. Verifique assets/pubspec.'),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],


              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (current.imageMeta.label.isNotEmpty)
                    Chip(label: Text(current.imageMeta.label)),
                  if (current.imageMeta.magnification.isNotEmpty)
                    Chip(label: Text(current.imageMeta.magnification)),
                  if (current.imageMeta.stain.isNotEmpty)
                    Chip(label: Text(current.imageMeta.stain)),
                ],
              ),

              const SizedBox(height: 16),

              Text(
                langCode == 'pt'
                    ? 'Item ${currentIndex + 1} de ${items.length}'
                    : 'Item ${currentIndex + 1} of ${items.length}',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        );
      },
    );
  }
}