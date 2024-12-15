import 'package:issues/domain/models/issue_model.dart';

class IssuesServices {
  Future<List<IssueModel>> getIssues() async {
    return [
      IssueModel(
        id: 'DHOSPMOBILE-1',
        title: 'Title Issue 1',
        state: 'open',
      ),
      IssueModel(
        id: 'DHOSPMOBILE-2',
        title: 'Title Issue 2',
        state: 'open',
      ),
      IssueModel(
        id: 'DHOSPMOBILE-3',
        title: 'Title Issue 3',
        state: 'open',
      ),
      IssueModel(
        id: 'DHOSPMOBILE-4',
        title: 'Title Issue 4',
        state: 'open',
      ),
      IssueModel(
        id: 'DHOSPMOBILE-5',
        title: 'Title Issue 5',
        state: 'open',
      ),
      IssueModel(
        id: 'DHOSPMOBILE-6',
        title: 'Title Issue 6',
        state: 'open',
      ),
      IssueModel(
        id: 'DHOSPMOBILE-7',
        title: 'Title Issue 7',
        state: 'open',
      ),
      IssueModel(
        id: 'DHOSPMOBILE-8',
        title: 'Title Issue 8',
        state: 'open',
      ),
      IssueModel(
        id: 'DHOSPMOBILE-9',
        title: 'Title Issue 9',
        state: 'open',
      ),
      IssueModel(
        id: 'DHOSPMOBILE-10',
        title: 'Title Issue 10',
        state: 'open',
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
