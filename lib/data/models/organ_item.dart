

class OrganItem {
  final String id;
  final String name;
  final List<String> descriptionParagraphs;

  OrganItem({
    required this.id,
    required this.name,
    required this.descriptionParagraphs,
    
  });


  factory OrganItem.fromJson(Map<String, dynamic> json) {
    // Preferência: lista de parágrafos
    final rawParagraphs = json['descriptionParagraphs'];

    List<String> paragraphs = [];

    if (rawParagraphs is List) {
      paragraphs = rawParagraphs.map((e) => e.toString()).toList();
    } else {
      // Compatibilidade: se ainda existir "description" como string
      final desc = (json['description'] as String?) ?? '';
      if (desc.isNotEmpty) {
        paragraphs = [desc];
      }
    }

    return OrganItem(
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      descriptionParagraphs: paragraphs,
    );
  }
}