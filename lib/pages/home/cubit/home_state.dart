part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<IssueModel> issueList;
  final HomePageEnum currentPage;

  HomeLoaded({
    required this.issueList,
    this.currentPage = HomePageEnum.issueList,
  });

  HomeLoaded copyWith({
    List<IssueModel>? issueList,
    HomePageEnum? currentPage,
  }) {
    return HomeLoaded(
      issueList: issueList ?? this.issueList,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}

final class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
