import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:histofish_app/core/i18n/app_language.dart';
import 'package:histofish_app/core/routing/app_paths.dart';
import 'package:histofish_app/core/settings/app_settings.dart';
import 'package:histofish_app/core/theme/app_theme.dart';
import 'package:provider/provider.dart';
// app.dart: o “widget raiz” (onde fica o MaterialApp, tema, rotas, providers etc.)

class MyApp extends StatelessWidget {

  final GoRouter router;

  const MyApp({super.key, required this.router});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final settings = context.watch<AppSettings>();

    final locale = settings.currentLanguage == null
      ? null
      : Locale(settings.currentLanguage!.code);


    return MaterialApp.router(
      title: 'HistoFish',
      theme: appTheme(),
      routerConfig: router,
      locale: locale,
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Seja bem-vindo!', style: TextStyle(fontSize: 30, color: Colors.blueAccent, fontWeight: FontWeight.bold),),
            const SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () => context.push(AppPaths.language),
              child: const Text("Continuar"),
              ),
          ],
        ),
      ),
    );
  }

}


