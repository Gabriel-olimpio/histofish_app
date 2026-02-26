
import 'package:flutter/material.dart';

class NormalTissuePage extends StatelessWidget {
  final String organId;
  const NormalTissuePage({super.key, required this.organId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tecido Normal'),),
      body: const Center(
        child: Text('Página do Tecido Normal'),
      ),
    );
  }
}