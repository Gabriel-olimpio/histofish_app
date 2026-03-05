import 'package:histofish_app/data/models/alterations_catalog_model.dart';
import 'package:histofish_app/data/models/normal_tissue_model.dart';
import 'package:histofish_app/data/models/organs_catalog.dart';
import 'package:histofish_app/data/sources/asset_json_loader.dart';

class ContentRepository {
  final AssetJsonLoader _loader;

  final Map<String, Map<String, dynamic>> _jsonCache = {};

  ContentRepository(this._loader);


  Future<Map<String, dynamic>> _loadCached(String assetPath) async {
    final cached = _jsonCache[assetPath];
    if (cached != null) return cached;

    final map = await _loader.loadMap(assetPath);
    _jsonCache[assetPath] = map;
    return map;
  }

  Future<OrgansCatalog> getOrgansCatalog(String langCode) async {
    final path = 'assets/content/$langCode/organs.json'; 
    final map = await _loadCached(path);
    return OrgansCatalog.fromJson(map);
  }


  Future<NormalTissueModel> getNormalTissue(langCode, organId) async {
    final path = 'assets/content/$langCode/$organId/normal_tissue.json';
    final map = await _loadCached(path);
    return NormalTissueModel.fromJson(map);
  }

  Future<AlterationsCatalogModel> getAlterationsCatalog(langCode, organId) async {
    final path = 'assets/content/$langCode/$organId/alterations.json';
    final map = await _loadCached(path);
    return AlterationsCatalogModel.fromJson(map);
  }
}