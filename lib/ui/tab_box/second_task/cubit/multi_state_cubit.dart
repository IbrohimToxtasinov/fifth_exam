import 'package:fifth_exam/data/models/my_response/my_response_model.dart';
import 'package:fifth_exam/data/services/api_service/api_service.dart';
import 'package:fifth_exam/ui/tab_box/second_task/cubit/multi_cubit_state.dart';
import 'package:fifth_exam/utils/my_locale.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsMultiCubit extends Cubit<NewsMultiState> {
  NewsMultiCubit() : super(InitialNewsState()) {
    _fetchNewsInfo();
  }

  _fetchNewsInfo() async {
    emit(LoadNewsInProgress());
    MyResponse myResponse = await myLocator<ApiService>().getNews();
    if (myResponse.error.isEmpty) {
      emit(LoadNewsInSuccess(newsModel: myResponse.data));
    } else {
      emit(LoadNewsInFailure(error: myResponse.error));
    }
  }
}
