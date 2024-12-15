import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:issues/domain/models/issue_model.dart';

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
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
        child: Container(
          height: 80.0,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.05),
            border: Border.all(
              color: Colors.grey.withOpacity(0.2),
              width: 1.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
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
                const SizedBox(height: 8.0),
                Text(issue.title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
