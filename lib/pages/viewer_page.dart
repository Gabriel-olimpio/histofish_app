import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:histofish_app/core/routing/app_paths.dart';

class ViewerPage extends StatelessWidget {
  const ViewerPage({super.key});

    // adicionar logica para mudar o idioma dos textos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Viewer"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),

            ElevatedButton(onPressed: () => context.push(AppPaths.presentation), child: Text("Apresentação")),
          
            const SizedBox(height: 12),

            ElevatedButton(onPressed: () => context.push(AppPaths.organs), child: Text("Orgãos Alvo")),

            const SizedBox(height: 12),

            ElevatedButton(onPressed: () => context.push(AppPaths.settings), child: Text("Settings")),
          ],
        ),
      ),
    );
  }
}