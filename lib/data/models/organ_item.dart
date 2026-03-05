

class OrganItem {
  final String id;
  final String name;
  final String description;

  OrganItem({
    required this.id,
    required this.name,
    required this.description,
    
  });


  factory OrganItem.fromJson(Map<String, dynamic> json) {
    return OrganItem(id: json['id'] as String, name: json['name'] as String, description: (json['description'] as String?) ?? '',);
  }
}