
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Linguagem')),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('Selecione o Idioma', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ElevatedButton(onPressed: () => context.go('/viewer'), child: Text('Português-BR')),
            ElevatedButton(onPressed: () => context.go('/viewer'), child: Text('English')),
          ],
        )
      ),
    );
    
  }
}