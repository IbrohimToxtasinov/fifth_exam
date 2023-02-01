import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fifth_exam/data/models/my_response/my_response_model.dart';
import 'package:fifth_exam/data/models/news/news_model.dart';
import 'package:fifth_exam/data/services/api_service/api_service.dart';
import 'package:fifth_exam/utils/my_locale.dart';

part 'news_single_state.dart';

class NewsSingleStateCubit extends Cubit<NewsSingleState> {
  NewsSingleStateCubit() : super(NewsSingleState());

  fetchNewInfo() async {
    emit(NewsSingleState(status: Status.LOADING));
    MyResponse myResponse = await myLocator<ApiService>().getNews();
    if (myResponse.error == "") {
      emit(state.copyWith(newsModel: myResponse.data, status: Status.SUCCESS));
    } else {
      emit(state.copyWith(error: myResponse.error, status: Status.ERROR));
    }
  }
}
