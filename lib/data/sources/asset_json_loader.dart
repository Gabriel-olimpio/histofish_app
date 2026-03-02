import 'dart:convert';

import 'package:flutter/services.dart';

class AssetJsonLoader {
  Future<Map<String, dynamic>> loadMap(String assetPath) async {
    final jsonString = await rootBundle.loadString(assetPath);
    final decoded = jsonDecode(jsonString);
    return decoded as Map<String, dynamic>;
  }
}