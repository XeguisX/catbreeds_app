class Cat {
  Cat({
    required this.id,
    required this.name,
    required this.origin,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.adaptability,
    required this.intelligence,
    required this.urlImage,
    this.referenceImageId,
  });

  String id;
  String name;
  String origin;
  String countryCode;
  String description;
  String lifeSpan;
  int adaptability;
  int intelligence;
  String urlImage;
  String? referenceImageId;
}
