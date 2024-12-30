import 'dart:convert';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:issues/data/repositories/issues/issues_repository.dart';
import 'package:issues/domain/models/home_page_model.dart';
import 'package:issues/domain/models/issue_model.dart';

part 'home_state.dart';

class HomeCubit extends HydratedCubit<HomeState> {
  final IssuesRepository issuesRepository;

  HomeCubit(this.issuesRepository) : super(HomeInitial());

  @override
  HomeState fromJson(Map<String, dynamic> json) {
    try {
      final initialData = HomeLoaded.fromJson(json);
      emit(initialData);
      return initialData;
    } catch (error) {
      emit(HomeError('Failed to load issues: $error'));
    }
    return HomeInitial();
  }

  @override
  Map<String, dynamic> toJson(HomeState state) {
    return (state as HomeLoaded).toJson();
  }

  void setPageIndex(HomePageEnum page) {
    final state = this.state;
    if (state is! HomeLoaded) return;
    emit(state.copyWith(currentPage: page));
  }

  void getIssues() async {
    try {
      final state = this.state;

      final issueList = await issuesRepository.getIssues();
      await Future.delayed(const Duration(seconds: 1));

      if (state is! HomeLoaded) {
        emit(HomeLoaded(issueList: issueList));
        return;
      }

      final currentList = state.issueList;
      issueList.map((issue) {
        final index = currentList
            .indexWhere((currentIssue) => currentIssue.id == issue.id);

        if (index != -1) {
          currentList[index] = issue;
        } else {
          currentList.add(issue);
        }
      }).toList();
      emit(HomeLoaded(issueList: currentList));
    } catch (e) {
      emit(HomeError('Failed to load issues'));
    }
  }

  void createIssue(IssueModel issue) {
    final state = this.state;
    if (state is! HomeLoaded) return;
    emit(
      state.copyWith(
        currentPage: HomePageEnum.issueList,
        issueList: [
          ...state.issueList,
          issue,
        ],
      ),
    );
  }

  void removeIssue(String id) {
    final state = this.state;
    if (state is! HomeLoaded) return;
    emit(
      state.copyWith(
        issueList: state.issueList.where((issue) => issue.id != id).toList(),
      ),
    );
  }
}
