

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:histofish_app/core/i18n/app_language.dart';
import 'package:histofish_app/core/routing/app_paths.dart';
import 'package:histofish_app/core/settings/app_settings.dart';
import 'package:histofish_app/data/repositories/content_repository.dart';
import 'package:provider/provider.dart';

class TargetOrgansPage extends StatelessWidget {
  const TargetOrgansPage({super.key});

  // arruma essa pagina melhor
    
  @override
  Widget build(BuildContext context) {
    final langCode = context.select(
      (AppSettings s) => s.currentLanguage?.code ?? 'pt,'
    );
    final repo = context.read<ContentRepository>(); 


    return FutureBuilder(
      future: repo.getOrgansCatalog(langCode),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: Center(child: Text(snapshot.error.toString()),),
          );
        }

        final catalog = snapshot.data!;
        return Scaffold(
          appBar: AppBar(title: Text(catalog.title),),
          body: ListView.separated(
            itemCount: catalog.items.length,
            separatorBuilder: (_, _) => const Divider(height: 0),
            itemBuilder: (context, index) {
              final organ = catalog.items[index];
              return ListTile(
                title: Text(organ.name),
                subtitle: organ.description.isEmpty ? null : Text(organ.description),
                onTap: () => context.push(AppPaths.organ(organ.id)),
              );
            },
          ),
        );
      }
    );
  }
}