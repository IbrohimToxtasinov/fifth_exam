import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fifth_exam/data/models/my_response/my_response_model.dart';
import 'package:fifth_exam/data/models/news/news_model.dart';
import 'package:fifth_exam/data/repositories/news_repository.dart';

part 'news_single_state.dart';

class NewsSingleStateCubit extends Cubit<NewsSingleState> {
  NewsSingleStateCubit({required this.newsRepository})
      : super(NewsSingleState());

  final NewsRepository newsRepository;

  fetchNewInfo() async {
    emit(NewsSingleState(status: Status.LOADING));
    MyResponse myResponse = await newsRepository.getNews();
    if (myResponse.error == "") {
      emit(state.copyWith(newsModel: myResponse.data, status: Status.SUCCESS));
    } else {
      emit(state.copyWith(error: myResponse.error, status: Status.ERROR));
    }
  }
}
