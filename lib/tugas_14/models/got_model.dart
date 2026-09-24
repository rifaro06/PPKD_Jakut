import 'package:json_annotation/json_annotation.dart';

part 'got_model.g.dart';

@JsonSerializable()
class GotCharacterModel {
  final int id;
  final String firstName;
  final String lastName;
  final String fullName;
  final String title;
  final String family;
  final String image;
  final String imageUrl;

  GotCharacterModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.title,
    required this.family,
    required this.image,
    required this.imageUrl,
  });

  factory GotCharacterModel.fromJson(Map<String, dynamic> json) =>
      _$GotCharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$GotCharacterModelToJson(this);
}