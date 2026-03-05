import 'package:histofish_app/data/models/image_meta_model.dart';

class AlterationsItemModel {
  final String id;
  final String title;
  final String caption;
  final String image;

  final ImageMetaModel imageMeta;

  const AlterationsItemModel({
    required this.id,
    required this.title,
    required this.caption,
    required this.image,
    required this.imageMeta,
  });


  factory AlterationsItemModel.fromJson(Map<String, dynamic> json) {
    return AlterationsItemModel(
      id: (json['id'] as String?) ?? '' ,
      title: (json['title'] as String?) ?? '' ,
      caption: (json['caption'] as String?) ?? '' ,
      image: (json['image'] as String?) ?? '' ,
      imageMeta: ImageMetaModel.fromJson(
        (json['imageMeta'] as Map<String, dynamic>?) ?? const {},
      ),  
    );
  }
}