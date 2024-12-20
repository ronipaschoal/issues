import 'package:flutter/material.dart';
import 'package:issues/domain/models/issue_model.dart';
import 'package:issues/ui/ui_theme.dart';

class HomeIssueCardWidget extends StatelessWidget {
  final IssueModel issue;

  const HomeIssueCardWidget({
    super.key,
    required this.issue,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      child: Container(
        height: 80.0,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(issue.id),
              UiTheme.spacerSmall,
              Text(issue.title),
            ],
          ),
        ),
      ),
    );
  }
}
