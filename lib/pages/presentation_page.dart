
import 'package:flutter/material.dart';
import 'package:histofish_app/core/i18n/app_language.dart';
import 'package:histofish_app/core/settings/app_settings.dart';
import 'package:histofish_app/data/models/presentation_model.dart';
import 'package:histofish_app/data/repositories/content_repository.dart';
import 'package:provider/provider.dart';

class PresentationPage extends StatelessWidget {
  const PresentationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final langCode = context.select(
      (AppSettings s) => s.currentLanguage?.code ?? 'pt', 
    );
    final repo = context.read<ContentRepository>();
    


    return FutureBuilder<PresentationModel>(
      future: repo.getPresentation(langCode),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: const Text("Apresentação")),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Erro ao carregar apresentação: ${snapshot.error}'),
            ),
          );
        }

        final p = snapshot.data!;
        final pageTitle = p.title.isNotEmpty ? p.title : (langCode == 'pt' ? 'Apresentação' : 'Presentation');

        return Scaffold(
          appBar: AppBar(title: Text(pageTitle)),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (p.headline.isNotEmpty) ...[
                  Text(
                    p.headline,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                ],

                ...p.paragraphs.map((t) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(t, style: Theme.of(context).textTheme.bodyMedium),
                    )),

                if (p.closing.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    p.closing,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}