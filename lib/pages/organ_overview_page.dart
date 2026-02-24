
import 'package:flutter/material.dart';

class OrganOverviewPage  extends StatelessWidget {
  final String organId;
  const OrganOverviewPage({super.key, required this.organId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orgão: $organId')),
      body: Center(
        child: Text('Overview do $organId'),
      ),
    );
  } 
}