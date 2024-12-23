import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:issues/data/repositories/issues/issues_repository.dart';
import 'package:issues/domain/models/home_page_model.dart';
import 'package:issues/domain/models/issue_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IssuesRepository issuesRepository;

  HomeCubit(this.issuesRepository) : super(HomeInitial());

  void getIssues() async {
    emit(HomeLoading());
    try {
      final issueList = await issuesRepository.getIssues();
      await Future.delayed(const Duration(seconds: 2));

      emit(HomeLoaded(issueList: issueList));
    } catch (e) {
      emit(HomeError('Failed to load issues'));
    }
  }

  void setPageIndex(HomePageEnum page) {
    if (state is HomeLoaded) {
      emit((state as HomeLoaded).copyWith(currentPage: page));
    }
  }
}
