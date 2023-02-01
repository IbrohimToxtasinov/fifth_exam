class Crew {
  Crew({
    required this.crew,
    required this.role,
  });

  final String crew;
  final String role;

  factory Crew.fromJson(Map<String, dynamic> json) => Crew(
    crew: json["crew"] as String? ?? "",
    role: json["role"] as String? ?? "",
  );

  Map<String, dynamic> toJson() => {
    "crew": crew,
    "role": role,
  };
}