import 'package:catbreeds_app/data/models/cat.dart';

Cat fromJsonCat(Map<String, dynamic> json) => Cat(
      id: json["id"],
      name: json["name"],
      origin: json["origin"],
      countryCode: json["country_code"],
      description: json["description"],
      lifeSpan: json["life_span"],
      adaptability: json["adaptability"],
      intelligence: json["intelligence"],
      referenceImageId: json["reference_image_id"],
      urlImage: '',
    );
