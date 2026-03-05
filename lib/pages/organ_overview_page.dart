import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:histofish_app/core/i18n/app_language.dart';
import 'package:provider/provider.dart';

import 'package:histofish_app/core/routing/app_paths.dart';
import 'package:histofish_app/core/settings/app_settings.dart';
import 'package:histofish_app/data/repositories/content_repository.dart';
import 'package:histofish_app/data/models/organs_catalog.dart';
import 'package:histofish_app/data/models/organ_item.dart';

class OrganOverviewPage extends StatelessWidget {
  final String organId;
  const OrganOverviewPage({super.key, required this.organId});

  @override
  Widget build(BuildContext context) {
    final langCode = context.select(
      (AppSettings s) => s.currentLanguage?.code ?? 'pt',
    );
    final repo = context.read<ContentRepository>();

    return FutureBuilder<OrgansCatalog>(
      future: repo.getOrgansCatalog(langCode),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: Center(child: Text(snapshot.error.toString())),
          );
        }

        final catalog = snapshot.data!;

        // Achar o órgão correspondente ao organId
        final OrganItem organ = catalog.items.firstWhere(
          (o) => o.id == organId,
          orElse: () => OrganItem(
            id: organId,
            name: organId,
            description: '',
          ),
        );

        final normalLabel = langCode == 'pt' ? 'Tecido normal' : 'Normal tissue';
        final altLabel = langCode == 'pt' ? 'Alterações' : 'Alterations';

        return Scaffold(
          appBar: AppBar(title: Text(organ.name)),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (organ.description.isNotEmpty) ...[
                  Text(
                    organ.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                ],

              
                const SizedBox(height: 8),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => context.push(AppPaths.normal(organId)),
                    child: Text(normalLabel),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => context.push(AppPaths.alterations(organId)),
                    child: Text(altLabel),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}