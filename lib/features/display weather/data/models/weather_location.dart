class Location {
  String? name;
  String? region;

  Location({
    this.name,
    this.region,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
      };
}
