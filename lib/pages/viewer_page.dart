import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ViewerPage extends StatelessWidget {
  const ViewerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Viewer"),),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            ElevatedButton(onPressed: () => context.push('/presentation'), child: Text("Apresentação")),
            ElevatedButton(onPressed: () => context.push('/organs'), child: Text("Orgãos Alvo")),
          ],
        ),
      ),
    );
  }
}