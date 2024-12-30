import 'package:json_annotation/json_annotation.dart';

part 'issue_model.g.dart';

enum IssueStateEnum {
  @JsonValue(0)
  open,
  @JsonValue(1)
  closed,
}

@JsonSerializable()
class IssueModel {
  final String id;
  final String? titlePrefix;
  final String title;
  final String description;
  final IssueStateEnum state;
  final String project;

  IssueModel({
    required this.id,
    this.titlePrefix,
    required this.title,
    required this.description,
    this.state = IssueStateEnum.open,
    required this.project,
  });

  factory IssueModel.fromJson(Map<String, dynamic> json) =>
      _$IssueModelFromJson(json);

  Map<String, dynamic> toJson() => _$IssueModelToJson(this);
}
