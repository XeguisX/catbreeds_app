import 'package:catbreeds_app/data/data_source/http.dart';
import 'package:catbreeds_app/data/mappers/cat_mappers.dart';
import 'package:catbreeds_app/data/models/cat.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';

class CatDataSource {
  static const _path = 'v1/breeds';

  Future<List<Cat>> getCats() async {
    final jsonData = await httpGet(_path);

    final List<dynamic> catList = json.decode(jsonData);

    return catList.map((cat) => fromJsonCat(cat)).toList();
  }
}

final catDataSourceProvider = Provider<CatDataSource>((ref) => CatDataSource());
