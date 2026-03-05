
import 'package:histofish_app/data/models/organ_item.dart';

class OrgansCatalog {
  final String title;
  final List<OrganItem> items;

  OrgansCatalog({required this.title, required this.items});

  factory OrgansCatalog.fromJson(Map<String, dynamic> json) {
    final rawItems = (json['items'] as List<dynamic>? ?? const []);
    return OrgansCatalog(title: (json['title'] as String?) ?? '',
      items: rawItems.map((e) => OrganItem.fromJson(e as Map<String, dynamic>)).toList(),
    ); 
  }
}