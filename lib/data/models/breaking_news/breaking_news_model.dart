class BreakingNewsFields {
  static String id = "id";
  static String dateTime = "dateTime";
  static String description = "description";
  static String newsTitle = "newsTitle";
  static String newsImage = "newsImage";
}

class BreakingNewsModel {
  final int? id;
  final String dateTime;
  final String description;
  final String newsTitle;
  final String newsImage;

  BreakingNewsModel(
      {this.id,
      required this.dateTime,
      required this.description,
      required this.newsTitle,
      required this.newsImage});

  BreakingNewsModel copyWith({
    int? id,
    String? dateTime,
    String? description,
    String? newsTitle,
    String? newsImage,
  }) =>
      BreakingNewsModel(
        id: id ?? this.id,
        dateTime: dateTime ?? this.dateTime,
        description: description ?? this.description,
        newsTitle: newsTitle ?? this.newsTitle,
        newsImage: newsImage ?? this.newsImage,
      );

  static BreakingNewsModel fromJson(Map<String, Object?> json) => BreakingNewsModel(
        id: json[BreakingNewsFields.id] as int? ?? 0,
        dateTime: json[BreakingNewsFields.dateTime] as String? ?? "",
        newsTitle: json[BreakingNewsFields.newsTitle] as String? ?? "",
        newsImage: json[BreakingNewsFields.newsImage] as String? ?? "",
        description: json[BreakingNewsFields.description] as String? ?? "",
      );

  Map<String, Object?> toJson() => {
        BreakingNewsFields.id: id,
        BreakingNewsFields.newsTitle: newsTitle,
        BreakingNewsFields.dateTime: dateTime,
        BreakingNewsFields.description: description,
        BreakingNewsFields.newsImage: newsImage,
      };
}
