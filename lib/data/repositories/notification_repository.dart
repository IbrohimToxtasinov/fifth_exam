import 'package:fifth_exam/data/database/loacal_databse.dart';
import 'package:fifth_exam/data/models/breaking_news/breaking_news_model.dart';

class BreakingNewsRepository {
  Future<BreakingNewsModel> addBreakingNews(
          {required BreakingNewsModel breakingNewsModel}) =>
      LocalDatabase.addBreakingNews(breakingNewsModel);

  Future<List<BreakingNewsModel>> getAllBreakingNews() =>
      LocalDatabase.getAllBreakingNews();

  Future<int> deleteBreakingNewsById({required int id}) =>
      LocalDatabase.deleteBreakingNewsById(id: id);
}
