import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:issues/config/cubit/app_cubit.dart';
import 'package:issues/pages/home/cubit/home_cubit.dart';
import 'package:issues/pages/home/widgets/home_issue_card_widget.dart';
import 'package:issues/ui/ui_theme.dart';
import 'package:issues/ui/widgets/ui_scaffold_widget.dart';

class HomePage extends StatelessWidget {
  final AppCubit appCubit;

  const HomePage({
    super.key,
    required this.appCubit,
  });

  @override
  Widget build(BuildContext context) {
    return UiScaffoldWidget(
      title: AppLocalizations.of(context)!.issues,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.all(UiTheme.spacingSmall),
              itemCount: state.issueList.length,
              separatorBuilder: (_, __) => UiTheme.spacerSmall,
              itemBuilder: (_, index) {
                return HomeIssueCardWidget(issue: state.issueList[index]);
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
