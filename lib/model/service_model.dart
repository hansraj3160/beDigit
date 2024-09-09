import 'package:nexime/util/app_export.dart';

class ServiceModel {
  final String title;
  final String imgPath;
  final Color color;

  ServiceModel({
    required this.title,
    required this.imgPath,
    required this.color,
  });

  // Factory constructor to create an instance from a JSON-like Map
  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      title: json['title'],
      imgPath: json['imgPath'],
      color: json['color'],
    );
  }}