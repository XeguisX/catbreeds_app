import 'package:catbreeds_app/data/data_source/cat_data_source.dart';
import 'package:catbreeds_app/data/models/cat.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final catsViewModelProvider =
    StateNotifierProvider<CatsViewModel, AsyncValue<List<Cat>>>(
  (ref) => CatsViewModel(ref.read(catDataSourceProvider)),
);

class CatsViewModel extends StateNotifier<AsyncValue<List<Cat>>> {
  CatsViewModel(this._catDataSource)
      : super(const AsyncValue<List<Cat>>.loading());

  final CatDataSource _catDataSource;
  List<Cat> _cats = [];

  Future<void> getCats() async {
    try {
      state = const AsyncValue<List<Cat>>.loading();
      final cats = await _catDataSource.getCats();
      _cats = cats;
      state = AsyncValue<List<Cat>>.data(cats);
    } catch (e, st) {
      state = AsyncValue<List<Cat>>.error(e, st);
    }
  }

  void filter(String name) {
    final catsFiltered = _cats
        .where((cat) => cat.name.toUpperCase().startsWith(name.toUpperCase()))
        .toList();
    state = AsyncValue<List<Cat>>.data(catsFiltered);
  }
}
