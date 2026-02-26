

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:histofish_app/core/routing/app_paths.dart';

class TargetOrgansPage extends StatelessWidget {
  const TargetOrgansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Target Organs")),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            ElevatedButton(onPressed: () => context.push(AppPaths.organ('branquias')), child: Text('Brânquias')),
            ElevatedButton(onPressed: () => context.push(AppPaths.organ('figado')), child: Text('Figado')),
            ElevatedButton(onPressed: () => context.push(AppPaths.organ('rim')), child: Text('Rim')),
          ],
        )
      ),
    );
  }
}