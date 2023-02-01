class Core {
  Core({
    required this.core,
    required this.flight,
    required this.gridfins,
    required this.legs,
    required this.reused,
    required this.landingAttempt,
    required this.landingSuccess,
    required this.landingType,
    required this.landpad,
  });

  final String core;
  final int flight;
  final bool gridfins;
  final bool legs;
  final bool reused;
  final bool landingAttempt;
  final bool landingSuccess;
  final String landingType;
  final String landpad;

  factory Core.fromJson(Map<String, dynamic> json) => Core(
    core: json["core"] as String? ?? "",
    flight: json["flight"] as int? ?? 0,
    gridfins: json["gridfins"] as bool? ?? false,
    legs: json["legs"] as bool? ?? false,
    reused: json["reused"] as bool? ?? false,
    landingAttempt: json["landing_attempt"] as bool? ?? false,
    landingSuccess: json["landing_success"] as bool? ?? false,
    landingType: json["landing_type"] as String? ?? "",
    landpad: json["landpad"] as String? ?? "",
  );

  Map<String, dynamic> toJson() => {
    "core": core,
    "flight": flight,
    "gridfins": gridfins,
    "legs": legs,
    "reused": reused,
    "landing_attempt": landingAttempt,
    "landing_success": landingSuccess,
    "landing_type": landingType,
    "landpad": landpad,
  };
}