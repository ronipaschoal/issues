import 'package:issues/data/services/issues_services.dart';
import 'package:issues/domain/models/issue_model.dart';

class IssuesRepository {
  final IssuesServices _dataSource;

  IssuesRepository(this._dataSource);

  Future<List<IssueModel>> getIssues() async {
    return await _dataSource.getIssues();
  }
}
