class Location {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  Location({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String? ?? 'https://via.placeholder.com/150',
    );
  }
}
