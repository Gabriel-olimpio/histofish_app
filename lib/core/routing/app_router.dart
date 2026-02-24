import 'package:go_router/go_router.dart';
import 'package:histofish_app/app/app.dart';
import 'package:histofish_app/core/routing/app_paths.dart';
import 'package:histofish_app/pages/language_selection_page.dart';
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
    path: AppPaths.organs,
    builder: (context, state) => const TargetOrgansPage(),
  ),
  GoRoute(
    path: AppPaths.viewer,
    builder: (context, state) => const ViewerPage(),
  ),
 ]
);