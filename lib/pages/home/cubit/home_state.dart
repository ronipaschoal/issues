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

  factory HomeLoaded.fromJson(Map<String, dynamic> map) {
    return HomeLoaded(
      issueList: (jsonDecode(map['issueList']) as List)
          .map((issue) => IssueModel.fromJson(issue))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'issueList': jsonEncode(
        issueList.map((issue) => issue.toJson()).toList(),
      ),
    };
  }
}

final class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
