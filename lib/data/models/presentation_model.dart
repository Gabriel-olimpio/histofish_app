class PresentationModel {
  final String title;
  final String headline;
  final List<String> paragraphs;
  final String closing;
  

  const PresentationModel({
    required this.title,
    required this.headline,
    required this.paragraphs,
    required this.closing,
    
  });

  factory PresentationModel.fromJson(Map<String, dynamic> json) {
    final raw = (json['paragraphs'] as List<dynamic>?) ?? const [];
    return PresentationModel(
      title: (json['title'] as String?) ?? '',
      headline: (json['headline'] as String?) ?? '',
      paragraphs: raw.map((e) => e.toString()).toList(),
      closing: (json['closing'] as String?) ?? '',
    );
  }
}