import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_mobile_project/repository/Item.dart';

import '../DatabaseService.dart';

class ItemCubit extends Cubit<List<Item>> {
  DateTime _filteredDate = DateTime.now();

  ItemCubit(this._filteredDate) : super([]);

  void setFilteredDate(DateTime date) {
    _filteredDate = date;
    loadItemsByDate();
  }

  Future<void> loadItemsByDate() async {
    final items = await DatabaseService.getItemsByDate(_filteredDate);
    emit(items);
  }

  Future<void> deleteItem(String id) async {
    await DatabaseService.deleteItem(id);
    await loadItemsByDate();
  }

  Future<void> insertItem(Item item) async {
    await DatabaseService.insertItem(item);
    await loadItemsByDate();
  }
}
