import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:histofish_app/core/routing/app_paths.dart';

class AlterationsListPage extends StatelessWidget {
  final String organId;
  const AlterationsListPage({super.key, required this.organId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alterações'),),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            ElevatedButton(onPressed: () => context.push(AppPaths.alterationsDetail(organId, 'hyperplasia')), child: Text('Hyperplasia')),
          ],
        ),
      ),
    );
  }
}