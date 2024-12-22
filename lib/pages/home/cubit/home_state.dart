part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<IssueModel> issueList;
  final int currentPageIndex;

  HomeLoaded({
    required this.issueList,
    this.currentPageIndex = 0,
  });

  HomeLoaded copyWith({
    List<IssueModel>? issueList,
    int? currentPageIndex,
  }) {
    return HomeLoaded(
      issueList: issueList ?? this.issueList,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
    );
  }
}

final class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
