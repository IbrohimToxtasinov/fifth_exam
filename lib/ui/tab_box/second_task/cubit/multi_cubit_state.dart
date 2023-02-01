import 'package:fifth_exam/data/models/news/news_model.dart';

abstract class NewsMultiState {}

class InitialNewsState extends NewsMultiState {}

class LoadNewsInProgress extends NewsMultiState {}

class LoadNewsInSuccess extends NewsMultiState {
  LoadNewsInSuccess({required this.newsModel});

  final NewsModel newsModel;
}

class LoadNewsInFailure extends NewsMultiState {
  LoadNewsInFailure({required this.error});

  String error;
}
