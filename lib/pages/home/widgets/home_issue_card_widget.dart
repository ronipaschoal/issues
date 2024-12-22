import 'dart:ui';
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
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 80.0,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withAlpha(80),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        issue.id,
                      ),
                      UiTheme.spacerSmall,
                      Text(
                        issue.title,
                        style: const TextStyle(fontSize: UiTheme.fontSizeSmall),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.primary,
                    size: UiTheme.fontSizeRegular,
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
