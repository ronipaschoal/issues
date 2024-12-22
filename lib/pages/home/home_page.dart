import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:issues/config/cubit/app_cubit.dart';
import 'package:issues/pages/home/cubit/home_cubit.dart';
import 'package:issues/pages/home/widgets/home_issue_card_widget.dart';
import 'package:issues/pages/home/widgets/home_menu_widget.dart';
import 'package:issues/pages/home/widgets/home_new_issue_widget.dart';
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
    final homeCubit = context.read<HomeCubit>();

    return UiScaffoldWidget(
      title: AppLocalizations.of(context)!.issues,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded) {
            if (state.currentPageIndex == 0) {
              if (state.issueList.isEmpty) {
                return Center(
                  child: Text(AppLocalizations.of(context)!.noIssues),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.all(UiTheme.spacingSmall),
                itemCount: state.issueList.length,
                separatorBuilder: (_, __) => UiTheme.spacerSmall,
                itemBuilder: (_, index) {
                  return HomeIssueCardWidget(issue: state.issueList[index]);
                },
              );
            }
            if (state.currentPageIndex == 1) {
              return const HomeNewIssueWidget();
            }
            if (state.currentPageIndex == 2) {
              return const HomeMenuWidget();
            }
          }
          return const SizedBox.shrink();
        },
      ),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            previous is HomeLoaded &&
            current is HomeLoaded &&
            previous.currentPageIndex != current.currentPageIndex,
        builder: (context, state) {
          return NavigationBar(
            backgroundColor:
                Theme.of(context).colorScheme.primary.withAlpha(20),
            surfaceTintColor: Colors.transparent,
            onDestinationSelected: (int index) {
              homeCubit.setPageIndex(index);
            },
            selectedIndex: state is HomeLoaded ? state.currentPageIndex : 0,
            destinations: <Widget>[
              NavigationDestination(
                selectedIcon: const Icon(Icons.home),
                icon: const Icon(Icons.home_outlined),
                label: AppLocalizations.of(context)!.home,
              ),
              NavigationDestination(
                selectedIcon: const Icon(Icons.note_add),
                icon: const Icon(Icons.note_add_outlined),
                label: AppLocalizations.of(context)!.newIssue,
              ),
              NavigationDestination(
                selectedIcon: const Icon(Icons.menu),
                icon: const Icon(Icons.menu_outlined),
                label: AppLocalizations.of(context)!.menu,
              ),
            ],
          );
        },
      ),
    );
  }
}
