import 'package:histofish_app/data/models/image_meta_model.dart';

class NormalTissueModel {
  final String organId;
  final String title;
  final String caption;
  final String image;

  final ImageMetaModel imageMeta;
  final List<String> keyFeatures;

  NormalTissueModel({
    required this.organId,
    required this.title,
    required this.caption,
    required this.image,
    required this.imageMeta,
    required this.keyFeatures,
  });


  factory NormalTissueModel.fromJson(Map<String, dynamic> json) {
    final rawKeyFeatures = (json['keyFeatures'] as List<dynamic>?) ?? const [];

    return NormalTissueModel(
      organId: (json['organId'] as String?) ?? '' ,
      title:(json['title'] as String?) ?? '' ,
      caption: (json['caption'] as String?) ?? '',
      image: (json['image'] as String?) ?? '',
      imageMeta: ImageMetaModel.fromJson(
        (json['imageMeta'] as Map<String, dynamic>?) ?? const {},
      ),
      keyFeatures: rawKeyFeatures.map((e) => e.toString()).toList(),
    );
  }
}