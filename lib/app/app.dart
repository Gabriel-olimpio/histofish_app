import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:histofish_app/core/routing/app_router.dart';
import 'package:histofish_app/core/theme/app_theme.dart';
// app.dart: o “widget raiz” (onde fica o MaterialApp, tema, rotas, providers etc.)

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'HistoFish',
      locale: const Locale("pt", "BR"),
      theme: appTheme(),
      routerConfig: appRoutes,
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
          mainAxisAlignment: .center,
          children: [
            const Text('Seja bem-vindo!', style: TextStyle(fontSize: 30, color: Colors.blueAccent, fontWeight: FontWeight.bold),),
            ElevatedButton(
              onPressed: () => context.push('/language'),
              child: const Text("Continuar"),
              ),
          ],
        ),
      ),
    );
  }

}


