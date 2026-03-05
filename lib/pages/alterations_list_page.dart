import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:histofish_app/core/i18n/app_language.dart';
import 'package:histofish_app/data/models/alterations_item_model.dart';
import 'package:provider/provider.dart';

import 'package:histofish_app/core/routing/app_paths.dart';
import 'package:histofish_app/core/settings/app_settings.dart';
import 'package:histofish_app/data/repositories/content_repository.dart';
import 'package:histofish_app/data/models/alterations_catalog_model.dart';


class AlterationsListPage extends StatelessWidget {
  final String organId;
  const AlterationsListPage({super.key, required this.organId});

  @override
  Widget build(BuildContext context) {
    // Rebuild quando idioma muda
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
              child: Text('Erro ao carregar alterações: ${snapshot.error}'),
            ),
          );
        }

        final catalog = snapshot.data!;
        final title = catalog.title.isNotEmpty
            ? catalog.title
            : (langCode == 'pt' ? 'Alterações' : 'Alterations');

        if (catalog.items.isEmpty) {
          return Scaffold(
            appBar: AppBar(title: Text(title)),
            body: Center(
              child: Text(
                langCode == 'pt'
                    ? 'Nenhuma alteração encontrada.'
                    : 'No alterations found.',
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(title: Text(title)),
          body: ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: catalog.items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final AlterationsItemModel item = catalog.items[index];

              return Card(
                child: ListTile(
                  title: Text(item.title.isEmpty ? '(${item.id})' : item.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item.caption.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(item.caption, maxLines: 2, overflow: TextOverflow.ellipsis),
                      ],
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          if (item.imageMeta.magnification.isNotEmpty)
                            Chip(label: Text(item.imageMeta.magnification)),
                          if (item.imageMeta.stain.isNotEmpty)
                            Chip(label: Text(item.imageMeta.stain)),
                        ],
                      ),
                    ],
                  ),
                  onTap: () => context.push(
                    AppPaths.alterationsDetail(organId, item.id),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}