class IssueModel {
  final String id;
  final String title;
  final String state;

  IssueModel({
    required this.id,
    required this.title,
    required this.state,
  });

  factory IssueModel.fromJson(Map<String, dynamic> json) {
    return IssueModel(
      id: json['id'],
      title: json['title'],
      state: json['state'],
    );
  }
}
