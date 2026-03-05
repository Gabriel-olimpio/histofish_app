class ImageMetaModel {
  final String label;
  final String magnification;
  final String stain;

  final String? iconKey;
  final String? iconDescription;

  const ImageMetaModel({
    required this.label,
    required this.magnification,
    required this.stain,
    this.iconKey,
    this.iconDescription
  });


  factory ImageMetaModel.fromJson(Map<String, dynamic> json) {
    return ImageMetaModel(
      label: (json['label'] as String?) ?? '',
      magnification: (json['magnification'] as String?) ?? '',
      stain: (json['stain'] as String?) ?? '' ,
      iconKey: (json['iconKey'] as String?),
      iconDescription: (json['iconDescription'] as String?),
    );
  }
}