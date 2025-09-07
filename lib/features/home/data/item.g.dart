// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  title: json['title'] as String,
  image: json['image'] as String,
  subtitle: json['subtitle'] as String?,
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'title': instance.title,
  'image': instance.image,
  'subtitle': instance.subtitle,
};
