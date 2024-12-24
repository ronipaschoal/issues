import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:issues/domain/models/issue_model.dart';
import 'package:issues/pages/home/cubit/home_cubit.dart';
import 'package:issues/ui/ui_theme.dart';

class HomeNewIssueWidget extends StatelessWidget {
  final HomeCubit homeCubit;

  const HomeNewIssueWidget({
    super.key,
    required this.homeCubit,
  });

  @override
  Widget build(BuildContext context) {
    final titlePrefix = TextEditingController();
    final title = TextEditingController();
    final description = TextEditingController();
    final project = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: UiTheme.spacingMedium,
        children: [
          TextField(
            controller: titlePrefix,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.titlePrefix,
              labelText: AppLocalizations.of(context)!.titlePrefix,
              helper: Text(AppLocalizations.of(context)!.titlePrefixHelper),
            ),
          ),
          TextField(
            controller: title,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.title,
              labelText: AppLocalizations.of(context)!.title,
            ),
          ),
          TextField(
            controller: description,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.description,
              labelText: AppLocalizations.of(context)!.description,
            ),
          ),
          TextField(
            controller: project,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.project,
              labelText: AppLocalizations.of(context)!.project,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () => homeCubit.createIssue(
              IssueModel(
                id: UniqueKey().toString(),
                titlePrefix: titlePrefix.text,
                title: title.text,
                description: description.text,
                project: project.text,
              ),
            ),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
