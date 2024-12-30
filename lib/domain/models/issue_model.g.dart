// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueModel _$IssueModelFromJson(Map<String, dynamic> json) => IssueModel(
      id: json['id'] as String,
      titlePrefix: json['titlePrefix'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      state: $enumDecodeNullable(_$IssueStateEnumEnumMap, json['state']) ??
          IssueStateEnum.open,
      project: json['project'] as String,
    );

Map<String, dynamic> _$IssueModelToJson(IssueModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titlePrefix': instance.titlePrefix,
      'title': instance.title,
      'description': instance.description,
      'state': _$IssueStateEnumEnumMap[instance.state]!,
      'project': instance.project,
    };

const _$IssueStateEnumEnumMap = {
  IssueStateEnum.open: 0,
  IssueStateEnum.closed: 1,
};
