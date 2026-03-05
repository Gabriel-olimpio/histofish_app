import 'package:histofish_app/data/models/alterations_item_model.dart';

class AlterationsCatalogModel {
  final String organId;
  final String title;
  final List<AlterationsItemModel> items;

  const AlterationsCatalogModel({

    required this.organId,
    required this.title,
    required this.items,
  });

  factory AlterationsCatalogModel.fromJson(Map<String, dynamic> json) {
    final rawItems = (json['items'] as List<dynamic>?) ?? const [];

    return AlterationsCatalogModel(
      organId: (json['organId'] as String?) ?? '' ,
      title: (json['title'] as String?) ?? '' ,
      items: rawItems
        .map((e) => AlterationsItemModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    );
  }
}