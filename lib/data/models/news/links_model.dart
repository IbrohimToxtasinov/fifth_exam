import 'package:fifth_exam/data/models/news/flickr.dart';
import 'package:fifth_exam/data/models/news/patch_model.dart';
import 'package:fifth_exam/data/models/news/reddit_model.dart';

class Links {
  Links({
    required this.patch,
    required this.reddit,
    required this.flickr,
    required this.presskit,
    required this.webcast,
    required this.youtubeId,
    required this.article,
    required this.wikipedia,
  });

  final Patch patch;
  final Reddit reddit;
  final Flickr flickr;
  final String presskit;
  final String webcast;
  final String youtubeId;
  final String article;
  final String wikipedia;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    patch: Patch.fromJson(json["patch"]),
    reddit: Reddit.fromJson(json["reddit"]),
    flickr: Flickr.fromJson(json["flickr"]),
    presskit: json["presskit"]  as String? ?? "",
    webcast: json["webcast"] as String? ?? "",
    youtubeId: json["youtube_id"] as String? ?? "",
    article: json["article"] as String? ?? "",
    wikipedia: json["wikipedia"] as String? ?? "",
  );

  Map<String, dynamic> toJson() => {
    "patch": patch.toJson(),
    "reddit": reddit.toJson(),
    "flickr": flickr.toJson(),
    "presskit": presskit,
    "webcast": webcast,
    "youtube_id": youtubeId,
    "article": article,
    "wikipedia": wikipedia,
  };
}