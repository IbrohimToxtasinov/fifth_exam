class Flickr {
  Flickr({
    required this.small,
    required this.original,
  });

  List<dynamic> small;
  List<dynamic> original;

  factory Flickr.fromJson(Map<String, dynamic> json) => Flickr(
    small: List<dynamic>.from(json["small"].map((x) => x)),
    original: List<dynamic>.from(json["original"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "small": List<dynamic>.from(small.map((x) => x)),
    "original": List<dynamic>.from(original.map((x) => x)),
  };
}