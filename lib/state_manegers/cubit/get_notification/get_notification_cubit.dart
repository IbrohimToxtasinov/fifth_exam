import 'package:fifth_exam/data/database/loacal_databse.dart';
import 'package:fifth_exam/data/models/breaking_news/breaking_news_model.dart';
import 'package:fifth_exam/state_manegers/cubit/get_notification/get_notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreakingNewsCubit extends Cubit<BreakingNewsCubitState> {
  BreakingNewsCubit() : super(InitialBreakingNewsState()) {
    getAllBreakingNews();
  }

  getAllBreakingNews() {
    emit(LoadBreakingNewsProgress());
    LocalDatabase.getAllBreakingNews()
        .asStream()
        .listen((List<BreakingNewsModel> breakingNewsModel) {
      emit(LoadBreakingNewsSuccess(breakingNewsModel: breakingNewsModel));
    });
  }
}
