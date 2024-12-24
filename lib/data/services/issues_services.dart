import 'package:issues/domain/models/issue_model.dart';

class IssuesServices {
  Future<List<IssueModel>> getIssues() async {
    return [
      IssueModel(
        id: '1',
        title: 'DHOSPMOBILE-1',
        description: 'Title Issue 1',
        project: 'Minha Comanda',
      ),
      IssueModel(
        id: '2',
        title: 'DHOSPMOBILE-2',
        description: 'Title Issue 2',
        project: 'Minha Comanda',
      ),
      IssueModel(
        id: '3',
        title: 'DHOSPMOBILE-3',
        description: 'Title Issue 3',
        project: 'Minha Comanda',
      ),
    ];
  }

  Future<void> addIssue(IssueModel issue) async {
    // Add issue to the server
  }

  Future<void> updateIssue(IssueModel issue) async {
    // Update issue on the server
  }

  Future<void> deleteIssue(IssueModel issue) async {
    // Delete issue from the server
  }
}
