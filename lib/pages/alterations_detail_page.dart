import 'package:flutter/material.dart';

class AlterationsDetailPage extends StatelessWidget {
  final String organId;
  final String alterationId;
  const AlterationsDetailPage({super.key, required this.organId, required this.alterationId});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalhe de Alterações: $alterationId"),),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text("Muito texto")
          ],
        ),
      ),
    );
  }
}