import 'package:histofish_app/data/models/organs_catalog.dart';
import 'package:histofish_app/data/sources/asset_json_loader.dart';

class ContentRepository {
  final AssetJsonLoader _loader;

  final Map<String, OrgansCatalog> _organsCache = {};

  ContentRepository(this._loader);

  Future<OrgansCatalog> getOrgansCatalog(String langCode) async {
    if(_organsCache.containsKey(langCode)) return _organsCache[langCode]!;

    final path = 'assets/content/$langCode/organs.json'; 
    final map = await _loader.loadMap(path);

    final catalog = OrgansCatalog.fromJson(map);
    _organsCache[langCode] = catalog;
    return catalog;
  }
}