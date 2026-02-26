
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:histofish_app/core/routing/app_paths.dart';

class OrganOverviewPage  extends StatelessWidget {
  final String organId;
  const OrganOverviewPage({super.key, required this.organId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orgão: $organId')),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text('Overview do $organId'),
            ElevatedButton(onPressed: () => context.push(AppPaths.normal(organId)), child: Text("Tecido Normal")),
            ElevatedButton(onPressed: () => context.push(AppPaths.alterations(organId)), child: Text("Alteracões")),
          ],
        ), 
      ),
    );
  } 
}