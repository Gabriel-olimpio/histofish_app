import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:histofish_app/core/routing/app_paths.dart';
import 'package:histofish_app/core/settings/app_settings.dart';

// Pages
import 'package:histofish_app/app/app.dart';
import 'package:histofish_app/pages/language_selection_page.dart';
import 'package:histofish_app/pages/presentation_page.dart';
import 'package:histofish_app/pages/settings_page.dart';
import 'package:histofish_app/pages/viewer_page.dart';
import 'package:histofish_app/pages/target_organs_page.dart';
import 'package:histofish_app/pages/organ_overview_page.dart';
import 'package:histofish_app/pages/normal_tissue_page.dart';
import 'package:histofish_app/pages/alterations_list_page.dart';
import 'package:histofish_app/pages/alterations_detail_page.dart';

GoRouter createRouter(AppSettings settings) {
  return GoRouter(
    initialLocation: '/', // mantém o welcome como entrada
    refreshListenable: settings,

    redirect: (context, state) {
      final path = state.uri.path;
      final hasLang = settings.currentLanguage != null;

      // Rotas liberadas mesmo sem idioma (welcome e language)
      final isPublic = path == '/' || path == AppPaths.language;

      // 1) Sem idioma: qualquer rota (exceto / e /language) vai pra /language
      if (!hasLang && !isPublic) {
        return AppPaths.language;
      }

      // 2) Com idioma: se tentar ficar em /language, manda pro /viewer (hub)
      // if (hasLang && path == AppPaths.language) {
      //   return AppPaths.viewer;
      // }

      return null; // não redireciona
    },

    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MyHomePage(title: "HistoFish"),
      ),

      GoRoute(
        path: AppPaths.language,
        builder: (context, state) => const LanguageSelectionPage(),
      ),

      GoRoute(
        path: AppPaths.viewer, // HUB após escolher idioma
        builder: (context, state) => const ViewerPage(),
      ),

      GoRoute(
        path: AppPaths.presentation,
        builder: (context, state) => const PresentationPage(),
      ),

      GoRoute(
        path: AppPaths.settings,
        builder: (context, state) => const SettingsPage(),
      ),

      // /organs
      GoRoute(
        path: AppPaths.organs,
        builder: (context, state) => const TargetOrgansPage(),
        routes: [
          // /organs/:organId
          GoRoute(
            path: ':${AppPaths.organIdParam}',
            builder: (context, state) {
              final organId = state.pathParameters[AppPaths.organIdParam]!;
              return OrganOverviewPage(organId: organId);
            },
            routes: [
              // /organs/:organId/normal
              GoRoute(
                path: 'normal',
                builder: (context, state) {
                  final organId = state.pathParameters[AppPaths.organIdParam]!;
                  return NormalTissuePage(organId: organId);
                },
              ),

              // /organs/:organId/alterations
              GoRoute(
                path: 'alterations',
                builder: (context, state) {
                  final organId = state.pathParameters[AppPaths.organIdParam]!;
                  return AlterationsListPage(organId: organId);
                },
                routes: [
                  // /organs/:organId/alterations/:alterationId
                  GoRoute(
                    path: ':${AppPaths.alterationIdParam}',
                    builder: (context, state) {
                      final organId =
                          state.pathParameters[AppPaths.organIdParam]!;
                      final alterationId =
                          state.pathParameters[AppPaths.alterationIdParam]!;
                      return AlterationsDetailPage(
                        organId: organId,
                        alterationId: alterationId,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],

    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Route error')),
      body: Center(child: Text(state.error.toString())),
    ),
  );
}