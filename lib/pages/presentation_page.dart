
import 'package:flutter/material.dart';

class PresentationPage extends StatelessWidget {
  const PresentationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Apresentação")),
      body: const Center(
        child: Text("Página de Apresentação"),
      ),
    );
  }
}