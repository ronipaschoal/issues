import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:issues/domain/models/issue_model.dart';
import 'package:issues/ui/ui_theme.dart';

class HomeIssueCardWidget extends StatelessWidget {
  final IssueModel issue;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const HomeIssueCardWidget({
    super.key,
    required this.issue,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: Container(
            height: 80.0,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface.withAlpha(80),
              border: Border.all(
                width: 2.0,
                color: Theme.of(context).colorScheme.primary.withAlpha(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(issue.title),
                      UiTheme.spacerSmall,
                      Text(
                        issue.description,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.primary,
                    size: UiTheme.fontSizeMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
