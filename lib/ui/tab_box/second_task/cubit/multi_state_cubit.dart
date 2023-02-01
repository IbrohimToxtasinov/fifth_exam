import 'package:fifth_exam/data/models/my_response/my_response_model.dart';
import 'package:fifth_exam/data/repositories/news_repository.dart';
import 'package:fifth_exam/ui/tab_box/second_task/cubit/multi_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsMultiCubit extends Cubit<NewsMultiState> {
  NewsMultiCubit({required this.newsRepository})
      : super(InitialNewsState()) {
    _fetchNewsInfo();
  }

  final NewsRepository newsRepository;

  _fetchNewsInfo() async {
    emit(LoadNewsInProgress());
    MyResponse myResponse = await newsRepository.getNews();
    if (myResponse.error.isEmpty) {
      emit(LoadNewsInSuccess(newsModel: myResponse.data));
    } else {
      emit(LoadNewsInFailure(error: myResponse.error));
    }
  }
}
