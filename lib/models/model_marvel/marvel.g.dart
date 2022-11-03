// GENERATED CODE - DO NOT MODIFY BY HAND

part of marvel;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MarvelResponse _$$_MarvelResponseFromJson(Map<String, dynamic> json) =>
    _$_MarvelResponse(
      MarvelData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MarvelResponseToJson(_$_MarvelResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$_MarvelData _$$_MarvelDataFromJson(Map<String, dynamic> json) =>
    _$_MarvelData(
      (json['results'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      json['total'] as int,
    );

Map<String, dynamic> _$$_MarvelDataToJson(_$_MarvelData instance) =>
    <String, dynamic>{
      'results': instance.results,
      'total': instance.total,
    };
