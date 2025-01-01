import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:issues/config/cubit/app_cubit.dart';
import 'package:issues/ui/home/cubit/home_cubit.dart';
import 'package:issues/ui/home/widgets/home_issue_card_widget.dart';
import 'package:issues/ui/home/widgets/home_menu_widget.dart';
import 'package:issues/ui/home/widgets/home_new_issue_widget.dart';
import 'package:issues/domain/models/home_page_model.dart';
import 'package:issues/ui/core/theme/ui_theme.dart';
import 'package:issues/ui/core/widgets/ui_scaffold_widget.dart';

class HomePage extends StatelessWidget {
  final AppCubit appCubit;

  const HomePage({
    super.key,
    required this.appCubit,
  });

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return UiScaffoldWidget(
          title: state is HomeLoaded
              ? state.currentPage.translate(context)
              : AppLocalizations.of(context)!.issues,
          body: Builder(
            builder: (context) {
              if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeLoaded) {
                switch (state.currentPage) {
                  case HomePageEnum.issueList:
                    if (state.issueList.isEmpty) {
                      return Center(
                        child: Text(AppLocalizations.of(context)!.noIssues),
                      );
                    }
                    return ListView.separated(
                      padding: const EdgeInsets.all(UiTheme.sizeSmall),
                      itemCount: state.issueList.length,
                      separatorBuilder: (_, __) => UiTheme.spacerSmall,
                      itemBuilder: (_, index) => HomeIssueCardWidget(
                        issue: state.issueList[index],
                        onTap: () {},
                        onLongPress: () => homeCubit //
                            .removeIssue(state.issueList[index].id),
                      ),
                    );
                  case HomePageEnum.newIssue:
                    return HomeNewIssueWidget(
                      homeCubit: homeCubit,
                    );
                  case HomePageEnum.menu:
                    return HomeMenuWidget(
                      appCubit: appCubit,
                    );
                }
              }
              return const SizedBox.shrink();
            },
          ),
          bottomNavigationBar: Builder(
            builder: (context) {
              return NavigationBarTheme(
                data: NavigationBarThemeData(
                  labelTextStyle: WidgetStateProperty.all(
                    Theme.of(context).textTheme.bodySmall,
                  ),
                  iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
                    (states) {
                      if (states.contains(WidgetState.selected)) {
                        return IconThemeData(
                          color: Theme.of(context).colorScheme.surface,
                        );
                      }
                      return IconThemeData(
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      );
                    },
                  ),
                ),
                child: NavigationBar(
                  backgroundColor:
                      Theme.of(context).colorScheme.primary.withAlpha(10),
                  surfaceTintColor: Colors.transparent,
                  onDestinationSelected: (int index) =>
                      homeCubit.setPageIndex(HomePageEnum.values[index]),
                  selectedIndex: state is HomeLoaded
                      ? state.currentPage.index
                      : HomePageEnum.issueList.index,
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
                ),
              );
            },
          ),
        );
      },
    );
  }
}
