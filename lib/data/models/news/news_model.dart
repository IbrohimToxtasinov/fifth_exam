import 'package:fifth_exam/data/models/news/core_model.dart';
import 'package:fifth_exam/data/models/news/crew_model.dart';
import 'package:fifth_exam/data/models/news/links_model.dart';

class NewsModel {
  NewsModel({
    required this.fairings,
    required this.links,
    required this.staticFireDateUtc,
    required this.staticFireDateUnix,
    required this.net,
    required this.window,
    required this.rocket,
    required this.success,
    required this.failures,
    required this.details,
    required this.crew,
    required this.ships,
    required this.capsules,
    required this.payloads,
    required this.launchpad,
    required this.flightNumber,
    required this.name,
    required this.dateUtc,
    required this.dateUnix,
    required this.dateLocal,
    required this.datePrecision,
    required this.upcoming,
    required this.cores,
    required this.autoUpdate,
    required this.tbd,
    required this.launchLibraryId,
    required this.id,
  });

  final dynamic fairings;
  final Links links;
  final dynamic staticFireDateUtc;
  final dynamic staticFireDateUnix;
  final bool net;
  final dynamic window;
  final String rocket;
  final bool success;
  final List<dynamic> failures;
  final dynamic details;
  final List<Crew> crew;
  final List<dynamic> ships;
  final List<String> capsules;
  final List<String> payloads;
  final String launchpad;
  final int flightNumber;
  final String name;
  final String dateUtc;
  final int dateUnix;
  final String dateLocal;
  final String datePrecision;
  final bool upcoming;
  final List<Core> cores;
  final bool autoUpdate;
  final bool tbd;
  final String launchLibraryId;
  final String id;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        fairings: json["fairings"] as String? ?? "",
        links: Links.fromJson(json["links"]),
        staticFireDateUtc: json["static_fire_date_utc"] as String? ?? "",
        staticFireDateUnix: json["static_fire_date_unix"] as String? ?? "",
        net: json["net"] as bool? ?? false,
        window: json["window"] as String? ?? "",
        rocket: json["rocket"] as String? ?? "",
        success: json["success"] as bool? ?? false,
        failures: List<dynamic>.from(json["failures"].map((x) => x)),
        details: json["details"] as String? ?? "",
        crew: List<Crew>.from(json["crew"].map((x) => Crew.fromJson(x))),
        ships: List<dynamic>.from(json["ships"].map((x) => x)),
        capsules: List<String>.from(json["capsules"].map((x) => x)),
        payloads: List<String>.from(json["payloads"].map((x) => x)),
        launchpad: json["launchpad"] as String? ?? "",
        flightNumber: json["flight_number"] as int? ?? 0,
        name: json["name"] as String? ?? "",
        dateUtc: json["dateUtc"] as String? ?? "",
        dateUnix: json["date_unix"] as int? ?? 0,
        dateLocal: json["dateLocal"] as String? ?? "",
        datePrecision: json["date_precision"] as String? ?? "",
        upcoming: json["upcoming"] as bool? ?? false,
        cores: List<Core>.from(json["cores"].map((x) => Core.fromJson(x))),
        autoUpdate: json["auto_update"] as bool? ?? false,
        tbd: json["tbd"] as bool? ?? false,
        launchLibraryId: json["launch_library_id"] as String? ?? "",
        id: json["id"] as String? ?? "",
      );

  Map<String, dynamic> toJson() => {
        "fairings": fairings,
        "links": links.toJson(),
        "static_fire_date_utc": staticFireDateUtc,
        "static_fire_date_unix": staticFireDateUnix,
        "net": net,
        "window": window,
        "rocket": rocket,
        "success": success,
        "failures": List<dynamic>.from(failures.map((x) => x)),
        "details": details,
        "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
        "ships": List<dynamic>.from(ships.map((x) => x)),
        "capsules": List<dynamic>.from(capsules.map((x) => x)),
        "payloads": List<dynamic>.from(payloads.map((x) => x)),
        "launchpad": launchpad,
        "flight_number": flightNumber,
        "name": name,
        "date_utc": dateUtc,
        "date_unix": dateUnix,
        "date_local": dateLocal,
        "date_precision": datePrecision,
        "upcoming": upcoming,
        "cores": List<dynamic>.from(cores.map((x) => x.toJson())),
        "auto_update": autoUpdate,
        "tbd": tbd,
        "launch_library_id": launchLibraryId,
        "id": id,
      };
}
