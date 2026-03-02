import 'package:flutter/material.dart';
import "package:histofish_app/app/app.dart";
import 'package:histofish_app/core/i18n/shared_prefs_language_storage.dart';
import 'package:histofish_app/core/routing/app_router.dart';
import 'package:histofish_app/core/settings/app_settings.dart';
import 'package:histofish_app/data/repositories/content_repository.dart';
import 'package:histofish_app/data/sources/asset_json_loader.dart';
import 'package:provider/provider.dart';

// main.dart: ponto de entrada do app (onde roda runApp(...))

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = SharedPrefsLanguageStorage();
  final settings = AppSettings(LanguageStorage: storage);
  await settings.init();

  final router = createRouter(settings);


  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider.value(value: settings),
      Provider<ContentRepository>(create: (_) => ContentRepository(AssetJsonLoader()),
      ),

    ],
    child: MyApp(router: router),
    )
  );
}


