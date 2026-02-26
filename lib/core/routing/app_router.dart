import 'package:go_router/go_router.dart';
import 'package:histofish_app/app/app.dart';
import 'package:histofish_app/core/routing/app_paths.dart';
import 'package:histofish_app/pages/alterations_detail_page.dart';
import 'package:histofish_app/pages/alterations_list_page.dart';
import 'package:histofish_app/pages/language_selection_page.dart';
import 'package:histofish_app/pages/normal_tissue_page.dart';
import 'package:histofish_app/pages/organ_overview_page.dart';
import 'package:histofish_app/pages/presentation_page.dart';
import 'package:histofish_app/pages/settings_page.dart';
import 'package:histofish_app/pages/target_organs_page.dart';
import 'package:histofish_app/pages/viewer_page.dart';

final appRoutes = GoRouter(
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
    path: AppPaths.presentation,
    builder: (context, state) => const PresentationPage(),
  ),
  GoRoute(
    path: AppPaths.settings,
    builder: (context, state) => const SettingsPage(),
  ),
  GoRoute(
    path: AppPaths.viewer,
    builder: (context, state) => const ViewerPage(),
  ),
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
              final organId = state.pathParameters[AppPaths.alterationIdParam]!;
              return AlterationsListPage(organId: organId);
            },
            routes: [
            // /organs/:organId/alterations/:alterationsId
            GoRoute(
              path: ':${AppPaths.alterationIdParam}',
              builder: (context, state) {
                final organId = state.pathParameters[AppPaths.organIdParam]!;
                final alterationId = state.pathParameters[AppPaths.alterationIdParam]!;
                return AlterationsDetailPage(organId: organId, alterationId: alterationId);
              }
            )
            ]
          )
        ]
      )
    ],
  ),
 ]
);