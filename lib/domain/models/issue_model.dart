enum IssueStateEnum {
  open,
  closed,
}

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

  factory IssueModel.fromJson(Map<String, dynamic> json) {
    return IssueModel(
      id: json['id'],
      titlePrefix: json['titlePrefix'],
      title: json['title'],
      description: json['description'],
      state: json['state'],
      project: json['project'],
    );
  }
}
