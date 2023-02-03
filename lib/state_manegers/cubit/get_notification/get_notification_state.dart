import 'package:fifth_exam/data/models/breaking_news/breaking_news_model.dart';

abstract class BreakingNewsCubitState {}

class InitialBreakingNewsState extends BreakingNewsCubitState {}

class LoadBreakingNewsProgress extends BreakingNewsCubitState {}

class LoadBreakingNewsSuccess extends BreakingNewsCubitState {
  LoadBreakingNewsSuccess({required this.breakingNewsModel});

  final List<BreakingNewsModel> breakingNewsModel;
}

class LoadBreakingNewsFailure extends BreakingNewsCubitState {}
