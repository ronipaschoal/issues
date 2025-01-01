import 'package:issues/domain/models/issue_model.dart';

class IssuesServices {
  Future<List<IssueModel>> getIssues() async {
    // TODO Get issues from the server
    await Future.delayed(const Duration(seconds: 1));
    return [];
  }

  Future<void> addIssue(IssueModel issue) async {
    // TODO Add issue to the server
  }

  Future<void> updateIssue(IssueModel issue) async {
    // TODO Update issue on the server
  }

  Future<void> deleteIssue(IssueModel issue) async {
    // TODO Delete issue from the server
  }
}
