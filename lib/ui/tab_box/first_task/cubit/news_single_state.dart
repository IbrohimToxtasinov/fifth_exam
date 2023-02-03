part of 'news_single_cubit.dart';

// ignore: must_be_immutable
class NewsSingleState extends Equatable {
  Status status;
 final String error;
  NewsModel? newsModel;

  NewsSingleState({
   required this.status,
    required this.error,
    this.newsModel,
});

  NewsSingleState copyWith({
    Status? status,
     String? error,
    NewsModel? newsModel,
  }) {
    return NewsSingleState(
        error: error ?? this.error,
        newsModel: newsModel ?? this.newsModel,
        status: status ?? this.status);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, error, newsModel];
}

enum Status { PURE, LOADING, ERROR, SUCCESS }